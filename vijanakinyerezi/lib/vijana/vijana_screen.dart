import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vijanakinyerezi/utilities/widget/colors.dart';

class VijanaScreen extends StatefulWidget {
  final dynamic kamati;
  const VijanaScreen({Key? key, this.kamati}) : super(key: key);

  @override
  _VijanaScreenState createState() => _VijanaScreenState();
}

class _VijanaScreenState extends State<VijanaScreen> {
  Future<dynamic> getWanajumuiya() async {
    String myApi = "http://vijanakinyerezi.000webhostapp.com/admin/api/get_vijana.php";
    final response = await http.post(
      Uri.parse(myApi),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          children: [
            const Text(
              "Vijana Wa Kinyerezi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
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
                          return GestureDetector(
                            onLongPress: () {
                              launch("tel://${snapshot.data[index]['phone']}");
                            },
                            child: Card(
                              elevation: 2,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.white,
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(1, 1), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 2),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          'assets/images/avatar.png',
                                          width: 35,
                                          height: 35,
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                            child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Text(
                                                    snapshot.data[index]['fname'],
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  snapshot.data[index]['phone'],
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 2),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data[index]['elimu'],
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    const Text(
                                                      "Ujuzi :",
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    Text(
                                                      snapshot.data[index]['ujuzi'],
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black,
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
