# GitBash Scripts

## .bashrc
### Description
Copy of my .bashrc file, contains functions for faster Git usage and filesystem navigation.\
Main feature is the "@" function which allows quick navigation by attempting to match the supplied string to any directory within a depth of 3.

Additionally, each function acts as a "cd" allowing input afterwards.

### Examples
Using "cd" functions: `tmp scripts` - this will navigate to /c/tmp/scripts.

Using "@": `workspace @ project` - this will navigate to /c/tmp/workspace and then to the first directory whose name contains "project".

This is useful for quick navigation as something like `tools @ apache-tomcat-9` will navigate all the way to /c/tmp/tools/apache/tomcat/apache-tomcat-9.x.x in one command.
