// ignore_for_file: library_private_types_in_public_api

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:gk_educational_charity_org_user_app/screens/user_edit/user_description.dart';

// import '../../controller/user_data.dart';
// import '../../model/user.dart';
// import '../widget/display_image_widget.dart';
// import 'edit_email.dart';
// import 'edit_image.dart';
// import 'edit_name.dart';
// import 'edit_phone.dart';

// // This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     // final user = UserData.myUser;

//     return Scaffold(
//       body: Card(
//         child: Column(
//           children: [
//             AppBar(
//               backgroundColor: Colors.transparent,
//               elevation: 0,
//               toolbarHeight: 10,
//             ),
//             const Center(
//                 child: Padding(
//                     padding: EdgeInsets.only(bottom: 20),
//                     child: Text(
//                       'Profile',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.blue,
//                       ),
//                     ))),
//             // InkWell(
//             //     onTap: () {
//             //       navigateSecondPage(const EditImagePage());
//             //       // showDataAlert();
//             //     },
//             //     child: DisplayImage(
//             //       imagePath: user.image,
//             //       onPressed: () {},
//             //     )),
//             // buildUserInfoDisplay(user.name, 'Name', const EditNameFormPage()),
//             // buildUserInfoDisplay(
//             //     user.phone, 'Phone', const EditPhoneFormPage()),
//             // buildUserInfoDisplay(
//             //     user.email, 'Email', const EditEmailFormPage()),
//             // Expanded(
//             //   child: buildAbout(user),
//             //   flex: 4,
//             // )
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget builds the display item with the proper formatting to display the user's info
//   Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
//       Padding(
//           padding: const EdgeInsets.only(bottom: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 title,
//                 style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.grey,
//                 ),
//               ),
//               const SizedBox(
//                 height: 1,
//               ),
//               Container(
//                   width: 350,
//                   height: 40,
//                   decoration: const BoxDecoration(
//                       border: Border(
//                           bottom: BorderSide(
//                     color: Colors.grey,
//                     width: 1,
//                   ))),
//                   child: Row(children: [
//                     Expanded(
//                         child: TextButton(
//                             onPressed: () {
//                               navigateSecondPage(editPage);
//                             },
//                             child: Text(
//                               getValue,
//                               style: const TextStyle(fontSize: 16, height: 1.4),
//                             ))),
//                     const Icon(
//                       Icons.keyboard_arrow_right,
//                       color: Colors.grey,
//                       size: 40.0,
//                     )
//                   ]))
//             ],
//           ));

// Widget builds the About Me Section
// Widget buildAbout(User user) => Padding(
//     padding: const EdgeInsets.only(bottom: 10),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           'Tell Us About Yourself',
//           style: TextStyle(
//             fontSize: 15,
//             fontWeight: FontWeight.w500,
//             color: Colors.grey,
//           ),
//         ),
//         const SizedBox(height: 1),
//         Container(
//             width: 350,
//             height: 200,
//             decoration: const BoxDecoration(
//                 border: Border(
//                     bottom: BorderSide(
//               color: Colors.grey,
//               width: 1,
//             ))),
//             child: Row(children: [
//               Expanded(
//                   child: TextButton(
//                 onPressed: () {
//                   navigateSecondPage(EditDescriptionFormPage());
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       user.aboutMeDescription,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         height: 1.4,
//                       ),
//                     ),
//                   ),
//                 ),
//               )),
//               const Icon(
//                 Icons.keyboard_arrow_right,
//                 color: Colors.grey,
//                 size: 40.0,
//               )
//             ]))
//       ],
//     ));

// Refrshes the Page after updating user info.
//   FutureOr onGoBack(dynamic value) {
//     setState(() {});
//   }

//   // Handles navigation and prompts refresh.
//   void navigateSecondPage(Widget editForm) {
//     Route route = MaterialPageRoute(builder: (context) => editForm);
//     Navigator.push(context, route).then(onGoBack);
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gk_educational_charity_org_user_app/screens/login.dart';

import '../../controller/user_data.dart';

class ProfilePage extends StatefulWidget {
  // final int? id;

  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

final applicationController = Get.put(ApplicationController());
// final database1 = FirebaseFirestore.instance;
// Future<QuerySnapshot> app = database1.collection('users').get();

class _ProfilePageState extends State<ProfilePage> {
  void initState() {
    // call this method for api calling
    // applicationController.setPlanId(widget.id!);
    super.initState();
  }

  String? myEmail;
  String? fullName;
  String? role;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder(
          future: fetch(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return Text("Loading data...Please wait");
            // return Text("Email : $myEmail");
            return ListView.builder(
              itemCount: 1,
              itemBuilder: (_, i) {
                // final data = docs[i].data();
                return Column(
                  children: [
                    ProfilePic(),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileMenu(
                      text: "FullName : $fullName",
                      icon: 'assets/name.png',
                    ),

                    ProfileMenu(
                      text: "Email : $myEmail",
                      icon: 'assets/email.png',
                    ),

                    ProfileMenu(
                      text: "Role : $role",
                      icon: 'assets/role.png',
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserLogin()),
                        );
                      },
                      child: ProfileMenu(
                        text: "Logout",
                        icon: 'assets/logout.png',
                      ),
                    )

                    // subtitle: Text(data['phone']),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  fetch() async {
    final firebaseUser = await FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(firebaseUser.uid)
          .get()
          .then((value) {
        myEmail = value['email'];
        fullName = value['fullName'];
        role = value['rool'];
        print(myEmail);
        print(fullName);
        print(role);
      }).catchError((e) {
        print(e);
      });
    }
  }
}
// body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
//   stream: FirebaseFirestore.instance
//       .collection('users')
//       .orderBy('email')
//       .snapshots(),
//   builder: (_, snapshot) {
//     if (snapshot.hasError) return Text('Error = ${snapshot.error}');

//     if (snapshot.hasData) {
//       final docs = snapshot.data!.docs;

//       return ListView.builder(
//         itemCount: 1,
//         itemBuilder: (_, i) {
//           final data = docs[i].data();
//           return Column(
//             children: [
//               ProfilePic(),
//               SizedBox(
//                 height: 20,
//               ),
//               ProfileMenu(
//                 text: data['fullName'].toString(),
//                 icon: 'assets/name.png',
//               ),

//               ProfileMenu(
//                 text: data['email'],
//                 icon: 'assets/email.png',
//               ),

//               ProfileMenu(
//                 text: data['rool'],
//                 icon: 'assets/role.png',
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => UserLogin()),
//                   );
//                 },
//                 child: ProfileMenu(
//                   text: "Logout",
//                   icon: 'assets/logout.png',
//                 ),
//               )

//               // subtitle: Text(data['phone']),
//             ],
//           );
//         },
//       );

//     }

//     return Center(child: CircularProgressIndicator());
//   },
// ));

//   }
// }

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final String icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          // primary: kPrimaryColor,
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SizedBox(width: 20),
            Image.asset(
              icon,
              color: Colors.orangeAccent,
              width: 22,
            ),
            SizedBox(width: 20),
            Expanded(child: Text(text)),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      width: 135,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/mptyimage.png"),
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () {},
                child: Image.asset(
                  "assets/camera.png",
                  color: Colors.orangeAccent,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
