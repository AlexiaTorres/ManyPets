require 'test_helper'

class DeveloperTest < ActiveSupport::TestCase
  test 'should have the necessary required validators' do
    developer = Developer.new
    assert_not developer.valid?
    assert_equal [:first_name, :last_name, :email], developer.errors.keys
  end

  test 'should be able to validate emails' do
    developer = Developer.new(first_name: 'Foo', last_name: 'Bar', email: 'foo')
    assert_not developer.valid?
    assert_equal ['is invalid'], developer.errors.messages[:email]
  end

  test 'should not allow repeated emails' do
    developer = Developer.new(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.baz')
    assert developer.save
    copycat = Developer.new(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.baz')
    assert_not copycat.valid?
    assert_equal ['has already been taken'], copycat.errors.messages[:email]
  end

  test 'name is equal to first and last name together' do
    developer = Developer.new(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.baz')
    assert_equal 'Foo Bar', developer.name
  end

  test 'a developer has a limit of 5 pets' do
    developer = Developer.new(first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.baz')
    developer.save

    4.times do
      developer.pets.create(name: 'Dummy', age: 1, alive: 1, gender: 'Male', category: 'Dog')
    end

    assert_not developer.pets_limit_reached?

    developer.pets.create(name: 'Dummy', age: 1, alive: 1, gender: 'Male', category: 'Dog')
    assert developer.pets_limit_reached?
    assert developer.valid?

    developer.pets.create(name: 'Dummy', age: 1, alive: 1, gender: 'Male', category: 'Dog')
    assert_not developer.valid?
    assert_equal ['is too long (maximum is 5 characters)', 'is invalid'], developer.errors.messages[:pets]
  end
end
