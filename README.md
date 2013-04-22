blocks-config
=============

WebBlocks configuration files.  This is assuming you have Ruby and node.js installed.

## Rakefile
Standard build file.  Defines the tasks that WebBlocks can run.

## Rakefile-config.rb
Lets you turn on/off various build options for WebBlocks.

## Guardfile
For use with guard-rake (https://github.com/rubyist/guard-rake)

## Project folder structure
This is the assumed folder structure.  This is set up so that the build happens outside the `moodle` directory.  

Folder descriptions
* **moodle** - standard moodle folder
* **blocks** - webblocks folder
* **blocks-config** - this repository

```
\project
    \moodle
    \blocks
    \blocks-config
    Guardfile
    Rakefile
    Rakefile-config.rb
```

## Setting it up

I'm currently using my own fork of WebBlocks.  This defines an adapter for CCLE.  To checkout that repo run this in your `project` folder:

```bash
git clone git@github.com:alroman/WebBlocks.git blocks
```

Then get this repo:

```bash
git clone git@github.com:alroman/blocks-config.git
```

You can then create symlinks to the config files so that you don't have to copy them to you `project` folder:

```bash
ln -s blocks-config/Rakefile Rakefile
ln -s blocks-config/Rakefile-config.rb Rakefile-config.rb
ln -s blocks-config/Guardfile Guardfile
```
