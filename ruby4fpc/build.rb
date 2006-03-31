#!/usr/local/bin/ruby
require 'process.rb'
# Author: Jon (BadQuanta) Sawyer

build = StepByStep.new();
build.addStep("rm `find ./ -name \"*~\"`",  "Cleaning Backupfiles", false);
build.addStep("fpcmake -r",                 "Creating Makefiles",true);
build.addStep("make clean",                 "Cleaning Project",false);
build.addStep("make",                       "Building Project",true);
build.addStep("make examples",              "Building Tests", true);
build.addStep("./tests/run-tests.rb",       "Running Tests",true);

build.process();
