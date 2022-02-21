import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vijanakinyerezi/onboard/models/onboard_model.dart';
import 'package:vijanakinyerezi/utilities/widget/buttons.dart';
import 'package:vijanakinyerezi/utilities/widget/dimension.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  int currentIndex = 0;
  late PageController _pageController;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: 'assets/images/register.svg',
      text: "USAJILI WA VIJANA",
      desc: "Jisajili hili kuweza kutambulika na kupata kila taarifa haraka mahali popote",
    ),
    OnboardModel(
      img: 'assets/images/time.svg',
      text: "PATA RATIBA YA MITOKO",
      desc: "Kuwa karibu na upatikanaji wa taarifa zote za vijana hususa ni mitoko mbali mbali ya vijana",
    ),
    OnboardModel(
      img: 'assets/images/saving.svg',
      text: "FATILIA MATOLEO YAKO YA KILA MWEZI",
      desc: "Matoleo yako ya kila mwezi sasa yatapatikana kiganjani mwako haraka na kwa ufanisi",
    ),
    OnboardModel(
      img: 'assets/images/connect.svg',
      text: "KUTANA NA MARAFIKI",
      desc: "Jumuika na marafiki zako mahala popote wakati wowote",
    )
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoardApp', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              _storeOnboardInfo();
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const LoginScreen(),
              //   ),
              // );
            },
            child: currentIndex == screens.length - 1
                ? const SizedBox()
                : Text(
                    "Skip",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
            itemCount: screens.length,
            controller: _pageController,
            // physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (_, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    screens[index].img,
                    height: jtdeviceHeight(context) / 2.5,
                    width: jtdeviceWidth(context) / 1.5,
                  ),
                  SizedBox(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3.0),
                            width: currentIndex == index ? 25 : 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: currentIndex == index ? Theme.of(context).primaryColor : Colors.grey,
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                          ),
                        ]);
                      },
                    ),
                  ),
                  Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    screens[index].desc,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                  index == screens.length - 1
                      ? JTButtons(
                          // buttonHeight: 53,
                          radius: 5,
                          action: () {
                            _storeOnboardInfo();
                            // JTAppNavigation.pushReplaceAnimatedTransition(
                            //   context,
                            //   child: const HomeBottomNavigationBar(),
                            // );
                          },
                          buttonColor: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
                            child: Text(
                              "Get Started".toUpperCase(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          buttonWidth: jtdeviceWidth(context),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            index == 0
                                ? const SizedBox()
                                : InkWell(
                                    onTap: () {
                                      _pageController.jumpTo(index - 1);
                                    },
                                    child: const Text(
                                      "Prev",
                                      style: TextStyle(
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                            InkWell(
                              onTap: () async {
                                if (index == screens.length - 1) {
                                  await _storeOnboardInfo();
                                  // JTAppNavigation.pushReplaceAnimatedTransition(
                                  //   context,
                                  //   child: const HomeBottomNavigationBar(),
                                  // );
                                }

                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.bounceIn,
                                );
                              },
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ],
                        )
                ],
              );
            }),
      ),
    );
  }
}
