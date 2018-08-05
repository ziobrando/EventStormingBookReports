module Leanpub
  class BookAnalyzer

    @book_path

    def initialize(book_path)
      @book_path = book_path
    end

    def generate_report

      report = Leanpub::StatusReport.new

      File.open(@book_path, 'rb') do |f|
        f.each_line do |line|
          report.add_chapter(line) if is_chapter?(line)
          report.add_section(line) if is_section?(line)
        end
      end

      puts report
      report

    end

    def is_chapter?(line)
      is_markdown?(line) and
          not is_commented?(line) and
          not is_section?(line)
    end

    def is_commented?(line)
      (line.to_s.start_with?('#'))
    end

    def is_markdown?(line)
      (line.to_s.end_with?(".md") or
          line.to_s.end_with?(".md\n"))
    end

    def is_section?(line)
      line.to_s.start_with?("SECTION-")
    end

  end
end
