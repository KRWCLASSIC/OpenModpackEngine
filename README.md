# OpenModpackEngine

OpenModpackEngine is batch script for installing, managing and distributing modpacks without need of external/closed source apps like curseforge.

# Installation

Quick installation method! Just execute this command, OME will download itself in your Downloads folder:

`@echo off && cd %USERPROFILE%/Downloads && curl -s https://raw.githubusercontent.com/KRWCLASSIC/OpenModpackEngine/master/installer.bat | find /v ""  >temp.bat && type temp.bat | more +1 | find /v "" >installer.bat && del temp.bat && cls && call installer.bat`

# Updating

As for now you need to remove entire program and reinstall it from github (Or using new quick method), updating mechanism will be added in beta, OME is now in alpha stage so fresh installing is better to remove potential bugs

# Adding OMEmodules

Now there are 2 ways of doing this:

1) Main Menu -> Settings -> Import OMEmodules. (Mostly automated)
2) Main Menu -> Open OMEmodules folder. (Mostly manual)

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
