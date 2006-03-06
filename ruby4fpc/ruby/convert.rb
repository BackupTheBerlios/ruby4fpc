#!/usr/local/bin/ruby

class lpNode
  attr_writer :Owner

  def initialize (aOwner = nil)
    @Owner = aOwner;
  end;
end;

class lpVariable < lpNode
  attr_writer :name
end


require 'getoptlong';

rubydir = "/usr/local/lib/ruby/1.8/i686-linux/";

opts = GetoptLong.new([ "--libdir",    "-d",            GetoptLong::REQUIRED_ARGUMENT ])

opts.each do |opt, arg|
  case opt;
    when "--libdir";
      rubydir = arg;
  end;
end



puts rubydir;