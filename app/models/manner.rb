class Manner < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :name
    validates :text
  end
  
end
