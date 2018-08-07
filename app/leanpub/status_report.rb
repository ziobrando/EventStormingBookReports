module Leanpub
  class StatusReport

    attr_accessor :chapters
    attr_accessor :sections
    attr_accessor :title
    attr_accessor :fixme_counter

    def initialize
      @chapters = []
      @sections = []
      @title = ''
      @fixme_counter = 0
    end
    
    def add_chapter(line)
      @chapters << line
      @fixme_counter += line.fixme_count
    end

    def add_section(line)
      @sections << line
    end

    def chapters_count
      @chapters.size
    end

    def sections_count
      @sections.size
    end

    def to_s
      "#{sections_count} sections, " +
      "#{chapters_count} chapters in book #{@title}, \n" +
          "and #{fixme_counter} FIXMEs overall."
    end
  end
end