

class User {
  int id;
  String name;
  String userFullName;

  User({this.id, this.name, this.userFullName});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
      id: parsedJson["id"],
      name: parsedJson["Username"] as String,
      userFullName: parsedJson["UserFullName"] as String,
    );
  }
}