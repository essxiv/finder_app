class Dictionary

    attr_accessor :subject, :locaton, :description

    @@filepath = nil

    def self.filepath=(path=nil)
        @@filepath = File.join(APP_ROOT, path)
    end

    def self.file_exist?
        # should know if file already exists
        if @@filepath && File.exist?(@@filepath)
            return true
        else
            return false
        end
    end

    def self.file_usable?
        return false unless @@filepath
        return false unless File.exist?(@@filepath)
        return false unless File.readable?(@@filepath)
        return false unless File.writable?(@@filepath)
        return true
    end

    def self.create_file
        # creates dictionary file
        File.open(@@filepath, 'w') unless file_exist?
        return file_usable?
    end

    def self.saved_files
        # reads the dictonary file
        # returns instance of file
        dicionaries = []
        if file_usable?
            file = File.new(@@filepath, 'r')
            file.each_line do |line|
                dicionaries << Dictionary.new.import_line(line.chomp)
            end
            file.close
        end
        return dicionaries
    end

    def self.build_questions
        args = {}
        print "Subject name: "
        args[:subject] = gets.chomp.strip

        print "Location: "
        args[:location] = gets.chomp.strip

        print "Details: "
        args[:description] = gets.chomp.strip
    end

    def import_line(line)
        line_array = line.split("\t")
        @subject, @location, @description = line_array
        return self
    end

    def initialize(args={})
        @subject = args[:subject] || ""
        @location = args[:location] || ""
        @description = args[:description] || ""
    end

    def save
        return false unless Dictionary.file_usable?
        File.open(@@filepath, 'a') do |file|
            file.puts "#{[@subject, @location, @descripton].join("\t")}\n"
        end
        return true
    end
end