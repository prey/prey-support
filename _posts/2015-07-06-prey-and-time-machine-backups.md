---
layout: post
title: How to Manage Your Old MacBook After a Time Machine Restore
categories: [setup]
tags: [install, account, devices, time machine, os x]
summary: Learn how to fix any cloned device from a Time Machine backup, or from any other tool.
---
* Table of Contents
{:toc}
* * *

This article will guide you on how to fix any nasty surprise after system backups. It will show you how to:

1. Split cloned devices.
2. Protect your newly added laptops.
3. Make sure that Prey runs properly on both computers.

# Before We Start

**Under no circumstance delete the computer from your Prey account.** If you do that you won't be able to track the former laptop, specially if it was lost or stolen. Please be patient, follow the guide below, and you'll start getting reports from your stolen laptop.

# What's Time Machine, What Goes Wrong and Why Does It Happen

Time Machine's an app for OS X that constantly backups all the changes on your operating system. It can be used to restore a computer to a previous state, or to restore its full setup into another, which means that it could successfully transfer all your data from a stolen device into a new one. While this is extremely useful for almost all your running applications, it will clone your device on your Prey account due to our software's setup process.

Prey saves your device's unique information on the `prey.conf` file located either on `C:\Windows\Prey` (Windows) or `/etc/prey` (OS X and Linux). This file includes your account's unique *API Key* on line 36, and your device's unique *Device Key* on line 39. It looks like this:

    # Your account's API key.
    api_key = 1a2b3c4d5e6f

    # Your device's unique key.
    device_key = 1a2b3c

All devices under your account should have the same `api_key` value, which you can find at the bottom-left corner on your [Prey account's settings][subscribe]. **None** of them should have the same `device_key`, though, or the Prey servers will have no way to tell a device from another, and this is exactly what happens after a Time Machine restore. But don't worry. Nothing is lost.

## 1. How to Split Cloned Devices

Now that we know what's wrong (the same `device_key` on both computers) we can easily fix this. To do that, please.

1. **Completely uninstall Prey** from the restored computer using the methods below.
2. Once the process is done, just **reinstall Prey** on your computer. It will show up on your Prey account.

### OS X and Linux

Open terminal and run the following command:

    sudo /usr/lib/prey/current/bin/prey config hooks pre_uninstall && sudo rm -rf /usr/lib/prey /var/log/prey.log /etc/prey

### Windows

Run the `Uninstall.exe` file located in `C:\Windows\Prey` to uninstall Prey, and then make sure to delete the `prey.conf` file located in that same directory.

## 2. Make Sure that Your New Laptop Is Protected

Once the previous process is complete, please go to your [Prey account][prey-account] to check for the new device on your account. Provided that you had available device slots, it should be there by now. To verify its `device_key` you can see the URL to the device on your Prey account, and compare it to the one on line 39 of the `prey.conf` file.

For example, line 39 of the `prey.conf` file for the device `https://panel.preyproject.com/devices/1a2b3c` should read like this:

    device_key = 1a2b3c

Once the `device_key` for your newly added computer is the same as its URL on your Prey account, we're all set.

## 3. Make Sure that Prey Is Running On Both Computers

We're all set with the new laptop, though we still don't know if everything is right on the former one. It's not an easy task to confirm that a stolen computer is reporting properly until it does, because as you might already know, [Prey requires the devices to be connected to the internet to get you reports](2015-03-24-how-to-track-a-stolen-device.md). The important thing here is that once both clones computers are split up, the old one will remain as the old entry on your Prey account, and all reports that arrive will be from that stolen or lost device. Please be patient until the information arrives. [It will][recoveries].

******************************

# Troubleshooting and Known Issues

If you're sure that you deleted the `prey.conf` file after the uninstall process, and after installing Prey you still don't get a separate device, please [contact us][contact-form] and let us know. Due to hardware information, it could happen that the device is recognized as the old one. It's not likely, though still possible.

## My problem is not listed

Please use the [contact form][contact-form] from your [Prey account][prey-account]. We're always glad to help.

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
