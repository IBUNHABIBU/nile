class Book < ApplicationRecord
  validates :author, presence: true, lenght: { minimum: 3}
  validates :title, presence: true, lenght: { minimum: 3}
end
