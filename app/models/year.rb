class Year < ActiveHash::Base
  self.data = [
    { id: 0, name: '__' },
    { id: 1, name: '2020' },
    { id: 2, name: '2021' }
  ]
  include ActiveHash::Associations
  has_many :diaries
end
