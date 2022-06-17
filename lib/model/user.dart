class User {
  //int id;
  String name;
  String image;

  User({required this.name,required this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      //id: json["id"] as int,
      name: json["name"] as String,
      image: json["image"] as String,
    );
  }
}
