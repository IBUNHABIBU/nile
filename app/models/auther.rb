class Auther < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 3}
  validates :last_name, presence: true, length: { minimum: 3}
  has_many :books 
end
