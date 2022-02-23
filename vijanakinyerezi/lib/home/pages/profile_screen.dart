import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vijanakinyerezi/utilities/localstorage/shared/local_storage.dart';

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
      body: Stack(
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
                    children: const [
                      SizedBox(
                        height: 40.0,
                      ),
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                        backgroundColor: Colors.white,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Costantino',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '+255659515042',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  height: 400.0,
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
                                      "Information",
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
                                              "Customer Name",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "Hon Gwaka",
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
                                              "Phone Number",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "+255659515042",
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
                                              "gwaka@gmail.com",
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
                                          Icons.map_rounded,
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
                                              "Address",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "Zimbili",
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
                                              "Username",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "@terabyte",
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
                                              "Company",
                                              style: TextStyle(
                                                fontSize: 15.0,
                                              ),
                                            ),
                                            Text(
                                              "JATU PLC",
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
                                          padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 10),
                                          color: MyColors.primary,
                                          onPressed: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder: (context) => SettingsScreen(),
                                            //   ),
                                            // );
                                          },
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            side: const BorderSide(color: Colors.white, width: 2),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Icon(
                                                Icons.settings,
                                                color: Colors.white,
                                                size: 15,
                                              ),
                                              Text(
                                                'Setting',
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
          Positioned(
            top: MediaQuery.of(context).size.height * 0.31,
            left: 20.0,
            right: 20.0,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Works',
                          style: TextStyle(
                            color: MyColors.primary,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          "120",
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    ),
                    Column(children: [
                      Text(
                        'Orders',
                        style: TextStyle(
                          color: MyColors.primary,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      const Text(
                        '200',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      )
                    ]),
                    Column(
                      children: [
                        Text(
                          'Completed',
                          style: TextStyle(
                            color: MyColors.primary,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Text(
                          '19',
                          style: TextStyle(
                            fontSize: 15.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
