class Post < ActiveRecord::Base

  has_attached_file :picture, :styles => {:big=> "640x480>", :medium => "320x240>", :thumb => "100x100>" }


  #validates :author,  :presence => true ,   :length => { :maximum => 30 }
  validates :title, :presence => true,:length => { :minimum => 1, :maximum => 50 }
  validates :picture_file_name, :presence => true
  validates_attachment_size :picture, :less_than => 5.megabytes
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']
  validates :content, :presence => true,:length => {:minimum => 10}



  has_many :comments, :dependent => :destroy

  acts_as_taggable_on :tags
  #accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

end
