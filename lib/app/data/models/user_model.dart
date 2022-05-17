class User {
  String? username;
  String? dateJoined;
  bool? isAdmin;

  User({this.username, this.dateJoined, this.isAdmin});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    dateJoined = json['dateJoined'];
    isAdmin = json['is_admin'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['username'] = username;
    data['dateJoined'] = dateJoined;
    data['is_admin'] = isAdmin;
    return data;
  }
}
