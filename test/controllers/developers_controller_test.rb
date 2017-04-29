require 'test_helper'

class DevelopersControllerTest < ActionDispatch::IntegrationTest
  test 'should get to developers list' do
    get developers_path
    assert_response :success
  end

  test 'should get to developers create form' do
    get new_developer_path
    assert_response :success
  end

  test 'should create a developer' do
    post developers_path, params: { developer: { first_name: 'Foo', last_name: 'Bar', email: 'foo@bar.baz'}}
    developer = Developer.find_by_email 'foo@bar.baz'
    assert developer
    assert_response :redirect
  end

  test 'should not create a developer when not all parameters al passed' do
    post developers_path, params: { developer: { first_name: 'Foo', email: 'foo@bar.baz'}}
    developer = Developer.find_by_email 'foo@bar.baz'
    assert_not developer
    assert_response :success
  end

end
