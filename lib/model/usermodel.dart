class User {
  // Attributes
  final String id;
  final String? firstName;
  final String? secondName;
  final String? phone;
  final String? email;
  final String? password;
  final String? confimPassword;

  // Constructor
  User(
      {required this.id,
      this.firstName,
      this.secondName,
      this.phone,
      this.email,
      this.password,
      this.confimPassword});

  // Factory constructor for creating a new User instance from a map (JSON)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        firstName: json["firstName"],
        secondName: json["secondName"],
        phone: json["phone"],
        email: json["email"],
        password: json["password"],
        confimPassword: json["confimPassword"]);
  }

  // Method to convert User object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "secondName": secondName,
      "phone": phone,
      "email": email,
      "password": password,
      "confimPassword": confimPassword,
    };
  }
}
