class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ["Fiction", "Non-Fiction"], message: "%{value} is not a valid category" }
  validate :non_clickbait

  def non_clickbait
    clickbait = ["Secret", "Top", "Guess"]
    words_in_title = self.title.split
    words_in_title.include?(clickbait)
  end
end
