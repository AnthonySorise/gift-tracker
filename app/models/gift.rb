class Gift < ApplicationRecord
    belongs_to :friend
    validates :description, presence: true
end