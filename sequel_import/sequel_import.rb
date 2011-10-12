# given a htm root
# extract items and import to database
require 'rubygems'
require 'sequel'

def sequel_import_file(table, filepath, method)
  content = open(filepath).read
  items = extract_items(content, method)
  items.each do |item|
    table.insert(
      :title => item.title, 
      :link => item.link,
	  :author => item.author,
	  :description => item.description,
	  :date => item.date,
	  :source => item.source
	)
  end
end

def sequel_import_files(table, path_regex, method)
  Dir[path_regex].each { |path| sequel_import_file (table, path, method) }
end

def sequel_import_all(htm_root, db_path, moved_root)
  DB = Sequel.sqlite(db_path)
  #iterate through all files
  
end


