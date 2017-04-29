require 'test_helper'

class PetTest < ActiveSupport::TestCase
  test 'should have the necessary required validators' do
    pet = Pet.new
    assert_not pet.valid?
    assert_equal [:name, :gender, :category, :age, :developer], pet.errors.keys
  end

  test 'age should be an integer' do
    pet = Pet.new(age: 2.2)
    assert_not pet.valid?
    assert_equal ['must be an integer'], pet.errors.messages[:age]
  end

  test 'age should be an possitive' do
    pet = Pet.new(age: -2)
    assert_not pet.valid?
    assert_equal ['must be greater than or equal to 0'], pet.errors.messages[:age]
  end
end
