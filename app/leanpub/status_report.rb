module Leanpub
  class StatusReport

    @chapters
    @sections
    @title

    def initialize
      @chapters = []
      @sections = []
      @title = ''
    end
    
    def add_chapter(line)
      @chapters << line
    end

    def add_section(line)
      @sections << line
    end

    def chapters_count
      @chapters.size
    end

    def to_s
      "#{chapters_count} chapters in book #{@title}"
    end

    def sections_count
      @sections.size
    end
  end
end