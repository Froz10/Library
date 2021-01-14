module Uploader
  FILE_PATH = './db/data.yml'

  def save_to_db(data)
    File.open(FILE_PATH, 'w') { |file| file.write data.to_yaml }
  end

  def load_db
    check_exist_db_file
    list = [Author, Book, Reader, Order, Date, Time]
    YAML.safe_load(File.read(FILE_PATH), list, [], [], true).to_a.flatten
  end

  def check_exist_db_file
    File.write(FILE_PATH, '') unless File.exist?(FILE_PATH)
  end
end
