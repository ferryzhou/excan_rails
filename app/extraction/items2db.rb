# from a list of ostruct
# push them to database

def push_items(ostruct_items)
  ostruct_items.each { |item|
    Post.new(
	  :title => item.title, 
	  :link => item.link,
	  :author => item.author,
	  :description => item.description,
	  :date => item.date
	  ).save
  }
end
