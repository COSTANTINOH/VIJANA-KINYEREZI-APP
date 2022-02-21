import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  static List<String> userpermissions = [];

  User({
    this.phone,
    this.firstname,
    this.middlename,
    this.lastname,
    this.email,
    this.membershipnumber,
    this.agentnumber,
    this.sponsornumber,
    this.countryid,
    this.postalcode,
    this.status,
    this.profilephoto,
  });

  String? phone;
  String? firstname;
  String? middlename;
  String? lastname;
  String? email;
  String? membershipnumber;
  String? agentnumber;
  String? sponsornumber;
  String? countryid;
  String? postalcode;
  String? status;
  String? profilephoto;

  static User? getDataHolder;

  factory User.fromJson(Map<String, dynamic> json) => User(
        phone: json["phone"],
        firstname: json["firstname"],
        middlename: json["middlename"],
        lastname: json["lastname"],
        email: json["email"],
        membershipnumber: json['membershipnumber'],
        agentnumber: json["agentnumber"],
        sponsornumber: json["sponsornumber"],
        countryid: json["countryid"],
        postalcode: json["postalcode"],
        status: json["status"],
        profilephoto: json["profilephoto"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "firstname": firstname,
        "middlename": middlename,
        "lastname": lastname,
        "email": email,
        "membership_number": membershipnumber,
        "agentnumber": agentnumber,
        "sponsornumber": sponsornumber,
        "countryid": countryid,
        "postalcode": postalcode,
        "status": status,
        "profilephoto": profilephoto,
      };
}
