import 'dart:convert';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:vijanakinyerezi/auth/screens/login_screen.dart';
import 'package:vijanakinyerezi/auth/screens/register_screen.dart';
import 'package:vijanakinyerezi/utilities/widget/alert.dart';
import 'package:vijanakinyerezi/utilities/widget/colors.dart';
import 'package:vijanakinyerezi/utilities/widget/index.dart';
import 'package:vijanakinyerezi/utilities/widget/popup_feedback.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController cpassword = TextEditingController();
  bool isregistered = false;
  Future<dynamic> register() async {
    String myApi = "http://vijanakinyerezi.000webhostapp.com/admin/api/register.php";
    Alerts.showProgressDialog(context, "Please Wait,regestering your account");

    setState(() {
      isregistered = true;
    });

    final response = await http.post(Uri.parse(myApi), headers: {
      'Accept': 'application/json'
    }, body: {
      "fname": userData["fname"],
      "phone": userData["phone"],
      "email": userData["email"],
      "halindoa": userData["halindoa"],
      "jinamwenza": userData["jinamwenza"],
      "elimu": userData["elimu"],
      "ujuzi": userData["ujuzi"],
      "kazi": userData["kazi"],
      "hobi": userData["hobi"],
      "jinajumuiya": userData["jinajumuiya"],
      "biblia": userData["biblia"],
      "password": password.text
    });
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null && jsonResponse != 404 && jsonResponse != 500) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
        return popUpFeedback(
          context,
          message: "Weka neno lako la siri",
          title: "Imefanikiwa",
          icon: Icons.check_box_outlined,
          colors: Colors.green,
          position: StyledToastPosition.top,
        );
      } else if (jsonResponse == 404) {
        Navigator.pop(context);
      } else if (jsonResponse == 500) {
        Navigator.pop(context);
      }
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: const Text("Hakiki taarifa zako"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            DataTable(
              columns: const [
                DataColumn(label: Text("Taarifa", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                DataColumn(label: Text("", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
              ],
              rows: [
                DataRow(cells: [
                  const DataCell(Text(
                    "Jina Kamili",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(userData['fname'])),
                ]),
                DataRow(cells: [
                  const DataCell(Text(
                    "Namba ya simu",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(userData['phone'])),
                ]),
                DataRow(cells: [
                  const DataCell(Text(
                    "Barua Pepe",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(userData['email'])),
                ]),
                DataRow(cells: [
                  const DataCell(Text(
                    "Hali ya ndoa",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(userData['halindoa'])),
                ]),
                DataRow(cells: [
                  const DataCell(Text(
                    "Elimu",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(userData['elimu'])),
                ]),
                DataRow(cells: [
                  const DataCell(Text(
                    "Kazi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(userData['kazi'])),
                ]),
                DataRow(cells: [
                  const DataCell(Text(
                    "Hobi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(userData['hobi'])),
                ]),
                DataRow(cells: [
                  const DataCell(Text(
                    "Jina La Jumuiya",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(userData['jinajumuiya'])),
                ]),
                DataRow(cells: [
                  const DataCell(Text(
                    "Biblia",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(userData['biblia'])),
                ]),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          "Neno la siri",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: password,
                          obscureText: true,
                          style: GoogleFonts.aBeeZee(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            fillColor: Color(0xfff3f3f4),
                            filled: true,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            jtmanualStepper(step: 20),
            JTButtons(
              buttonHeight: 53,
              radius: 5,
              action: () async {
                if (password.text.isEmpty) {
                  return popUpFeedback(
                    context,
                    message: "Weka neno lako la siri",
                    title: "shida",
                    icon: Icons.error,
                    colors: Theme.of(context).errorColor,
                    position: StyledToastPosition.top,
                  );
                } else {
                  await register();
                }
              },
              buttonColor: MyColors.primary,
              child: const Text(
                "Jisajili",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                  fontStyle: FontStyle.normal,
                ),
              ),
              buttonWidth: jtdeviceWidth(context) * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
