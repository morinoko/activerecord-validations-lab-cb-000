class Post < ActiveRecord::Base
  validates :title, presence: true, clickbait: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"], message: "%{value} is not a valid category" }

  CLICKBAIT_PATTERNS = [
    /won't believe/i,
    /top [0-9]*/i,
    /secret/i,
    /guess/i
  ]

  def is_clickbait?
    !!CLICKBAIT_PATTERNS.find { |pattern| pattern =~ title }
  end
end
