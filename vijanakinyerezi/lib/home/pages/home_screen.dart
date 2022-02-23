import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vijanakinyerezi/utilities/widget/colors.dart';
import 'package:vijanakinyerezi/utilities/widget/dimension.dart';

import '../../widgets/carousel_pro/src/carousel_pro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 0.0,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: jtdeviceHeight(context) / 20),
                child: SizedBox(
                  // decoration: BoxDecoration(color: MyColors.primaryLight),
                  height: 30,
                  child: Center(
                    child: Text(
                      "APP NAME",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryLight,
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 200.0,
                child: Carousel(
                  boxFit: BoxFit.cover,
                  dotColor: Color(0xFF6991C7),
                  dotSize: 5.5,
                  dotSpacing: 16.0,
                  dotBgColor: Colors.transparent,
                  showIndicator: true,
                  overlayShadow: true,
                  overlayShadowColors: Colors.white,
                  overlayShadowSize: 0.9,
                  images: [
                    AssetImage("assets/images/vijanawa.png"),
                    AssetImage("assets/images/vijanawa.png"),
                    AssetImage("assets/images/vijanawa.png"),
                    AssetImage("assets/images/vijanawa.png"),
                    AssetImage("assets/images/vijanawa.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
