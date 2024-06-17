# app/models/friend.rb
class Friend < ApplicationRecord
    validates :name, presence: true
    validates :birthday, presence: { message: "must be provided" }

    has_many :gifts, inverse_of: :friend, dependent: :destroy
    accepts_nested_attributes_for :gifts, allow_destroy: true
end