afcclient
=========

A simple CLI interface to AFC via libimobiledevice by Eric Monti.
Adapted to run on Ubuntu 22.10, Linux 6.2.12 x86_64 (2023) using particular versions of various dependencies as part of a broader project by WugtheFlunk. See LICENSE.txt for further details.


## Requirements - TBD

- libimobiledevice (v 1.1.5+)
  https://github.com/libimobiledevice/libimobiledevice

- For building, clang is also required (support for Blocks).

- On Linux you will need the BlocksRuntime development libs. On Ubuntu the package is called 'libblocksruntime-dev'.

## Building

    $ make

## Usage
Usage: afcclient [rs:c:d:u:vh] command cmdargs...

     Options:
        -r, --root                 Use the afc2 server if jailbroken (ignored with -c/-d)
        -s, --service=NAME>        Use the specified lockdown service (ignored with -c/-d)
        -c, --container=<APP-ID>   Access dir for app-id (may not work on newer iOS vers)
        -d, --documents=<APP-ID>   Access doc dir for app-id (prefix paths with Documents/)
        -u, --uuid=<UDID>          Specify the device udid
        -v, --verbose              Enable verbose debug messages
        -h, --help                 Display this help message

      Where "command" and "cmdargs..." are as folows:
        devinfo                    dump device info from AFC server
        ls/list <dir> [dir2...]    list remote directory contents
        info <path> [path2...]     dump remote file information
        mkdir <path> [path2...]    create directory at path
        rm <path> [path2...]       remove directory at path
        rename <from> <to>         rename path 'from' to path 'to'
        link <target> <link>       create a hard-link from 'link' to 'target'
        symlink <target> <link>    create a symbolic-link from 'link' to 'target'
        cat <path>                 cat contents of <path> to stdout
        get <path> [localpath]     download a file (default: current dir)
        put <localpath> [path]     upload a file (default: remote top-level dir)

## Known Issues / TODO

- listing output is fugly
