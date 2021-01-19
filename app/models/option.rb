class Option < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :name
    validates :text
  end
  
  def self.search(search)
    if search != ""
      Option.where('name LIKE(?)', "%#{search}%")
    else
      Option.all
    end
  end

end
