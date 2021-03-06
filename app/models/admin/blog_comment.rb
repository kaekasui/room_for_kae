class Admin::BlogComment < ActiveRecord::Base
  self.table_name = "blog_comments"

  belongs_to :blog

  attr_accessible :created_at, :admin, :author, :blog_id, :content, :draft, :host, :ip, :mail, :mixi, :password, :salt, :title, :url

  validates_presence_of :author, :content
  validates_length_of :title, :author, maximum: AVAILABLE_STRING_LENGTH, size: AVAILABLE_STRING_LENGTH
  validates_length_of :url, :mail, maximum: AVAILABLE_LONG_STRING_LENGTH, size: AVAILABLE_LONG_STRING_LENGTH
  validates_length_of :content, maximum: AVAILABLE_TEXT_LENGTH, size: AVAILABLE_TEXT_LENGTH
  validates_length_of :password, maximum: 12

  default_scope order("created_at desc")

  def blog_title
    Admin::Blog.find(self.blog_id).title if Admin::Blog.find(self.blog_id)
  end
end
