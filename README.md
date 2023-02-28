# OpenModpackEngine

OpenModpackEngine is batch script for installing, managing and distributing modpacks without need of external/closed source apps like curseforge.

# Installation

Quick installation method! Just execute this command:

`@echo off && curl -s https://raw.githubusercontent.com/KRWCLASSIC/OpenModpackEngine/master/installer.bat | find /v ""  >temp.bat && type temp.bat | more +1 | find /v "" >installer.bat && del temp.bat && cls && call installer.bat`

This command downloads and executes installer.bat in path where command got executed so make sure you are executing this command in safe folder like "C:/Users/(Username)/Downloads".

In future i will add safety mechanism that automaticly changes to Downloads folder

# Updating

As for now you need to remove entire program and reinstall it from github, updating mechanism will be added in beta, OME is now in alpha stage so fresh installing is better to remove potential bugs

# Modding

When full version will be released i have plans to add modding feature, basicly you can make OME use modified version of my scripts. This could be used to add new features i dont want to add or just for customization reasons (e.g. Modified installer.bat that changes font color for entire "app")

# FAQ (F = May get, lmao)

- Is it safe? -
If you mean OME on its own - Yes, if you dont belive you can read the code.
If you mean OME as a platform - Depends, if OMEmodule was created using built in creator yeah, but they can be editted to include malicious things so be aware and make sure you are using safe OMEmodules
- Why is this written in batch?
Because its easy and i know enough about it to make smth with it.
- Is this README copied from OptiPack? -
Maybe?
