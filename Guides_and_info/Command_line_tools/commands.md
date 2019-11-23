Size of files and directories
$ du: Summarize disk usage of each FILE, recursively for directories.

Example: du -sh filename
* -h, --human-readable
* -s, --summarize
              display only a total for each argument

Compare files:
| Command | Explanation |
| --- | --- |
$ diff | This command is used to compare two files line by line.
$ cmp | This command is used to compare two files character by character.
$ comm | This command is used to compare two sorted files.
$ uniq | This command is used to filter the repeated lines in a file which are adjacent to each other

Compare directories:
dircmp: This command is used to compare the contents of directories.
 will print the source directories for a "i3blocks", and should work for any installed programs.
$ whereis

To list the current environmental variables with values:
$ printenv

see how many threads are available in the system
$ nproc

print system information -r(kernel-release) -m(machine hardware name)
$ uname -rm 

see disk space usage (-h human readble form)
$ df -h

i use to see hardware information. 
(-F --full)(-G --graphics)(-x extra)
$ inxi -FGx

# list pluged in devices
lsblk

# 
mhwd

# rename a folder
mv oldname/ newname/

# change screen resolution on virtual box
xrandr --output VGA-1 --mode 14490x900
# to see available modes
xradr

# i used to put iso file on a usb
# dd if=Downloads/myfile.iso of=/dev/sdb status="progress"
dd

######### Information
$ man %command%
$ info %command%
$ help %command%
$ %command% -h
$ %command% --help

Don't know what to look for?
$ apropos %something%

###### other
Check the Wikis (most troubleshoots work for all distros):
https://wiki.archlinux.org
https://wiki.gentoo.org

/g/'s Wiki on GNU/Linux:
https://wiki.installgentoo.com/index.php/Category:GNU/Linux

>What distro should I choose?
https://wiki.installgentoo.com/index.php/Babbies_First_Linux
>What are some cool programs?
https://wiki.archlinux.org/index.php/list_of_applications
https://directory.fsf.org/wiki/Main_Page
>What are some cool terminal commands?
http://www.commandlinefu.com/
http://cheat.sh/
>Where can I learn the command line?
http://mywiki.wooledge.org/BashGuide
http://linuxcommand.org/tlcl.php
http://www.grymoire.com/Unix/
>Where can I learn more about Free Software?
https://www.gnu.org/philosophy/philosophy.html
>How to break out of the botnet?
https://prism-break.org/en/categories/gnu-linux

/fglt/'s website and copypasta collection:
http://fglt.nl && https://p.teknik.io/wJ9Zy
