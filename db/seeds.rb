testuser = User.create(email: "test@user.com",
            username: "testuser",
            first_name: "test",
            last_name: "user",
            password: "password",
            password_confirmation: "password",
            bio: "I am a test user.")

testuser.posts << Post.create(body: "This post belongs to test user.")            
