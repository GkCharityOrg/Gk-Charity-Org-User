import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gk_educational_charity_org_user_app/screens/status.dart';
import 'package:gk_educational_charity_org_user_app/screens/userForm.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'user_edit/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DashBoard(),
    // Container(),
    UserForm(),
    Status(),
    ProfilePage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        elevation: 2,
        iconSize: 32,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.file_upload),
            label: "Form",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.clipboard_1),
            label: "Status",
          ),
          BottomNavigationBarItem(
            icon: Icon(LineAwesomeIcons.user),
            label: "Profile",
          ),
        ],
      ),
      body: _children[_currentIndex],
    );
  }
}

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        // surfaceTintColor: Colors.white,
        // foregroundColor: Colors.transparent,
        // backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: [
                  CarouselSlider(
                    items: [
                      //1st Image of Slider
                      Card(
                        // color: Colors.green[100],
                        child: Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.all(6.0),
                          child: ListView(children: <Widget>[
                            Image.asset(
                              "assets/banner1.jpeg",
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Scholarships',
                              style: TextStyle(
                                  // color: Colors.green,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold), //TextStyle
                            ),
                            const SizedBox(
                              height: 5,
                            ), //SizedBox
                            const Text(
                              'We can’t help everyone, but everyone can help someone.',
                              style: TextStyle(
                                  // color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold), //TextStyle
                            ), //Text
                          ]),
                        ),
                      ),

                      //2nd Image of Slider
                      Card(
                        // color: Colors.green[100],
                        child: Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.all(6.0),
                          child: ListView(children: <Widget>[
                            Image.asset(
                              "assets/banner2.jpeg",
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Infrastructure',
                              style: TextStyle(
                                  // color: Colors.green,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold), //TextStyle
                            ),
                            const SizedBox(
                              height: 5,
                            ), //SizedBox
                            const Text(
                              'Scholarship is to be created not by compulsion, but by awakening a pure interest in knowledge.',
                              style: TextStyle(
                                  // color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold), //TextStyle
                            ), //Text
                          ]),
                        ),
                      ),

                      //3rd Image of Slider
                      Card(
                        // color: Colors.green[100],
                        child: Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.all(6.0),
                          child: ListView(
                            children: <Widget>[
                              Image.asset(
                                "assets/banner3.jpeg",
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Education',
                                style: TextStyle(
                                    // color: Colors.green,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold), //TextStyle
                              ),
                              const SizedBox(
                                height: 5,
                              ), //SizedBox
                              const Text(
                                'Education: A Human Right for All',
                                style: TextStyle(
                                    // color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold), //TextStyle
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],

                    //Slider Container properties
                    options: CarouselOptions(
                      height: 420,
                      //       onPageChanged: (position, reason) {
                      //         print(reason);
                      //         print(CarouselPageChangedReason.controller);
                      //       },
                      //       enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                ],
              ),
            ),

            // Container(
            //   child: CarouselSlider(
            //     options: CarouselOptions(
            //       // height: MediaQuery.of(context).size.height,
            //       height: 420,
            //       enlargeCenterPage: true,
            //       onPageChanged: (position, reason) {
            //         print(reason);
            //         print(CarouselPageChangedReason.controller);
            //       },
            //       enableInfiniteScroll: false,
            //     ),
            //     items: slider_data.map<Widget>((index) {
            //       return Builder(
            //         builder: (BuildContext context) {
            //           return Container(
            //             width: MediaQuery.of(context).size.width,
            //             decoration: BoxDecoration(),

            //             // margin: const EdgeInsets.all(10.0),
            //             child: ClipRect(
            //               /** Banner Widget **/
            //               // child: Banner(
            //               // message: "",
            //               // location: BannerLocation.bottomStart,
            //               // color: Colors.red,
            //               child: Container(
            //                 color: Colors.green[100],
            //                 // height: 400,
            //                 // height = MediaQuery.of(context).height;
            //                 // width = MediaQuery.of(context).width;
            //                 child: Padding(
            //                   padding:
            //                       const EdgeInsets.fromLTRB(10, 20, 10, 20),
            //                   child: ListView(
            //                     children: <Widget>[
            //                       Image.asset(

            //                         "assets/banner1.jpeg",
            //                         fit: BoxFit.cover,
            //                       ),
            //                       const SizedBox(height: 10),
            //                       const Text(
            //                         'GK Charitable Trust',
            //                         style: TextStyle(
            //                             color: Colors.green,
            //                             fontSize: 40,
            //                             fontWeight:
            //                                 FontWeight.bold), //TextStyle
            //                       ),
            //                       const SizedBox(
            //                         height: 5,
            //                       ), //SizedBox
            //                       const Text(
            //                         'Education: A Human Right for All',
            //                         style: TextStyle(
            //                             color: Colors.green,
            //                             fontSize: 20,
            //                             fontWeight:
            //                                 FontWeight.bold), //TextStyle
            //                       ), //Text
            //                       const SizedBox(height: 20),

            //                       // RaiseButton is deprecated and should not be used. Use ElevatedButton instead.

            //                       // RaisedButton(
            //                       // color: Colors.greenAccent[400],
            //                       // onPressed: () {},
            //                       // child: const Text('Register'),
            //                       // ) //RaisedButton
            //                     ], //<Widget>[]
            //                   ), //Column
            //                 ), //Padding
            //               ), //Container
            //             ), //Banner
            //           );
            //         },
            //       );
            //     }).toList(),
            //   ),
            // ),

            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: const Card(
                shadowColor: Colors.black,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Education is the process of acquiring and transmitting knowledge, skills, values, and culture in formal or informal settings.",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
            Container(
              // color: Colors.green,
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const UserForm()),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Click Here To Apply",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
