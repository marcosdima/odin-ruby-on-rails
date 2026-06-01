class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  validates :alias, allow_nil: true, length: { minimum: 2, maximum: 100 }
end
