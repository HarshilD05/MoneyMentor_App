import 'package:moneymentor/utils/formatters/formatter.dart';

class UserModel {
  final String id;
  String firstname;
  String lastname;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel(
      {required this.id,
      required this.firstname,
      required this.lastname,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture});

  String get fullName => '$firstname $lastname';

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split(" ");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: '',
      firstname: '',
      lastname: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      firstname: json['FirstName'] ?? '',
      lastname: json['LastName'] ?? '',
      username: json['UserName'] ?? '',
      email: json['Email'] ?? '',
      phoneNumber: json['PhoneNumber'] ?? '',
      profilePicture: json['ProfilePicture'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstname,
      'LastName': lastname,
      'UserName': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }
}
