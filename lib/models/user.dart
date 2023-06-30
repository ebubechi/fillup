class Users {
  final String id;
  final String fullName;
  final String email;
  final String userRole;

  Users({
    required this.id,
    required this.fullName,
    required this.email,
    required this.userRole
  });

  Users.fromData(Map<String, dynamic> data)
    : id = data['id'],
      fullName = data['fullName'],
      email = data['email'],
      userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'userRole': userRole
    };
  }
}