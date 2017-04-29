class Pet < ApplicationRecord
  validates :name, presence: true
  validates :gender, presence: true
  validates :category, presence: true
  validates :age, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }
  validates_associated :developer

  enum category: [:Dog, :Cat, :Rat, :Chinchilla]
  enum gender: [:Male, :Female]

  belongs_to :developer
end
