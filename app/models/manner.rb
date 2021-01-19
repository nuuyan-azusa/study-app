class Manner < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :name
    validates :text
  end

  def self.search(search)
    if search != ""
      Manner.where('name LIKE(?)', "%#{search}%")
    else
      Manner.all
    end
  end
  
end
