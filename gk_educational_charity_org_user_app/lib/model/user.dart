// class User {
//   String image;
//   String name;
//   String email;
//   String phone;
//   String aboutMeDescription;

//   // Constructor
//   User({
//     required this.image,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.aboutMeDescription,
//   });

//   User copy({
//     String? imagePath,
//     String? name,
//     String? phone,
//     String? email,
//     String? about,
//   }) =>
//       User(
//         image: imagePath ?? this.image,
//         name: name ?? this.name,
//         email: email ?? this.email,
//         phone: phone ?? this.phone,
//         aboutMeDescription: about ?? this.aboutMeDescription,
//       );

//   static User fromJson(Map<String, dynamic> json) => User(
//         image: json['imagePath'],
//         name: json['name'],
//         email: json['email'],
//         aboutMeDescription: json['about'],
//         phone: json['phone'],
//       );

//   Map<String, dynamic> toJson() => {
//         'imagePath': image,
//         'name': name,
//         'email': email,
//         'about': aboutMeDescription,
//         'phone': phone,
//       };
// }
import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationModel {
  String? id;
  String fullname;
  String email;
  String phone;
  String? req_type;
  String adress;

  String description;
  String? upload_File;

  // Constructor
  ApplicationModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.phone,
    this.req_type,
    required this.adress,
    required this.description,
    this.upload_File,
  });
  toJson() {
    return {
      "FullName": fullname,
      "Email": email,
      "Phone": phone,
      "Request type": req_type,
      "Address": adress,
      "Description": description,
      "Uploads": upload_File
    };
  }

  factory ApplicationModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ApplicationModel(
        id: document.id,
        fullname: data["FullName"],
        email: data["Email"],
        phone: data["Phone"],
        req_type: data["Request type"],
        adress: data["Address"],
        description: data["Description"],
        upload_File: data["Uploads"]);
  }
}
