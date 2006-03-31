#!/usr/local/bin/ruby

require 'process.rb';

commit = StepByStep.new();

commit.addStep("./build.rb commit", "Building & Testing", true, true);
commit.addStep("make clean", "Cleaning Project", false, true);
commit.addStep("rm -v `find ./ -name \"Makefile\"`", "Removing Makefiles", false, true);  
commit.addStep("cvs commit", "Commiting!!!", false, false);

commit.process();