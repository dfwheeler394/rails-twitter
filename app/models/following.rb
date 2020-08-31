class Following < ApplicationRecord
  #the user who is followed
  belongs_to :followee, foreign_key: :followed_id, class_name: "User"
  
  # the other users who are following the user currently logged in
  belongs_to :follower, foreign_key: :follower_id, class_name: "User"
end
