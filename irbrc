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

# Enable ri in irb
def ri arg
   puts `ri #{arg}`
end

class Module
   def ri(meth=nil)
     if meth
       if instance_methods(false).include? meth.to_s
         puts `ri #{self}##{meth}`
       else
         super
       end
     else
       puts `ri #{self}`
     end
   end
end
# Now you can do:
# irb> String.ri
# irb> ri String  # same as above
# irb> String.ri 'reverse'
# irb> ri 'File.new'