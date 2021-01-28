class Expression < ApplicationRecord
  belongs_to :user
  with_options presence: true do
    validates :name
    validates :text
  end

  def self.search(search)
    if search != ''
      Expression.where('name LIKE(?)', "%#{search}%")
    else
      Expression.all
    end
  end
end
