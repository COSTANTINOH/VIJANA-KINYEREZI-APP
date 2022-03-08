import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:vijanakinyerezi/home/home_page.dart';
import 'package:vijanakinyerezi/utilities/constants/constant.dart';
import 'package:vijanakinyerezi/utilities/localstorage/shared/local_storage.dart';
import 'package:vijanakinyerezi/utilities/widget/popup_feedback.dart';

import '../../utilities/widget/colors.dart';

var dataz;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int counter = 0;

  @override
  void initState() {
    getdataLocal();
    super.initState();
  }

  void getdataLocal() async {
    await LocalStorage.getStringItem('mydata').then((value) {
      if (value.isNotEmpty) {
        var mydata = jsonDecode(value);
        setState(() {
          dataz = mydata;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataz == null
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: MyColors.primary,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40.0,
                            ),
                            const CircleAvatar(
                              radius: 60.0,
                              backgroundImage: AssetImage('assets/images/avatar.png'),
                              backgroundColor: Colors.white,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              dataz['fname'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              dataz['phone'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Container(
                        height: 500.0,
                        color: Colors.grey[200],
                        child: SingleChildScrollView(
                          child: Center(
                            child: Card(
                              child: SizedBox(
                                  width: 310.0,
                                  height: 400.0,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Taarifa zako",
                                            style: TextStyle(
                                              fontSize: 17.0,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey[300],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.person,
                                                color: MyColors.primary,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 20.0,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Jina kamili",
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    dataz['fname'],
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.grey[400],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.phone,
                                                color: MyColors.primary,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 20.0,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Namba ya simu",
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    dataz['phone'],
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.grey[400],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.email,
                                                color: MyColors.primary,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 20.0,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "e-Mail",
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    dataz['email'],
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.grey[400],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.school,
                                                color: MyColors.primary,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 20.0,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Elimu",
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    dataz['elimu'],
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.grey[400],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.task_alt,
                                                color: MyColors.primary,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 20.0,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Ujuzi",
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    dataz['ujuzi'],
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.grey[400],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.work,
                                                color: MyColors.primary,
                                                size: 20,
                                              ),
                                              const SizedBox(
                                                width: 20.0,
                                              ),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    "Kazi",
                                                    style: TextStyle(
                                                      fontSize: 15.0,
                                                    ),
                                                  ),
                                                  Text(
                                                    dataz['kazi'],
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.grey[400],
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          const Divider(),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              RaisedButton(
                                                padding:
                                                    const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
                                                color: MyColors.primary,
                                                onPressed: () async {
                                                  await LocalStorage.removeItem("member_no").whenComplete(() async {
                                                    await LocalStorage.removeItem("mydata").whenComplete(() async {
                                                      await LocalStorage.removeItem("mtumishi").whenComplete(() {
                                                        setState(() {
                                                          accessToken = '';
                                                        });

                                                        Navigator.of(context).push(MaterialPageRoute(
                                                            builder: (context) => const HomePageScreen()));

                                                        return popUpFeedback(
                                                          context,
                                                          message: "Umetoka kwenye akaunti yako",
                                                          title: "Imefanikiwa",
                                                          icon: Icons.check_box_outlined,
                                                          colors: Colors.green,
                                                          position: StyledToastPosition.top,
                                                        );
                                                      });
                                                    });
                                                  });
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                  side: const BorderSide(color: Colors.white, width: 2),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: const [
                                                    Icon(
                                                      Icons.logout,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                    SizedBox(width: 5),
                                                    Text(
                                                      'toka',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
