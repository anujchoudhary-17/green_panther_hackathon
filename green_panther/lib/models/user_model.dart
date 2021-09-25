class User {
  String email;
  String?  userId;
  int totalPoints;

  User(
      {required this.email,
      this.userId,
      required this.totalPoints,
      });

  fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userId = json['userId'];
    totalPoints = json['totalPoints'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['totalPoints'] = this.totalPoints;
    return data;
  }
}
