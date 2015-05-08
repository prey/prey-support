---
layout: post
title: Prey Unattended and Image Install
categories: [setup]
tags: [install, mass deployment, image deployment, unattended install]
summary: How to automate the Prey install process, and deploy the software on a fleet of devices.  
---
* Table of Contents
{:toc}
* * *

This article will guide you in the unattended install process for:

1. Windows
2. Mac OS X
3. GNU/Linux
4. Android

And also in the image deployment for:

1. Windows
2. Mac OS X
3. Linux

## Before We Start

Download the latest Prey installers for laptops from our [GitHub releases page][prey-node-releases]. You can ignore this if you're installing into mobiles.

You can find your API Key on your account settings, white over blue at the bottom-left corner of the screen.

![Your API Key](/_images/2015-03-26-prey-unattended-install-for-mass-deployment-1.png)

# Unattended Install

## 1. Windows    

There are two different installation methods for Windows, an `EXE` and an `MSI` installers. Both will work and install Prey on your systems, with two main differences.

1. The `MSI` package is completely silent. There won't be any user dialog when installing. Any error will break the installation, and the output be written into a log file. No uninstaller file will be created.
2. The `EXE` package requires a few clicks, will create an uninstaller, and will remove any previous Prey installation.

### MSI Installer

Run the command prompt [as an admin][admin-cmd], and run the following command on it:

    msiexec.exe /i prey-windows-1.X.X-x64.msi /lv installer.log /q AGREETOLICENSE=yes API_KEY=foobar123

Which should look like this:

![MSI CMD instruction](/_images/2015-03-26-prey-unattended-install-for-mass-deployment-2.png)

If you need a confirmation message at the end of the process, you can change the `/q` parameter to `/qn+`. Otherwise it will be silent.

This method will fail on computers without an internet connection. In order to disable the immediate validation against the Prey servers just add the `SKIP_VALIDATION=yes` parameter. In that case, the command would look like this:

    msiexec.exe /i prey-windows-1.X.X-x64.msi /lv installer.log /qn+ AGREETOLICENSE=yes API_KEY=foobar123 SKIP_VALIDATION=yes

### EXE Installer

The `EXE` installer is more oriented to individual users, not to organizations. It will require a few clicks even on its most silent mode, and will create an uninstaller in case you need it in the future. To get an unattended install of the `EXE` file run the command prompt [as an admin][admin-cmd] and run:

    prey-windows-1.X.X-x64.exe /S /API_KEY=foobar123

The command should gracefully look like this:

![EXE CMD instruction](/_images/2015-03-26-prey-unattended-install-for-mass-deployment-3.png)

The `/S` parameter makes the installation silent, though it can't be *completely* silent. For that please prefer the MSI method.

## Mac OS X

Open a terminal and run the following command:

    API_KEY=foobar123 sudo -E installer -pkg prey-mac-1.X.X-x86.pkg -target /

![Mac OS X instruction](/_images/2015-03-26-prey-unattended-install-for-mass-deployment-4.png)

**Important:** You *must* pass a valid API_KEY value of the process won't work.

The script will actually check if the key is valid and if the account has available slots before copying anything to disk. This means that if the `API_KEY` verification fails, the install process will exit with a fatal error and it won't copy anything.

## Linux

### Ubuntu and Debian-based Distributions

Run the following commands on a terminal:

    sudo apt-get update
    API_KEY=foobar123 sudo -E dpkg -i prey_1.X.X_amd64.deb

![Ubuntu instructions](/_images/2015-03-26-prey-unattended-install-for-mass-deployment-5.png)

In case dependencies aren't found, just run these two additional commands:

    sudo apt-get -f install
    API_KEY=foobar123 sudo -E dpkg -i prey_1.X.X_amd64.deb

### npm

    npm install -g prey # this will make the 'prey' command available system-wide
    sudo prey hooks post_install
    sudo prey config account authorize -a foobar123 # foobar123 is your API key

## Android

While there's not a set of instructions that you can use for an unattended install on Android, we can provide custom APK installers with your account information so you don't have to enter your Prey email and password on each device. These are reviewed and packaged on demand for eligible organizations with a fleet of Android devices. [Contact us][contact-form] for more information.

******************************

# Image Deployment

To image deploy Prey on your computers is simple. Steps must be followed entirely, though, or bad things might happen. The most important part is that **Prey must be the last app to be installed on the master machine.** You can't connect it to the internet after this process or you'll get cloned machines on your Prey account.

Once you're done with everything else and you are ready to setup Prey,
 
1. Install the regular Prey package on the master machine, double clicking on the installer.
2. When the process finishes just close the config dialog. **Do not enter your account's credentials.** We can't insist enough on this.
3. **Disconnect from the internet.**
4. Edit the `prey.conf` file and add your API Key to line 36. The location of the file is:
	- Windows: `C:\Windows\Prey`
	- Mac OS X & Linux: `/etc/prey/prey.conf`
5. Save changes.

**Do not connect to the internet.**

Now you can deploy the image into other computers. As soon as the new devices connect to the internet they'll be added to your Prey account.

******************************

# Troubleshooting and Known Issues

### Cloned Devices From an Unattended Install

Device registration is based on hardware. Sometimes manufacturers don't assign a serial number to all computers they sell, and it ends up being "To Be Filled by O.E.M." In this case, Prey won't be able to tell that those are separate devices, and they will share the same `device key`. That means that a single device entry on your Prey account will manage several computers, the one sharing hardware information.

To prevent this from happening you can disable the "Overwrite devices if their hardware information already exists on this account" option from the [Device Management][device-management] settings and install Prey again. Unfortunately this is only available for accounts with 100 or more device slots. If this affects you, please [contact us][contact-form] to get it fixed.

### Cloned Devices From Image Deployment

If the previous case doesn't fix the problem, then it means that you connected the master machine to the internet after installing Prey. That made it create the device on your Prey account, and then it cloned that same configuration to all other computers. To fix that, completely uninstall Prey and start again.

[support-home]: # "Prey Support"
[prey-account]: https://panel.preyproject.com/ "Prey account"
[download]: https://preyproject.com/download "Download Prey"
[recoveries]: https://preyproject.com/blog/cat/recoveries "Prey recovery stories"
[recommended-settings]: # "Prey recommended settings"
[sign-up]: https://panel.preyproject.com/signup "Signup to Prey"
[appstore]: https://itunes.apple.com/app/id456755037 "Prey for iPhone, iPad, and iPod"
[google-play]: https://play.google.com/store/apps/details?id=com.prey "Prey for Android"
[contact-form]: # "Prey contact"
[plans]: https://preyproject.com/plans "Prey Pro"
[subscribe]: https://panel.preyproject.com/settings/account "Subscribe to Prey"
[business]: https://preyproject.com/business/ "Prey for Business"
[education]: https://preyproject.com/education/ "Prey for Education"
[prey-node-releases]: https://github.com/prey/prey-node-client/releases
[admin-cmd]: https://www.youtube.com/watch?v=EohzkYPV6nI
[device-management]: https://panel.preyproject.com/settings/devices
