import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/user.dart';

class ApplicationController extends GetxController {
  static ApplicationController get instance => Get.find();
  // final _applicationRepo = Get.put(UserApplicationService());
  var itemsList = <ApplicationModel>[].obs;
  @override
  onInit() async {
    await getData();
  }

  // getApplicationData() async {
  //   return await _applicationRepo.getAllApplications();

  //   // return _applicationRepo.getAllApplications();
  // }

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');

  Future getData() async {
    // Get docs from collection reference
    DocumentSnapshot<Object?> querySnapshot =
        await _collectionRef.doc('id').get();

    // Get data from docs and convert map to List
    final allData = querySnapshot;

    print(allData);
  }
}

  // RxInt planId = 0.obs;
  // var isLoading = true.obs;
  // // ignore: deprecated_member_use
  // var plansList = <ApplicationModel>[].obs;
  // setPlanId(int id) {
  //   planId.value = id;
  //   if (planId.value != 0 && planId.value != null) {
  //     fetchPlans();
  //   }
  // }

  // void fetchPlans() async {
  //   try {
  //     isLoading(true);
  //     var plans = await _collectionRef.id;
  //     if (plans != null) {
  //       plansList.value = plans as List<ApplicationModel>;
  //     }
  //   } finally {
  //     isLoading(false);
  //   }
  // }
// }

// class UserData {
//   static late SharedPreferences _preferences;
//   static const _keyUser = 'user';

//   static User myUser = User(
//     image:
//         "https://upload.wikimedia.org/wikipedia/en/0/0b/Darth_Vader_in_The_Empire_Strikes_Back.jpg",
//     name: 'Test Test',
//     email: 'test.test@gmail.com',
//     phone: '(208) 206-5039',
//     aboutMeDescription:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat...',
//   );

//   static Future init() async =>
//       _preferences = await SharedPreferences.getInstance();

//   static Future setUser(User user) async {
//     final json = jsonEncode(user.toJson());

//     await _preferences.setString(_keyUser, json);
//   }

//   static User getUser() {
//     final json = _preferences.getString(_keyUser);

//     return json == null ? myUser : User.fromJson(jsonDecode(json));
//   }
// }
