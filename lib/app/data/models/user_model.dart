class User {
  String? username;
  String? dateJoined;
  String? firstName;
  String? lastName;
  bool? isAdmin;

  User({this.username, this.dateJoined, this.isAdmin});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    dateJoined = json['dateJoined'];
    isAdmin = json['is_admin'];
    firstName = json['firstName'];
    lastName = json['lastName'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['dateJoined'] = dateJoined;
    data['is_admin'] = isAdmin;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    return data;
  }
}
