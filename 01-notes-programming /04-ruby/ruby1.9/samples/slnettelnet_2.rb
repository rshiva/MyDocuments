#---
# Excerpted from "Programming Ruby",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/ruby3 for more book information.
#---
      require 'net/telnet'
#      tn = Net::Telnet.new({})     {|str| print str }
#      tn.login("guest", "secret")  {|str| print str }
#      tn.cmd("date")               {|str| print str }
#      tn.close
puts %{Connected\ to\ localhost.
Darwin/BSD (dave-2.home) (ttys012)
login: guest
Password:Last login: Thu Mar  5 13:23:25 from 0.0.0.0
$ date
#{`date`.chomp}
$
}
