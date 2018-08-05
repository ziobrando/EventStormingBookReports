# frozen_string_literal: true

require 'rspec'
require_relative '../app/leanpub'

describe 'reading the master' do

  let(:book_file_path) {
    #"../leanpub-intro-eventstorming/manuscript/Book.txt"
    "./resources/TestBook.txt"
  }
  let(:analyzer) {
    Leanpub::BookAnalyzer.new(book_file_path)
  }

  let(:report) { analyzer.generate_report }

  it 'should generate a report' do
    report.should_not be_nil
  end

  it 'should count the chapters' do
    expect(report.chapter_count).to be > 0
  end

  it 'should only count the real chapters' do
    expect(report.chapter_count).to eq 42
  end

  it 'should count the sections' do
    expect(report.section_count).to eq 5
  end
end