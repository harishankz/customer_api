When(/^I want use the API$/) do
  visit api_v1_users_path
end

But(/^I can't create user without a role/) do
  params = {
    user_name: "test_user",
    email: "test_user@local.com",
    password: "test",
    gender: "male"
  }
  user = User.create(params)
  expect(user.valid?).to be(false)
  expect(user.errors.messages).to have_content("role")
end

Then(/^Create a role first/) do
  params = {
      role_name: "test_manager",
      role_code: "mane_te"
  }
  role = Role.create(params)
  expect(role.valid?).to be(true)
end

Then(/^Create a user/) do
  params = {
      user_name: "test_user",
      email: "test_user@local.com",
      password: "123456",
      gender: "male",
      role_id: Role.last.id
  }
  user = User.create(params)
  user.valid?
  expect(user.valid?).to be(true)
end