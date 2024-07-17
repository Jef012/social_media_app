/// values : {"profilePicture":"","bio":"","followers":[{"_id":"1234567890abcdef12345678","username":"follower1"},{"_id":"abcdef1234567890abcdef12","username":"follower2"}],"following":[{"_id":"abcdef1234567890abcdef34","username":"following1"},{"_id":"1234567890abcdef56789012","username":"following2"}],"_id":"6659c8290b75bd8d4885763d","username":"jeff1616","email":"jeff115160@gmail.com","createdAt":"2024-05-31T12:52:57.941Z","__v":0}

class UserDataModelApi {
  UserDataModelApi({
    this.values,
  });

  UserDataModelApi.fromJson(dynamic json) {
    values =
        json['values'] != null ? UserDataModel.fromJson(json['values']) : null;
  }
  UserDataModel? values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (values != null) {
      map['values'] = values?.toJson();
    }
    return map;
  }
}

/// profilePicture : ""
/// bio : ""
/// followers : [{"_id":"1234567890abcdef12345678","username":"follower1"},{"_id":"abcdef1234567890abcdef12","username":"follower2"}]
/// following : [{"_id":"abcdef1234567890abcdef34","username":"following1"},{"_id":"1234567890abcdef56789012","username":"following2"}]
/// _id : "6659c8290b75bd8d4885763d"
/// username : "jeff1616"
/// email : "jeff115160@gmail.com"
/// createdAt : "2024-05-31T12:52:57.941Z"
/// __v : 0

class UserDataModel {
  UserDataModel({
    this.profilePicture,
    this.bio,
    this.followers,
    this.following,
    this.id,
    this.username,
    this.email,
    this.createdAt,
    this.v,
  });

  UserDataModel.fromJson(dynamic json) {
    profilePicture = json['profilePicture'];
    bio = json['bio'];
    if (json['followers'] != null) {
      followers = [];
      json['followers'].forEach((v) {
        followers?.add(Followers.fromJson(v));
      });
    }
    if (json['following'] != null) {
      following = [];
      json['following'].forEach((v) {
        following?.add(Following.fromJson(v));
      });
    }
    id = json['_id'];
    username = json['username'];
    email = json['email'];
    createdAt = json['createdAt'];
    v = json['__v'];
  }
  String? profilePicture;
  String? bio;
  List<Followers>? followers;
  List<Following>? following;
  String? id;
  String? username;
  String? email;
  String? createdAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profilePicture'] = profilePicture;
    map['bio'] = bio;
    if (followers != null) {
      map['followers'] = followers?.map((v) => v.toJson()).toList();
    }
    if (following != null) {
      map['following'] = following?.map((v) => v.toJson()).toList();
    }
    map['_id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['createdAt'] = createdAt;
    map['__v'] = v;
    return map;
  }
}

/// _id : "abcdef1234567890abcdef34"
/// username : "following1"

class Following {
  Following({
    this.id,
    this.username,
  });

  Following.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
  }
  String? id;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['username'] = username;
    return map;
  }
}

/// _id : "1234567890abcdef12345678"
/// username : "follower1"

class Followers {
  Followers({
    this.id,
    this.username,
  });

  Followers.fromJson(dynamic json) {
    id = json['_id'];
    username = json['username'];
  }
  String? id;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['username'] = username;
    return map;
  }
}
