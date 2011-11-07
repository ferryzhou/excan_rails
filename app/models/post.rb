class Post < ActiveRecord::Base

  #validates_uniqueness_of :link
  validates :link, :presence => true,
                   :uniqueness => true
end
