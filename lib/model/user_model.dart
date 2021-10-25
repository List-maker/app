class UserModel {
  final int id;
  final String username;
  final String email;
  final List pinnedLists;
  final Object settings;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.pinnedLists,
    required this.settings,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      pinnedLists: json['pinned_lists'],
      settings: json['settings'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': 1,
      'username': username,
      'email': email,
      'pinned_lists': pinnedLists,
      'settings': settings,
    };
  }
}
