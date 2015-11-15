class Comment < ActiveRecord::Base
  validates :user_name, :body, presence: true
  belongs_to :idea
end
