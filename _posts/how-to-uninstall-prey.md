---
layout: post
title: How to Uninstall Prey
categories: [setup]
tags: [uninstall, devices]
summary: .
---
* Table of Contents
{:toc}
* * *

This article will guide you on the Prey uninstall process for:

1. Windows.
2. OS X and Linux.
3. Android.
4. iOS.

# Before We Start

We're sorry that you want to uninstall Prey. In case you don't know how to use the software, please check our articles on [what Prey is](overview.md) and [how to track your stolen devices](how-to-track-a-stolen-device.md).

## 1. Windows

There's an `Uninstall.exe ` file located in the Prey install folder, `C:\Windows\Prey` by default. Double-clicking on that will remove all traces of Prey, provided that you have administrator rights on the computer.

If the `Uninstaller.exe` file is not available, then it means that Prey was installed using the MSI packages. That's intended for corporate environments, and to uninstall Prey you'll need to **run the MSI installer again**. Just grab the [latest MSI package for Prey][prey-node-releases], run, and then follow the instructions.

#### This Still Doesn't Work

Something could have gone terribly wrong, and for some reason you could still be unable to uninstall Prey using the previous methods. If that's the case, please follow these steps:

1. Hit the `Windows` + the `R` keys on the device at the same.
2. On that little prompt type `services.msc` and hit Enter.
3. Look for ` Cron Service` and right-click on it to check its `Properties`.
4. Disable it from running on startup and apply changes.
5. Reboot the system.
6. Manually delete the Prey folder located on `C:\Windows\Prey` by default.
7. Hit `Windows` + `R` again and now run `regedit.exe`.
8. Delete all entries that include `prey` from:
  1. `HKEY_LOCAL_MACHINE`
  2. `SOFTWARE/Prey`
  3. `Wow6432Node/Prey` (if you're running a 64-bits system)
  4. `SOFTWARE/Prey`
9. Manually run the installer again to install Prey into your system.
10. Run now the `Uninstall.exe` file to remove all traces of Prey.

## OS X and Linux

Removing Prey from Unix-based systems is quite straightforward. You just need to open a terminal ([OS X](https://www.youtube.com/watch?v=zw7Nd67_aFw), [Linux](https://www.youtube.com/watch?v=7Kvgbu61jFg)) and run the following command:

    sudo /usr/lib/prey/current/bin/prey config hooks pre_uninstall && sudo rm -rf /usr/lib/prey /var/log/prey.log /etc/prey

That will effectively delete all traces of Prey from your system.

## Android

Prey for Android is a bit difficult to remove because thieves shouldn't have it easy. If you're sure you don't need this protection anymore, please follow these instructions:

1. On the device, go to `Global Settings` > `Security` > `Device administrators`.
2. Disable permissions for Prey.
3. Uninstall Prey as any other app.

## iOS

iPhones and iPads don't support any kind of special protection for apps, so you should be able to uninstall Prey as any other.

******************************

# Troubleshooting and Known Issues

Please use the [contact form][contact-form] from your [Prey account][prey-account] in case you still can't remove Prey. We're always glad to assist you.

[support-home]: /help "Prey Support"
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
