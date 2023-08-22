#GRUB #GRUB_UNIX 

## Intro

A boot loader is one of the most important components of Linux operating systems boot process

## Grand Unified Bootloader(GRUB)

The boot process on Linux is a series of activities that occur from the time you press the power on button on your PC until the login screen appears

## Stages of boot process

There are four main stages in the boot process

1. BIOS
    1. mainly responsible for loading the bootloader
    2. When the computer starts, it runs a Power On Self Test(POST) to make sure that the core hardware such as memory and hard disk is working properly
    3. Afterwards, the BIOS will check the primary hard drives Master Boot Record(MBR), which is a section on your hard drive where the bootloader is located
2. Bootloader
    1. Loads the kernel into RAM with a set of kernel parameters
3. Kernel
    1. The kernel primary function is to initialize devices and memory
    2. Afterwards it loads the init process
4. Init
    1. Responsible for starting and stopping essential services on your system

GRUB is mainly responsible for providing you with an options menu from which you can select the operating system or environment that you want to boot into

GRUB is not only limited to booting into Linux operating system, you can also use it to boot into other operating systems such as windows

## The Role of GRUB

- Once you select the operating system to boot into, GRUB will load the selected kernel
- GRUB uses kernel parameters to know where the kernel is located and other important parameters to use
    1. initrd
        1. used for specifying the initial RAM disk
    2. BOOT_IMAGE
        1. the location of the linux kernel image
    3. root
        1. specifies the location of root file system, used by the kernel to find init which in turn loads the critical services
    4. ro
        1. responsible for mounting the file system in read-only mode
    5. quiet
        1. hides some system specific messages as your PC is booting
    6. splash
        1. used for displaying the splash screen when your system is booting
- When you are in the GRUB options menu, you can edit kernel parameters by pressing the “E” key
- GRUB 2 gives you a lot of flexibility and power when it comes to configuring your bootloader
- The /boot/grub directory contains a file named “grub.cfg” which is the main configuration file for GRUB
- However, it is advised not to edit the grub.cfg file directly, instead you should edit the “/etc/default/grub” file
- When you make changes to the “/etc/default/grub” file, you should make sure to run the command below, so that your changes are written to the grub.cfg file automatically
    - sudo update-grub


Resources -> [[Linux & Unix/Resources|Resources]] #GRUB 
 