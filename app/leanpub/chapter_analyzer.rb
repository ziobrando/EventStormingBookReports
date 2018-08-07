# frozen_string_literal: true

module Leanpub

  class ChapterAnalyzer

    attr_reader :title

    def initialize(chapter_path)
      @chapter_path = chapter_path
      @fixme = []
    end

    def analyze
      report = Leanpub::ChapterReport.new

      File.open(@chapter_path, 'rb') do |f|
        f.each_line do |line|
          report.inc_lines_counter

          report.title ||= deemphasized(line)

          if (contains_fixme?(line))
            report.add_fixme(line)
          end

        end
      end
      puts report
      report
    end

    def deemphasized(line)
      line.slice! '# '
      line
    end

    def contains_fixme?(line)
      line.to_s.include?("FIXME")
    end



  end
end




