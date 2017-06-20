class User < ApplicationRecord
  validates :user_name, presence: true, uniquness: true

end
