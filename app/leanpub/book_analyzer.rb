module Leanpub
  class BookAnalyzer

    @book_path

    def initialize(book_path)
      @book_path = book_path
    end

    def analyze

      report = Leanpub::StatusReport.new

      File.open(@book_path, 'rb') do |f|
        f.each_line do |line|
          if chapter?(line)
            chapter_path = File.join(File.dirname(@book_path), line.strip)
            chapter_analyzer = Leanpub::ChapterAnalyzer.new(chapter_path)
            chapter_report = chapter_analyzer.analyze
            report.add_chapter(chapter_report)

          elsif section?(line)
            report.add_section(line)
          end

        end
        puts report
        report
      end
    end

    def chapter?(line)
      markdown?(line) and
          not commented?(line) and
          not section?(line)
    end

    def commented?(line)
      (line.to_s.start_with?('#'))
    end

    def markdown?(line)
      (line.to_s.end_with?(".md") or
          line.to_s.end_with?(".md\n"))
    end

    def section?(line)
      line.to_s.start_with?("SECTION-")
    end

  end
end


