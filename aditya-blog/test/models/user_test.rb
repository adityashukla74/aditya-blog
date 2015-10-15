require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
	@user = User.new(name: "Aditya User",email: "adityashukla74@gmail.com")
  end
  
  test "should be valid" do
  assert @user.valid?
  end
  test "name should be present" do
  @user.name = ""
  assert_not @user.valid?
  end
  
  test "email should be present" do
  @user.email = "	"
  assert_not @user.valid?
  end
  
  test "name shouldn't be too long" do
  @user.email = "a" * 200 + "@gmail.com"
  assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
	valid_addresses = %w[adityashukla74@gmail.com USER@foo. COM
		anadi.misra@boofoo.xyz dsfnkl+dfks@gmail.in]
	valid_addresses.each do |valid_address|
	@user.email = valid_address
	assert @user.valid?, "#{valid_address.inspect} should be valid"
	end
end
end
