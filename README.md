# VK Basic Linux Administration
Fall 2021

## deb package
- You need to build a .deb package that delivers an additional sudoers configuration file to /etc/sudoers.d.
- The package should bring any directory tree of your choice for an additional user.
- The package must create an additional user named domashka.
- The package must create an additional group called domashkagroup which this user will belong to.
- The package should set all rights for this user on your directory tree, read rights for the contents of directories and for reading files inside for the group, and no rights for others.
- Also, this user, with superuser rights, should be able to execute the command `systemctl restart ntpd` (sudoers).

## bash script
- Write a bash script that takes three arguments as input:
  `./script.sh <search pattern> <include|exclude> <filelist>`
- `<search pattern>` is a substring to search for.
  `<include|exclude>` - include outputs all lines that contain `<search pattern>`, exclude outputs all lines that do not contain `<search pattern>`.
- `<filelist>` - is a path to a file with a list of files to go through and output all lines according to the include or exclude filter.
  Example content of /tmp/filelist:
```
/tmp/file1
/tmp/file2
/ets/fileconfig1
```
- Example of running the script: ./script.sh text include /tmp/filelist
- If the filter is not include/exclude, the script should output an error about the wrong filter and not output anything.
- If the filelist has more than 10 entries, the script should output an error that the filelist is too long and not output anything.
