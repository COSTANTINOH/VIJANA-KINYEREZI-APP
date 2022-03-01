import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:vijanakinyerezi/auth/screens/login_screen.dart';
import 'package:vijanakinyerezi/utilities/widget/alert.dart';

import '../../utilities/widget/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isregistered = false;

  TextEditingController xfname = TextEditingController();
  TextEditingController xphone = TextEditingController();
  TextEditingController xpassword = TextEditingController();
  TextEditingController xemail = TextEditingController();
  TextEditingController haliYaNdoa = TextEditingController();
  TextEditingController jinaLaMwenziWako = TextEditingController();

  TextEditingController xusername = TextEditingController();
  TextEditingController xaddress = TextEditingController();
  TextEditingController xcompany = TextEditingController();
  TextEditingController jinaLaJumuiya = TextEditingController();

  int currentStep = 0;
  late bool showpassword;
  String _halindoa = '';
  List<dynamic> _dataProvince = [];
  String? _valProvince;
  String idYaJumuiya = '';

  @override
  void initState() {
    super.initState();
    getJumuiyaApi();
    showpassword = false;
  }

  Future<dynamic> register(String fname, String phone, String password, String email, String username, String address,
      String company) async {
    String myApi = "https://nswls.000webhostapp.com/admin/api/register.php/";
    Alerts.showProgressDialog(context, "Please Wait,regestering your account");

    setState(() {
      isregistered = true;
    });

    if (xfname.text.isEmpty ||
        xphone.text.isEmpty ||
        xpassword.text.isEmpty ||
        xemail.text.isEmpty ||
        xusername.text.isEmpty ||
        xaddress.text.isEmpty ||
        xcompany.text.isEmpty) {
      setState(() {
        isregistered = false;
      });
      Navigator.pop(context);
    }

    if (fname == "" ||
        phone == "" ||
        password == "" ||
        email == "" ||
        username == "" ||
        address == "" ||
        company == "") {
      setState(() {
        isregistered = false;
      });
      Navigator.pop(context);
    }

    final response = await http.post(Uri.parse(myApi), headers: {
      'Accept': 'application/json'
    }, body: {
      "fname": fname,
      "phone": phone,
      "password": password,
      "email": email,
      "username": username,
      "address": address,
      "company": company,
    });
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null && jsonResponse != 404 && jsonResponse != 500) {
        // var json = jsonDecode(response.body);
        setState(() {
          isregistered = false;
        });
        Navigator.pop(context);

        xfname.clear();
        xpassword.clear();
        xpassword.clear();
        xemail.clear();
        xphone.clear();
        xusername.clear();
        xaddress.clear();
        xcompany.clear();

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else if (jsonResponse == 404) {
        setState(() {
          isregistered = false;
        });
        Navigator.pop(context);
      } else if (jsonResponse == 500) {
        setState(() {
          isregistered = false;
        });
        Navigator.pop(context);
      }
    } else {
      Navigator.pop(context);
    }
  }

  Widget _entryField(String title, TextEditingController textcontroller, {bool isPassword = false}) {
    if (title == "Phone Number") {
      return Container(
        decoration: const BoxDecoration(
          color: Color(0xfff3f3f4),
        ),
        margin: const EdgeInsets.symmetric(vertical: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            TextField(
              controller: textcontroller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              style: GoogleFonts.aBeeZee(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              onChanged: (phone) {
                setState(() {});
              },
            )
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: textcontroller,
              obscureText: isPassword,
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
      );
    }
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () {
        register(xfname.text, xphone.text, xpassword.text, xemail.text, xusername.text, xaddress.text, xcompany.text);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: MyColors.primary,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
        ),
        child: const Text(
          'Register Now',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  void getJumuiyaApi() async {
    String myApi = "https://kinyerezi2021.000webhostapp.com/api/getjumuiya.php";
    final response = await http.post(
      Uri.parse(myApi),
      headers: {
        'Accept': 'application/json',
      },
    );

    var jumuiya;

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);

      if (jsonResponse != null && jsonResponse != 404) {
        var json = jsonDecode(response.body);
        jumuiya = json;
      }
    }
    setState(() {
      _dataProvince = jumuiya;
    });
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(color: Color(0xfff79c4f), fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.asset('assets/images/logo_nsw.png'),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'APP NAME',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            letterSpacing: 0.27,
            color: MyColors.primary,
          ),
        ),
        Text(
          'Pamoja katika BWANA!',
          textAlign: TextAlign.left,
          style: GoogleFonts.gochiHand(
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _sectionA() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          _entryField("Jina Kamili", xfname),
          _entryField("Namba ya simu", xphone),
          _entryField("Barua pepe", xphone),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Hali ya ndoa',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                title: const Text('Nimeoa'),
                leading: Radio(
                  value: "Nimeoa",
                  groupValue: _halindoa,
                  onChanged: (value) {
                    setState(() {
                      _halindoa = value.toString();
                      haliYaNdoa.text = value.toString();
                    });
                  },
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                title: const Text('Sijaoa'),
                leading: Radio(
                  value: "Sijaoa",
                  groupValue: _halindoa,
                  onChanged: (value) {
                    setState(() {
                      _halindoa = value.toString();
                      haliYaNdoa.text = value.toString();
                    });
                  },
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                title: const Text('Mgane'),
                leading: Radio(
                  value: "mgane",
                  groupValue: _halindoa,
                  onChanged: (value) {
                    setState(() {
                      _halindoa = value.toString();
                      haliYaNdoa.text = value.toString();
                    });
                  },
                ),
              ),
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                dense: true,
                title: const Text('Talakiwa'),
                leading: Radio(
                  value: "talakiwa",
                  groupValue: _halindoa,
                  onChanged: (value) {
                    setState(() {
                      _halindoa = value.toString();
                      haliYaNdoa.text = value.toString();
                    });
                  },
                ),
              ),
            ],
          ),
          _entryField("Jina la mke/mume", xphone),
        ],
      ),
    );
  }

  Widget _sectionB() {
    return Column(
      children: <Widget>[
        _entryField("Elimu yako", xfname),
        _entryField("Ujuzi", xphone),
        _entryField("Kazi", xphone),
        _entryField("Hobi", xphone),
      ],
    );
  }

  Widget _sectionC() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Jina la jumuiya',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        // ignore: unnecessary_null_comparison
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: SizedBox(
            width: double.infinity,
            child: DropdownButton(
              hint: const Text("Chagua Jumuiya yako"),
              value: _valProvince,
              items: _dataProvince.map((item) {
                return DropdownMenuItem(
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_work_outlined,
                        color: MyColors.primaryLight,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        item['jumuiya_name'],
                        style: TextStyle(
                          color: MyColors.primaryLight,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  value: item['jumuiya_name'], //{"id": item['id'].toString(), "jina": item['jumuiya_name'].toString()},
                );
              }).toList(),
              onChanged: (value) async {
                setState(() {
                  _valProvince = value.toString();
                  jinaLaJumuiya.text = value.toString();
                  idYaJumuiya = value.toString();
                });
              },
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Unapenda kujiunga na soma biblia/kwaya',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              dense: true,
              title: const Text('Ndio'),
              leading: Radio(
                value: "Ndio",
                groupValue: _halindoa,
                onChanged: (value) {
                  setState(() {
                    _halindoa = value.toString();
                    haliYaNdoa.text = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              dense: true,
              title: const Text('Hapana'),
              leading: Radio(
                value: "Hapana",
                groupValue: _halindoa,
                onChanged: (value) {
                  setState(() {
                    _halindoa = value.toString();
                    haliYaNdoa.text = value.toString();
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  //  _entryField("Username", xusername),
  //       _entryField("Email", xemail),
  //       _entryField("Address", xaddress),
  //       _entryField("Company", xcompany),
  //       _entryField("Password", xpassword, isPassword: true),

  List<Step> getSteps() => [
        Step(
          isActive: currentStep >= 0,
          title: const Text("Taarifa zako"),
          content: SizedBox(
            child: Column(
              children: [
                _sectionA(),
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 1,
          title: const Text("Elimu"),
          content: SizedBox(
            child: Column(
              children: [
                _sectionB(),
              ],
            ),
          ),
        ),
        Step(
          isActive: currentStep >= 2,
          title: const Text("Kanisa"),
          content: SizedBox(
            child: Column(
              children: [
                _sectionC(),
              ],
            ),
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        title: const Center(child: Text("Usajili APP NAME")),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStep,
        onStepContinue: () {
          final isLastStep = currentStep == getSteps().length - 1;
          if (isLastStep) {
            //send data to server
          } else {
            setState(() {
              currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (currentStep == 0) {
          } else {
            setState(() {
              currentStep -= 1;
            });
          }
        },
      ),
    );
  }
}
