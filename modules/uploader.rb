# frozen_string_literal: true

module Uploader
  DIR_PATH = './db/'
  FILE_PATH = './db/data.yml'

  def save_to_db(data)
    File.open(FILE_PATH, 'w') { |file| file.write data.to_yaml }
  end

  def load_db
    list = [Author, Book, Reader, Order, Statistics, Time]
    begin
      YAML.safe_load(File.read(FILE_PATH), list, [], [], true).to_a.flatten
    rescue StandardError
      Dir.mkdir(DIR_PATH) unless File.exist?(DIR_PATH)
      File.new(FILE_PATH, 'w')
      retry
    end
  end
end
