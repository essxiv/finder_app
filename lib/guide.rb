require 'dictionary'

class Guide

    class Config
        @@actions = ['list', 'find', 'add', 'quit']

        def self.actions
            @@actions
        end
    end

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
        action = nil
        until Guide::Config.actions.include?(action)
            uts "Commands: " + Guide::Config.actions.join(", ") if action
            print "> ".center(20)
            user_response = gets.chomp
            action = user_response.downcase.strip
        end
        return action
    end

    def do_action
        case action
        when 'list'
            puts "Listing all.."
            list
        when 'find'
            puts "Finding all.."
            find
        when 'add'
            puts "Adding.."
            add
        when 'quit'
            return :quit
        else
            puts "I Don't Understand that Command.."
        end
    end

    def list
        puts "Listing All.."
        dictionary = Dictionary.saved_dictionary
        dictionary.each do |dict|
            puts dict.subject + " | " + dict.location + " | " + dict.description
        end
    end

    def add
        puts "Adding.."

        dictionary = Dictionary.build_questions

        if dictionary.save
            puts "Saved to Dictionary!"
        else
            puts "Save Error: Not Added.."
        end
    end

    def find
    end

    def introduction
        puts "~ Welcome to Dictionary ~"
        puts "Insert data into this program, which will allow other users to use it!"
    end

    def conclusion
        puts "~ Have a Good Day! ~"
    end
end