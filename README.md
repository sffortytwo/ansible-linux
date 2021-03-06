# Ansible Linux

Playbooks to set up Linux. Includes roles for WSL2.

## The roles

Here is a description of the various roles and what they do.

### begin

> Always comes first

Sets up `pathvar`, which is used by `end`.

### end

> Always comes last

Sets up the `.sh_paths` files and dumps `pathvar`, after other roles have had a chance to add to it.

### packages

Various OS packages.

### shell

Basic shell setup.

### fonts

Fonts for use by different programs.

### wsl2

WSL2 support files.

### ohmyzsh

The oh-my-zsh shell environment.

### aws

Support for AWS CLI.

### desktop

> You must rename your Gnome Terminal Profile before this role will work

![gnome-terminal](pictures/gnome-terminal.png)

Adjustments to various GUI appl (e.g. Gnome Terminal).

### rust

Support for the Rust language (also needed for `shell_enhancements`).

### shell_enhancements

Rust-based shell enhancements.

### gitconfig

Configurations for Git.
