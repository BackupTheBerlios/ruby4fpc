#!/usr/local/bin/ruby

# Author: Jon (BadQuanta) Sawyer

steps = [
  {"cmd" => "rm `find ./ -name \"*~\"`", "lbl" => "Cleaning Backupfiles","fail" => false },
	{"cmd" => "fpcmake -r",                "lbl" => "Creating Makefiles",  "fail" => true },
	{"cmd" => "make clean",                "lbl" => "Cleaning Project",    "fail" => false },
	{"cmd" => "make",                      "lbl" => "Building Project",    "fail" => true },
	{"cmd" => "make examples",             "lbl" => "Building Tests",      "fail" => true },
	{"cmd" => "./tests/run-tests.rb",      "lbl" => "Running Tests",       "fail" => true }
	];

steps.each { |step|
  puts step["lbl"];
  system(step["cmd"] + ">& error.log"); ## Execute the Step's Command
  if step["fail"] then
    if $? != 0 then
      puts "###### ERROR.LOG START #####";
      system("cat error.log");
      puts "###### ERROR.LOG STOP #####";
      exit 1;
    end;
  end;
}