#!/usr/local/bin/ruby -w
require 'process.rb'
# Author: Jon (BadQuanta) Sawyer

build = StepByStep.new();
build.addStep("rm `find ./ -name \"*~\"`",  "Cleaning Backup files", false, true);
build.addStep("fpcmake -r",                 "Creating Makefiles",true, true);
build.addStep("make clean",                 "Cleaning Project",false, true);
build.addStep("make",                       "Building Project",true, true);
build.addStep("make examples",              "Building Tests",true, true);
build.addStep("./tests/run-tests.rb",       "Running Tests",true, false);
build.process();