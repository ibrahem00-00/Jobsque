class UserModel{

  String? username;
  String? email;
  String? password;
  String? id;
  String? photoUrl;
  String? name;
  String? address;
  String? bio;
  String? about;
  String? phoneNumber;

  UserModel({
    this.username,
    this.email,
    this.password,
    this.photoUrl,
    this.name,
    this.address,
    this.bio,
    this.about,
    this.phoneNumber,
    this. id
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'password': password,
      'id':id,
      'photoUrl': photoUrl,
      'name': name,
      'address': address,
      'bio': bio,
      'about': about,
      'phoneNumber': phoneNumber,
    };
  }

  factory UserModel.fromJson({required Map<String, dynamic> json}) {
    return UserModel(
      username: json['username'],
      email: json['email'] ,
      password: json['password'] ,
      id:json['id'],
      photoUrl: json['photoUrl'] ,
      name: json['name'] ,
      address: json['address'] ,
      bio: json['bio'] ,
      about: json['about'] ,
      phoneNumber: json['phoneNumber'],
    );
  }
}