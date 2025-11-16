class UserModel {
  UserModel({this.name, this.email, this.uid});
  static const String collectionName = "users";
  String? name;
  String? email;
  String? uid;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      uid: json['uid'] as String,
    );
  }
  Map<String, dynamic> toJson() => {'name': name, 'email': email, 'uid': uid};
}
