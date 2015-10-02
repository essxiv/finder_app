require 'dictionary'

class Guide

    def initialize(@path=nil)
        Dictionary.filepath = path

        if Dictionary.file_usable?
            puts "File Found."
        elsif Dictionary.create_file
            puts "File Created."
        else
            puts "Error, Exiting.."
        end 
    end

    def launch!
        introduction
        #process
        conclusion
    end

    def get_action
    end

    def do_action
    end

    def list
    end

    def add
    end

    def introduction
        puts "~ Welcome to Dictionary ~"
        puts "Insert data into this program, which will allow other users to use it!"
    end

    def conclusion
        puts "~ Have a Good Day! ~"
    end
end