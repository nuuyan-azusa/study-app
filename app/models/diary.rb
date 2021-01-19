class Diary < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :day
  belongs_to_active_hash :hour
  belongs_to_active_hash :minute
  belongs_to_active_hash :month
  belongs_to_active_hash :year

  with_options presence: true do
    validates :title
    validates :text
  end

  with_options numericality: { other_than: 0, message: 'Select' } do
    validates :day_id
    validates :hour_id
    validates :minute_id
    validates :month_id
    validates :year_id
  end

  def self.search(search)
    if search != ""
      Diary.where('title LIKE(?)', "%#{search}%")
    else
      Diary.all
    end
  end
end
