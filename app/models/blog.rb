class Blog < Admin::Blog
  attr_accessible :blog_category_code, :contents1, :contents2, :deleted_at, :draft, :title
end
