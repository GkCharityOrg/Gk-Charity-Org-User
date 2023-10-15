import 'package:cloud_firestore/cloud_firestore.dart';

class Form_props {
  String? id;
  String fullname;
  String email;
  String phone;
  String? req_type;
  String adress;
  String location;
  String description;
  List<String>? uploadFile;

  // Constructor
  Form_props({
    this.id,
    required this.fullname,
    required this.email,
    required this.phone,
    this.req_type,
    required this.adress,
    required this.description,
    required this.location,
    this.uploadFile,
  });
  toJson() {
    return {
      "FullName": fullname,
      "Email": email,
      "Phone": phone,
      "Request type": req_type,
      "Address": adress,
      "Description": description,
      "Location": location,
      "Uploads": uploadFile
    };
  }

  factory Form_props.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Form_props(
        id: document.id,
        fullname: data["FullName"],
        email: data["Email"],
        phone: data["Phone"],
        req_type: data["Request type"],
        adress: data["Address"],
        description: data["Description"],
        uploadFile: data["Uploads"],
        location: data["Location"]);
  }
}
