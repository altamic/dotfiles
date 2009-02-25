# ~/.irbrc file

# From http://giantrobots.thoughtbot.com/2008/12/23/script-console-tips
require 'rubygems'
require 'wirble'
Wirble.init
Wirble.colorize

# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

# vim-like quit
alias q exit

# Log to STDOUT if in Rails
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
  require 'logger'
  RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

# auto indent
IRB.conf[:AUTO_INDENT]=true

# pretty printing
require 'pp'