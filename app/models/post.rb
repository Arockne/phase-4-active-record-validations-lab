class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :click_bait
  

  def click_bait
    if title.present?
      bait = %W(Won't\ Believe Secret Top Guess)
      includes_bait =  bait.any? { |word| title.include?(word)}
      if !includes_bait
        errors.add(:title, "Title needs clickbait")
      end
    end
  end
end
