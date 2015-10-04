class Dictionary

    attr_accessor

    @@filepath = nil

    def self.filepath=(path=nil)
        @@filepath = File.join(APP_ROOT, path)
    end

    def self.file_exist?
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
        File.open(@@filepath, 'w') unless file_exist?
        return file_usable?
    end

    def self.saved_files
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
    end

    def import_line(line)
    end

    def initialize(args={})
    end

    def save
    end
end