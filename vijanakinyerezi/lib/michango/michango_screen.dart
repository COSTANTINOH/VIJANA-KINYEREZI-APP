import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:vijanakinyerezi/home/home_page.dart';
import 'package:vijanakinyerezi/utilities/widget/colors.dart';

class WaletScreen extends StatefulWidget {
  final dynamic kamati;
  const WaletScreen({Key? key, this.kamati}) : super(key: key);

  @override
  _WaletScreenState createState() => _WaletScreenState();
}

class _WaletScreenState extends State<WaletScreen> {
  Future<dynamic> getJumlaYAKO() async {
    log("namba ${data['phone']}");
    String myApi = "http://vijanakinyerezi.000webhostapp.com/admin/api/get_jumla_wekeza.php";
    final response = await http.post(
      Uri.parse(myApi),
      headers: {
        'Accept': 'application/json',
      },
      body: {
        "phone_number": data['phone'],
      },
    );

    var baraza;
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null && jsonResponse != 404) {
        var json = jsonDecode(response.body);
        baraza = json;
      }
    }

    return baraza;
  }

  int sum = 0;
  Future<dynamic> getWanajumuiya() async {
    String myApi = "https://galilaya.000webhostapp.com/admin/api/get_wekeza.php";
    final response = await http.post(
      Uri.parse(myApi),
      body: {
        "phone_number": '0659515042' //data['phone'],
      },
      headers: {
        'Accept': 'application/json',
      },
    );

    var baraza;
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      if (jsonResponse != null && jsonResponse != 404) {
        var json = jsonDecode(response.body);
        baraza = json;
      }
    }

    return baraza;
  }

  Future<void> _pullRefresh() async {
    getWanajumuiya().then((value) {
      setState(() {
        //finish
      });
      return;
    });
  }

  final currency = NumberFormat("#,###.#", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            Column(
              children: [
                const Text(
                  "Mfuko wa vijana",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                FutureBuilder(
                  //Error number 2
                  future: getJumlaYAKO(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        child: Lottie.asset('assets/animations/small_loading.json'),
                        height: 50,
                      );
                    } else if (snapshot.hasData) {
                      return Text(
                        "Jumla kuu  Tsh. ${currency.format(snapshot.data)}/=",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    } else {
                      return const Text("no data");
                    }
                  },
                ),
              ],
            ),
            // Divider(
            //   thickness: 3,
            //   color: MyColors.primary,
            // ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _pullRefresh,
                child: FutureBuilder(
                  //Error number 2
                  future: getWanajumuiya(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(90.0),
                            child: Column(
                              children: [
                                Lottie.asset('assets/animations/loading.json'),
                                const SizedBox(
                                  height: 2,
                                ),
                                Material(
                                  child: Text(
                                    "Inapanga taarifa",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.0,
                                      color: MyColors.primaryLight,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError || !snapshot.hasData) {
                      return RefreshIndicator(
                        onRefresh: _pullRefresh,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Lottie.asset('assets/animations/no_data.json'),
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    Material(
                                      child: Text(
                                        "Hakuna taarifa zilizopatikana",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.0,
                                          color: MyColors.primaryLight,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) {
                          return Card(
                            elevation: 2,
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: const Offset(1, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  const SizedBox(height: 2),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(width: 20),
                                      Expanded(
                                          child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    const Text(
                                                      "Jina :",
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data[index]['familia'],
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: FontWeight.w700,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 5),
                                              Row(
                                                children: [
                                                  const Text(
                                                    "Kiasi :",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data[index]['kiasi'] + "/=",
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          const SizedBox(height: 2),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const SizedBox(height: 10),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        const Text(
                                                          "Mwezi :",
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data[index]['mwezi'],
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        const Text(
                                                          "Tarehe :",
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.black,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data[index]['tarehe'],
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Text("NO peoples");
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
