require 'pathname'
rootdir = File.dirname(Pathname.new(__FILE__).realpath)

class WebBlocks
  attr_accessor :path
  def initialize(path)
    @path = path
  end
  def rake(command = '')
    Dir.chdir @path do
        rootdir = File.dirname(Pathname.new(__FILE__).realpath)
        sh "rake #{command} -- --config=#{rootdir}/Rakefile-config.rb"
    end
  end
end

blocks = WebBlocks.new('blocks')

include Rake::DSL
task :default => [:_init] do
  blocks.rake
end
task :init => [:_init] do
  blocks.rake 'init'
end
task :build => [:_init] do
  blocks.rake 'build'
end
task :build_all => [:_init] do
  blocks.rake 'build_all'
end
task :build_css => [:_init] do
  blocks.rake 'build_css'
end
task :build_img => [:_init] do
  blocks.rake 'build_img'
end
task :build_js => [:_init] do
  blocks.rake 'build_js'
end
task :clean => [:_init] do
  blocks.rake 'clean'
end
task :clean_packages => [:_init] do
  blocks.rake 'clean_packages'
end
task :clean_all => [:_init] do
  blocks.rake 'clean_all'
end
task :reset_packages => [:_init] do
  blocks.rake 'reset_packages'
end
task :reset => [:_init] do
  blocks.rake 'reset'
end


task :_init do
  # IO.popen("git rev-parse --show-toplevel") do |io|
  #   Dir.chdir(io.gets.strip) do
  #     sh "git submodule init"
  #     sh "git submodule update"
  #   end
  # end
  Dir.chdir('blocks') do
    sh "bundle"
    sh "npm install"
  end
end