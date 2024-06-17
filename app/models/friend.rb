class Friend < ApplicationRecord
    has_many :gifts, dependent: :destroy
end