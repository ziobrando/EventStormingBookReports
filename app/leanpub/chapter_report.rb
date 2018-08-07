module Leanpub
  class ChapterReport

    attr_accessor :title

    def initialize
      @lines_counter = 0
      @fixme = []
    end

    def lines_count
      @lines_counter
    end

    def fixme_count
      @fixme.size
    end

    def inc_lines_counter
      @lines_counter += 1
    end

    def add_fixme(line)
      @fixme << line
    end

    def to_s
      "Chapter: #{title} has #{@fixme.size} fixmes."
    end
  end
end
