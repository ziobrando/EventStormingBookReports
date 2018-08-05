module Leanpub
  class StatusReport

    @chapters
    @title

    def initialize
      @chapters = []
      @title = ''
    end
    
    def add_chapter(line)
      @chapters << line
    end

    def chapter_count
      @chapters.size
    end

    def to_s
      "#{chapter_count} chapters in book #{@title}"
    end
  end
end