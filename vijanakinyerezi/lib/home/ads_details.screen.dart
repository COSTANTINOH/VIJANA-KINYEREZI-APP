import 'package:flutter/material.dart';

class AdsDetailPage extends StatefulWidget {
  const AdsDetailPage({Key? key}) : super(key: key);

  @override
  _AdsDetailPageState createState() => _AdsDetailPageState();
}

class _AdsDetailPageState extends State<AdsDetailPage> {
  var isPressed = true;

  //mainImage
  Widget mainImageWidget(height) => Container(
        height: height / 2,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://i.ibb.co/0c5P5HG/baner2.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 48, left: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              IconButton(
                icon: (isPressed)
                    ? const Icon(
                        Icons.bookmark_border,
                        color: Colors.white,
                        size: 28,
                      )
                    : const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                        size: 28,
                      ),
                onPressed: () {
                  setState(() {
                    if (isPressed == true) {
                      isPressed = false;
                    } else {
                      isPressed = true;
                    }
                  });
                },
              )
            ],
          ),
        ),
      );

  //Bottom Sheet Content

  Widget bottomContent(height, width) => Container(
        margin: EdgeInsets.only(top: height / 20),
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Category
              const Text(
                "JATU KENYA",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.deepOrange),
              ),

              const SizedBox(
                height: 12,
              ),

              //Title
              const Text(
                "Faida za kuuza na kununua na JATU MARKET (KE) Platform",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(
                height: 12,
              ),

              //like and duration
              Row(
                children: const <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "25 sec ago",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              //Profile Pic
              Row(
                children: <Widget>[
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                      shape: BoxShape.rectangle,
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://lh3.googleusercontent.com/a-/AOh14GgDFwkWyaYjIhPGxJCE1kQDeXu0L1oAvzd1lHByGA=s96-c"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Cosmasi Paul",
                    style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),

              //Paragraph
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: TextStyle(color: Colors.black54, fontSize: 16.5, height: 1.4),
                textAlign: TextAlign.left,
                maxLines: 8,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: <Widget>[
          //Main Image
          mainImageWidget(height),

          //Bottom Sheet
          Container(
            //Bottom Sheet Dimensions
            margin: EdgeInsets.only(top: height / 2.3),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            ),

            child: bottomContent(height, width),
          ),
        ],
      ),
    );
  }
}
