class Minute < ActiveHash::Base
  self.data = [
    { id: 0, name: '__' },
    { id: 1, name: '00' },
    { id: 2, name: '10' },
    { id: 3, name: '20' },
    { id: 4, name: '30' },
    { id: 5, name: '40' },
    { id: 6, name: '50' }
  ]
  include ActiveHash::Associations
  has_many :diaries
end
