class UserModel {
  String? id;
  String? username;
  String? password;

  UserModel({
    this.id,
    this.username,
    this.password,
  });

  factory UserModel.fromJSON(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toMap(UserModel userModel) {
    return {
      "id": userModel.id,
      "username": userModel.username,
      "password": userModel.password,
    };
  }
}
