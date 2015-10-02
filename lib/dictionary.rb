class Dictionary

    attr_accessor

    @@filepath = nil

    def self.filepath=(path=nil)
        @@filepath = File.join(APP_ROOT, path)
    end

    def self.file_exist?
    end

    def self.file_usable?
    end

    def self.create_file
    end

    def self.saved_files
    end

    def self.build_questions
    end

    def initialize(args={})
    end

    def save
    end
end