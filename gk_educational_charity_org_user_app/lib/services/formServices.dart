import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/form_det.dart';

class UserService extends GetxController {
  static UserService get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  AddFormData(Form_props form_props) async {
    await _db
        .collection("applicationDetails")
        .add(form_props.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "data uploaded.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  CreateScholarship(Form_props form_props) async {
    await _db
        .collection("applicationDetails")
        .doc('0uSKqDtvLfQXdyzjlwEr')
        .collection('Scholarships')
        .add(form_props.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "data uploaded.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

  CreateSchoolInfra(Form_props form_props) async {
    await _db
        .collection("applicationDetails")
        .doc('PWbhazMnsF6DylZ0x7iw')
        .collection('School Infrastructure')
        .add(form_props.toJson())
        .whenComplete(
          () => Get.snackbar("Success", "data uploaded.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }
}
