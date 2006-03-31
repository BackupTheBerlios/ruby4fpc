#####################################
# process.rb
#####################################
# Defines how to handle a multi-step
# process.
#####################################

class StepByStep
  private
    def initialize
      @steps = Array.new();
    end

    def finalize
      puts "ALL DONE :D";
    end

  public
    def addStep(cmd, lbl, doFail = true, doRedirect = true)
      newStep = {"cmd" => cmd, "lbl" => lbl, "doFail" => doFail, "doRedirect" => doRedirect}
      @steps.push(newStep);
    end

    def process()
      @steps.each { |step|
        puts step["lbl"] if false; # Change this so it checks to see if we are verbose.
        cmd = step["cmd"];
        logName = "/tmp/" + rand().to_s + ".log";
        cmd += ">& "+logName if step["doRedirect"];
        system(cmd); ## Execute the Step's Command
        if step["doFail"] then
          if $? != 0 then
            puts step["lbl"] + " FAILED";
            if step["doRedirect"]
              puts "###### ERROR.LOG START #####";
              system("cat "+logName);
              puts "###### ERROR.LOG STOP ######";
            else
              puts "###### ERROR HAPPENED ######";
            end;
            exit 1;
          end;
        end;
        File.delete(logName) if File.exists?(logName);
      }
    end;
end;