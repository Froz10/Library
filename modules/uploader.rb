module Uploader
  FILE_PATH = './db/data.yml'

  def save_to_db(data)
    File.open(FILE_PATH, 'w') { |file| file.write data.to_yaml }
  end

  def load_db
    begin
      list = [Author, Book, Reader, Order, Date, Time]
      YAML.safe_load(File.read(FILE_PATH), list, [], [], true).to_a.flatten
    rescue 
      File.new(FILE_PATH, 'w')
      retry
    end
  end

end
