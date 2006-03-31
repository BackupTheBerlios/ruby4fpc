#!/usr/local/bin/ruby
require 'process.rb';

TESTSDIR = "tests/";

tests = StepByStep.new();

files = Dir[TESTSDIR + "test*"];

files.each {|file|
  if FileTest.executable?(file) then
    tests.addStep(file, "Running Test: "+file, true);
  end;
}

tests.process();