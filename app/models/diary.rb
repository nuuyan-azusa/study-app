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
end
