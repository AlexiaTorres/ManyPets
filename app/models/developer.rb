class Developer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, email: true, uniqueness: true
  validates :pets, length: { maximum: 5 }

  has_many :pets

  def pets_limit_reached?
    pets.count >= 5
  end

  def name
    "#{first_name} #{last_name}"
  end
end
