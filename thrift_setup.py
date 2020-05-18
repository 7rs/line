from typing import List
import sys
import os
import shutil

from loguru import logger


def setup_logger():
    log_format = (
        "<blue>{time:%s}:{process}</blue> <cyan>{name}:{line}</cyan> <level>{level: <8} | {message}</level>"
        % ("YYYY-MM-DD-HH:mm:ss.SSS")
    )

    logger.remove()
    logger.add(sys.stdout, level="INFO", colorize=True, format=log_format)
    # logger.add("logs/linelib.log", level="DEBUG", format=log_format, rotation="1 MB", retention=10)


def mkdir(name: str):
    if os.path.isdir(name):
        shutil.rmtree(name)
        logger.info("[!] Deleted old files")

    os.mkdir(name)
    logger.info(f"[*] Created dir: '{name}'")


def execute(dir_name: str, lang: str):
    os.system("ls service | xargs -I {} thrift --out %s --gen %s service/{}" % (dir_name, lang))
    logger.info("[*] Thrift executed successfully")


def get_line_services(name: str) -> List[str]:
    services = [name + "/" + service for service in os.listdir(name) if service != "__init__.py"]
    logger.info(f"[*] Services: {len(services)}")
    return services


def get_service_files(path: str) -> List[str]:
    return [path + "/" + file for file in os.listdir(path)]


def edit_ttypes(name: str, file: str):
    with open(file, "r") as reader:
        code = reader.read()

    lines = code.split("\n")
    imported_service = ""
    for i in range(len(lines)):
        line = lines[i]

        if "import " in line and ".ttypes" in line:
            imported_service = line[len("import ") : line.find(".ttypes")]
            lines[i] = line.replace(line, f"from {name} import {imported_service}")

    with open(file, "w") as writer:
        writer.write("\n".join(lines))


def edit_files(dir_name: str, service_files: List[str]):
    for file in service_files:
        name = file.rpartition("/")[-1]

        if name in ["constants.py", "__init__.py"] or name.endswith("-remote"):
            os.remove(file)
            logger.info(f"[!] Removed: {file}")
        elif name == "ttypes.py":
            edit_ttypes(dir_name, file)
            logger.info(f"[*] Edited: {file}")


def edit_services(name: str, services: List[str]):
    for service in services:
        edit_files(name, get_service_files(service))


def main():
    name = "line_service"

    # Deletes files if exists old files
    # Creates 'line_service'
    mkdir(name)

    # Executes Thrift
    execute(name, "py")

    # Gets service dirs
    services = get_line_services(name)

    # Edits services
    edit_services(name, services)


if __name__ == "__main__":
    main()
