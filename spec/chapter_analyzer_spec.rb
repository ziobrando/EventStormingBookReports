# frozen_string_literal: true

require 'rspec'
require_relative '../app/leanpub'

describe 'reading a chapter' do

  let(:chapter_file_path) {
    "../leanpub-intro-eventstorming/manuscript/Big_Picture_variations.md"
    #"./resources/TestBook.txt"
  }
  let(:analyzer) { Leanpub::ChapterAnalyzer.new(chapter_file_path) }
  let(:report) { analyzer.analyze }

  it 'should generate a report' do
    report.should_not be_nil
  end

  it 'should count lines' do
    expect(report.lines_count).to be > 10
  end

  it 'should count the FIXME' do
    expect(report.fixme_count).to be > 0
  end

  it 'should detect the title' do
    expect(report.title).to be "Big Picture variations"
  end



end
