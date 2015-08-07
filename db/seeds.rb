10.times do
  user = User.create(email: Faker::Internet.email,
              username: Faker::Internet.user_name,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              password: "password",
              password_confirmation: "password",
              avatar: Faker::Avatar.image,
              bio: Faker::Lorem.sentence(5))
  5.times do
    user.squawks << Squawk.create(body: Faker::Lorem.sentence(9))
  end
end

User.create(email: "test@user.com",
            username: "testuser",
            first_name: "test",
            last_name: "user",
            password: "password",
            password_confirmation: "password",
            bio: "I am a test user.")
