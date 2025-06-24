class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final bool isDriver;
  final String? vehicleInfo;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.isDriver = false,
    this.vehicleInfo,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      isDriver: json['isDriver'] as bool? ?? false,
      vehicleInfo: json['vehicleInfo'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'isDriver': isDriver,
      'vehicleInfo': vehicleInfo,
    };
  }
}
