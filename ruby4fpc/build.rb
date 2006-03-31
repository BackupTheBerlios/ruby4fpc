#!/usr/local/bin/ruby -w
require 'process.rb'
# Author: Jon (BadQuanta) Sawyer

build = StepByStep.new();
# Generate the Linelog... (project size tracking)
now = Time.now();
build.addStep("echo -n "+now.to_s+" -- >> linecount.log","Timestamping Line Count:"+now.to_s, false, false);
build.addStep("wc -l `find ./src/ -name \"*.pp\"` | tail -n 1 >> linecount.log","Logging Line Count", false, false);
# Regular Build Process
build.addStep("rm `find ./ -name \"*~\"`",  "Cleaning Backup files", false, true);
build.addStep("fpcmake -r",                 "Creating Makefiles",true, true);
build.addStep("make clean",                 "Cleaning Project",false, true);
build.addStep("make",                       "Building Project",true, true);
build.addStep("make examples",              "Building Tests",true, true);
build.addStep("./tests/run-tests.rb",       "Running Tests",true, false);


build.process();