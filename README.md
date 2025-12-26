# GitBash Scripts

## .bashrc

### Description

Copy of my .bashrc file, contains functions for faster Git usage and filesystem navigation.\
Main feature is the "@" function which allows quick navigation by attempting to match the supplied string to any file or directory within a depth of 3.

TODO: list functions here

### Examples

Using "cd" functions: `tls scripts` - this will navigate to /c/tmp/tools/scripts.

Using "@": `workspace @ project` - this will navigate to /c/tmp/workspace and then to the first directory whose name contains "project".

This is useful for quick navigation as something like `tools @ apache-tomcat-9` will navigate all the way to /c/tmp/tools/apache/tomcat/apache-tomcat-9.x.x in one command.
