class UserModel {
  String? name;
  String? email;
  String? password;
  int? type;
  String? token;
  String? image;
  String? phone;

  UserModel({
    this.name,
    this.email,
    this.password,
    this.type,
    this.token,
    this.image,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        type: json["type"],
        token: json["token"],
        image: json["image"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "email": email,
        "password": password,
        "type": type,
        "token": token,
        "image": image,
        "phone": phone,
      };
}
