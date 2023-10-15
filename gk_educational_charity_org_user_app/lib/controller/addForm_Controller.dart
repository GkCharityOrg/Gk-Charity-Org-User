import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/form_det.dart';
import '../screens/userForm.dart';
import '../services/formServices.dart';

class AddFormController extends GetxController {
  static AddFormController get instance => Get.find();
  final userApplicationRepo = Get.put(UserService());
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  var req_typeController = TextEditingController();
  final idController = TextEditingController();
  final adressController = TextEditingController();
  final locationController = TextEditingController();

  final descriptionController = TextEditingController();
  final imageUploadController = TextEditingController();

  void _onChanged(dynamic val) {
    debugPrint(val.toString());
    return req_typeController = val;
  }

  // final imageUploadController = uploadFile();
  // final uploadController = TextEditingController();
  Future<void> createApplicationForm(Form_props form_props) async {
    await userApplicationRepo.AddFormData(form_props);
  }

  // Future<void> createScholarshipApplication(Form_props form_props) async {
  //   await userApplicationRepo.CreateScholarship(form_props);
  // }

  // Future<void> createSchoolArchitectureApplication(
  //     Form_props form_props) async {
  //   await userApplicationRepo.CreateSchoolInfra(form_props);
  // }
}

Future<List<String>> pickAndUploadFiles() async {
  List<File> files =
      (await FilePicker.platform.pickFiles(allowMultiple: true)) as List<File>;
  List<String> uploadedUrls = [];

  if (files != null && files.isNotEmpty) {
    final FirebaseStorage storage = FirebaseStorage.instance;
    final Reference storageRef = storage.ref();

    for (var file in files) {
      final Reference fileRef = storageRef.child(file.path.split('/').last);
      final UploadTask uploadTask = fileRef.putFile(file);
      final TaskSnapshot uploadSnapshot =
          await uploadTask.whenComplete(() => null);
      final String downloadUrl = await uploadSnapshot.ref.getDownloadURL();

      uploadedUrls.add(downloadUrl);
    }
  }

  return uploadedUrls;
}
