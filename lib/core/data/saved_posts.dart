final savedDummyData = {
  {
    "id": 1,
    "type": "post_with_images",
    "content":
        "Great photo shooting today! I really enjoyed it. I want to thank my friends for making this happen. thank you @visitoromia. \n#photography #photoshoot #photooftheday #photographer",
    "images": ["Image.png", "Image_2.png"],
    "likes": 95,
    "saves": 5,
    "shares": 3,
    "comments": [
      {
        "id": 101,
        "content": "This is Amazing!",
        "image": "",
        "user": {
          "id": 201,
          "fullName": "Abel Abebe",
          "email": "user1@example.com",
          "password": "hashed_password",
          "bio": "User 1 bio.",
          "createdAt": "2023-09-07T12:00:00Z",
          "profile_pic": "no_profile.png",
        },
      },
      {
        "id": 102,
        "content": "Very impressive.",
        "image": null,
        "user": {
          "id": 202,
          "fullName": "Kebede Alem",
          "email": "user2@example.com",
          "password": "hashed_password",
          "bio": "User 2 bio.",
          "createdAt": "2023-09-07T13:00:00Z",
          "profile_pic": "no_profile.png",
        },
      },
    ],
    "created_at": "2023-09-07T10:00:00Z",
    "updated_at": "2023-09-07T10:30:00Z",
    "user": {
      "id": 301,
      "fullName": "Samuel Solomon",
      "email": "post_author@example.com",
      "password": "hashed_password",
      "bio": "Author's bio.",
      "createdAt": "2023-09-07T09:00:00Z",
      "profile_pic": "avatar.png",
    },
    "place": {
      "title": "Test Place",
      "tag": "Test Tag",
      "location": "Test Location",
      "rating": 4.5,
      "gallery": ["place_image1.jpg", "place_image2.jpg"],
      "about": "About the test place.",
      "services": ["Service 1", "Service 2", "Service 3"],
      "reviews": [
        {
          "user": {
            "id": 401,
            "fullName": "Reviewer 1",
            "email": "reviewer1@example.com",
            "password": "hashed_password",
            "bio": "Reviewer 1 bio.",
            "createdAt": "2023-09-07T14:00:00Z",
            "profile_pic": "no_profile.png",
          },
          "rating": 5,
          "comment": "Great place!"
        },
        {
          "user": {
            "id": 402,
            "fullName": "Reviewer 2",
            "email": "reviewer2@example.com",
            "password": "hashed_password",
            "bio": "Reviewer 2 bio.",
            "createdAt": "2023-09-07T15:00:00Z",
            "profile_pic": "no_profile.png",
          },
          "rating": 4,
          "comment": "Nice place!"
        },
      ],
    },
  },
};
