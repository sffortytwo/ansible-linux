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
