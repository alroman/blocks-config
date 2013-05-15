Configuring WebBlocks for CCLE Moodle
=====================================

## Meeting basic requirements

You will need Ruby and Nodejs on your system to make this work. 

### Ruby
Currently tested using Ruby 1.9.3p327.  You can probably install this directly from your system repo, but avoid dependency issues with the different version of Ruby, it's a good idea to install Ruby via RVM (https://rvm.io/).  RVM will install itself in your home directory (in `~/.rvm`) and configure all dependencies automatically.  The easy way to install it is with a single command (from: https://rvm.io/rvm/install/ ):

```sh
$ \curl -L https://get.rvm.io | bash -s stable --ruby
```

Follow the setup instructions and modify your `.bashrc` as directed.

#### RVM with rvmrc
RVM allows you to setup projects with different version of Ruby.  To track these dependencies you can use an `.rvmrc` project file.  RVM can do this for you automatically.  If you're developing from vagrant image, then go to your `~/projects/moodle20/` folder and run this command:

```sh
$ rvm --rvmc --create 1.9.3@moodle-sass
```

That will use the dependencies from Ruby 1.9.3 for that particular project only.  The next time you revisit that folder, you will probably be prompted by RVM for permission to use the ```.rvmrc``` file.  

### Node.js

This also can be installed from your repo, or you can build it directly from source.  For Ubuntu users, this is the recommended way:

```sh
sudo apt-get update
sudo apt-get install python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs
```

That will add the `chris-lea/node.js` repo and install `node` and `npm` in your system.  

## The project folder structure
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

### Rakefile
Standard build file.  Defines the tasks that WebBlocks can run.  You will generally never have to change this file unless WebBlocks creates new build options.

### Rakefile-config.rb
Lets you turn on/off various build options for WebBlocks.  The most important one to know for now is the debug flag.  This flag will compile the CSS as human redable.  It will also print references to the SASS files that created the CSS rules.

```ruby
# Enable debug
WebBlocks.config[:build][:debug] = true
```

Most of the default packages are turned off, but we might eventually need them.  For now, understand the basic loading configuration:

```ruby
# Scripts we want to include
WebBlocks.config[:build][:packages] = []
# WebBlocks.config[:build][:packages] << :jquery
# WebBlocks.config[:build][:packages] << :lettering
# WebBlocks.config[:build][:packages] << :modernizr
# WebBlocks.config[:build][:packages] << :respond
# WebBlocks.config[:build][:packages] << :selectivizr

WebBlocks.config[:src][:adapter] = 'ccle'
# WebBlocks.config[:src][:adapter] = false
```

### Guardfile
For use with guard-rake (https://github.com/rubyist/guard-rake).  Once you have installed guard-rake (usually with `gem install guard-rake`), you can have it start monitoring your files like so:

```bash
guard start
```

Now, whenever you save changes to a `*.scss` file, it will trigger a `rake build_css` command via guard.  If you write bad SASS, guard will fail the build.  After you fix your SASS, you can trigger guard again by pressing `<enter>` at the prompt.

To exit guard, in the guard prompt type:
```bash
guard(main)> exit
```


## Setting up the project

I'm currently using my own fork of WebBlocks.  This defines an adapter for CCLE.  To checkout that repo run this in your `project` folder:

```bash
git clone git@github.com:alroman/WebBlocks.git blocks
cd blocks
git submodule init && git submodule update
cd -
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

After you have all your files in order, run `rake` to make sure WebBlocks sets up and downloads all your dependencies:

```bash
rake build
```

If all goes well, you will WebBlocks successfully building the project.
