require 'pathname'
rootdir = File.dirname(Pathname.new(__FILE__).realpath)

# The directory into which WebBlocks is built
WebBlocks.config[:build][:dir] = "#{rootdir}/../moodle/theme/uclashared"
WebBlocks.config[:build][:css][:dir] = 'style'
WebBlocks.config[:build][:img][:dir] = 'pix_blocks'
WebBlocks.config[:build][:js][:dir] = 'javascript'

# The directory where sources for the build are located
WebBlocks.config[:src][:dir] = "#{rootdir}/../moodle/theme/uclashared/src"

# Location of WebBlocks core components (config.rb, definitions, core adapter)
WebBlocks.config[:src][:core][:dir] = "#{rootdir}/../blocks/src/core"

# Location of WebBlocks adapters
WebBlocks.config[:src][:adapters][:dir] = "#{rootdir}/../moodle/theme/uclashared/src/adapter"

# WebBlocks.config[:src][:extension][:dir] = "#{rootdir}/../moodle/theme/uclashared/blocks/src/extension"
# WebBlocks.config[:src][:extensions] = []
# WebBlocks.config[:src][:extensions] << 'implicit-html'
# WebBlocks.config[:src][:extensions] << 'ucla'

# Scripts we want to include
WebBlocks.config[:build][:packages] = []
# WebBlocks.config[:build][:packages] << :jquery
# WebBlocks.config[:build][:packages] << :lettering
# WebBlocks.config[:build][:packages] << :modernizr
# WebBlocks.config[:build][:packages] << :respond
# WebBlocks.config[:build][:packages] << :selectivizr

WebBlocks.config[:src][:adapter] = 'ccle'
# WebBlocks.config[:src][:adapter] = false

WebBlocks.config[:src][:modules] = []
# Bring in the responsive grid
WebBlocks.config[:src][:modules] << 'base/structure'
WebBlocks.config[:src][:modules] << 'base/block'
WebBlocks.config[:src][:modules] << 'base/type'
# WebBlocks.config[:src][:modules] << 'entity/button'
WebBlocks.config[:src][:modules].delete 'entity'

# Enable debug
# WebBlocks.config[:build][:debug] = true

