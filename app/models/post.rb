class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 225}
    validates :summary, length: { maximum: 225}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%w{category} is not a vaid category"}
    validate :is_clickbait?

    CLICKBAIT = [
        /Won't Believe/i,
        /Secret/i,
        /Top [0-9]*/i,
        /Guess/i
    ]

    def is_clickbait?
        if CLICKBAIT.none? {|phrases| phrases.match title }
            errors.add(:title, "must be clickbait")
        end 
    end 
end
