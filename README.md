# Bash Scripts

## .bashrc

### Description

Copy of my .bashrc file and scripts. Contains functions for faster Git usage and filesystem navigation, as well as some misc. additions.\

Main feature is the "@" function which acts like a super "cd", matching partial strings to the first matching directory iname within a depth of 3.\

A directory or directory alias can be supplied before the "@" for more efficient navigations.\

TODO: list functions here

### Setup

This .bashrc and set of scripts assumes a certain directory structure. You can set the root directory as anything, in the current version this entails\
setting the `root` variable in .bashrc and nav.bash (TODO: only set in .bashrc, or create onboarding script). From there, the most effective development setup\
I have found is creating a `Developer` directory (MacOS recognizes this as special, set under `/Users/<your-user>`) or `tmp` under root/your user (Windows).\ 
(TODO: *nix best practice). Under this development directory, create a `workspace` (projects), `releases` (deployable versions), and `tools` directory.\
I have all things Bash live in `tools` under a `bash-scripts` directory. There's a symlink `.bashrc` under my root directory - where .bashrc is typically\
created - pointing at the `.bashrc` in `bash-scripts`.

### Examples

Using "cd" functions: `tls scripts` - this will navigate to ~/Developer/tools/scripts.

Using "@": `ws @ project` - this will navigate to ~/Developer/workspace and then to the first directory whose name contains "project".

This is useful for quick navigation as something like `tools @ apache-tomcat-9` will navigate all the way to ~/Developer/tools/apache/tomcat/apache-tomcat-9.x.x in one command.\
I typically use the shortest unique string I can think of, i.e.: `ws @ pi` to navigate to .../
