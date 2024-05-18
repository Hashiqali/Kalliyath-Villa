class UserModel {
  final String id;
  final String name;
  final String? email;
  final String? phonenumber;
  final String image;
  final DateTime lastActive;
  final bool isOnline;

  const UserModel({
    required this.phonenumber,
    required this.name,
    required this.image,
    required this.lastActive,
    required this.id,
    required this.email,
    this.isOnline = false,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id']??'',
        name: json['Username']??'',
        image: json['Image']??'',
        email: json['Email']??'',
        isOnline: json['isOnline'] ?? false,
        phonenumber: json['Phone Number']??'',
        lastActive: json['lastActive'] ?? DateTime.now(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'Username': name,
        'Image': image,
        'Email': email,
        'Phone Number': phonenumber,
        'isOnline': isOnline,
        'lastActive': lastActive,
      };
}
