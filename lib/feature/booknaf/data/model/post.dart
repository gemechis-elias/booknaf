class Post {
  int? id;
  String? type;
  String? content;
  List<String>? images;
  int? likes;
  int? saves;
  int? shares;
  List<Comments>? comments;
  String? createdAt;
  String? updatedAt;
  User? user;
  Place? place;

  Post(
      {this.id,
      this.type,
      this.content,
      this.images,
      this.likes,
      this.saves,
      this.shares,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.place});

  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    content = json['content'];
    images = json['images'].cast<String>();
    likes = json['likes'];
    saves = json['saves'];
    shares = json['shares'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    place = json['place'] != null ? Place.fromJson(json['place']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['content'] = content;
    data['images'] = images;
    data['likes'] = likes;
    data['saves'] = saves;
    data['shares'] = shares;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (place != null) {
      data['place'] = place!.toJson();
    }
    return data;
  }
}

class Comments {
  int? id;
  String? content;
  String? image;
  User? user;

  Comments({this.id, this.content, this.image, this.user});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    content = json['content'];
    image = json['image'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['content'] = content;
    data['image'] = image;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? email;
  String? password;
  String? bio;
  String? createdAt;
  String? profilePic;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.password,
      this.bio,
      this.createdAt,
      this.profilePic});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    bio = json['bio'];
    createdAt = json['createdAt'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullName'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['bio'] = bio;
    data['createdAt'] = createdAt;
    data['profile_pic'] = profilePic;
    return data;
  }
}

class Place {
  String? title;
  String? tag;
  String? location;
  double? rating;
  List<String>? gallery;
  String? about;
  List<String>? services;
  List<Reviews>? reviews;

  Place(
      {this.title,
      this.tag,
      this.location,
      this.rating,
      this.gallery,
      this.about,
      this.services,
      this.reviews});

  Place.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    tag = json['tag'];
    location = json['location'];
    rating = json['rating'];
    gallery = json['gallery'].cast<String>();
    about = json['about'];
    services = json['services'].cast<String>();
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['tag'] = tag;
    data['location'] = location;
    data['rating'] = rating;
    data['gallery'] = gallery;
    data['about'] = about;
    data['services'] = services;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  User? user;
  int? rating;
  String? comment;

  Reviews({this.user, this.rating, this.comment});

  Reviews.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    rating = json['rating'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['rating'] = rating;
    data['comment'] = comment;
    return data;
  }
}
