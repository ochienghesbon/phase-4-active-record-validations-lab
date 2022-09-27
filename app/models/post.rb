class Post < ApplicationRecord
    validates :title, presence: true 
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}

    validate :clickbait?

    def clickbait?
        patterns = [/Won't Believe/, /Secret/, /Top \d/, /Guess/]

        if patterns.none? { |pattern| pattern.match(self.title) }
             errors.add(:title, "must be a clickbait-y title")
        end
    end
end

