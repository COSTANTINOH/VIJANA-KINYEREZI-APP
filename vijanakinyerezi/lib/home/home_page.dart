import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vijanakinyerezi/home/event_detail_page.dart';
import 'package:vijanakinyerezi/home/pages/profile_screen.dart';
import 'package:vijanakinyerezi/michango/michango_screen.dart';
import 'package:vijanakinyerezi/news/news_home.dart';
import 'package:vijanakinyerezi/utilities/app_utils.dart';
import 'package:vijanakinyerezi/utilities/models/event_model.dart';
import 'package:vijanakinyerezi/utilities/widget/bottom_navigation_bar.dart';
import 'package:vijanakinyerezi/utilities/widget/carousel_pro/src/carousel_pro.dart';
import 'package:vijanakinyerezi/utilities/widget/home_bg_color.dart';
import 'package:vijanakinyerezi/utilities/widget/image.dart';
import 'package:vijanakinyerezi/utilities/widget/nearby_event_card.dart';
import 'package:vijanakinyerezi/utilities/widget/neno_card.dart';
import 'package:vijanakinyerezi/utilities/widget/text_style.dart';
import 'package:vijanakinyerezi/utilities/widget/ui_helper.dart';
import 'package:vijanakinyerezi/utilities/widget/upcoming_event_card.dart';
import 'package:vijanakinyerezi/vijana/vijana_screen.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  late PageController _pageController;

  late ScrollController scrollController;
  late AnimationController controller;
  late AnimationController opacityController;
  late Animation<double> opacity;

  @override
  void initState() {
    scrollController = ScrollController();
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1))..forward();
    opacityController = AnimationController(vsync: this, duration: const Duration(microseconds: 1));
    opacity = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      curve: Curves.linear,
      parent: opacityController,
    ));
    scrollController.addListener(() {
      opacityController.value = offsetToOpacity(
          currentOffset: scrollController.offset, maxOffset: scrollController.position.maxScrollExtent / 2);
    });
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List images = [
    "https://i.ibb.co/fNNTcM8/kinyerezi2.jpg",
    "https://i.ibb.co/dDB4P4H/kinyerezi2.jpg",
    "https://i.ibb.co/617qyHx/kinyerezi1.png",
  ];

  Widget? getBody() {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    if (_currentIndex == 0) {
      return Stack(
        children: <Widget>[
          HomeBackgroundColor(opacity),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildSearchAppBar(),
                UIHelper.verticalSpace(16),
                SizedBox(
                  height: 200.0,
                  child: Carousel(
                    boxFit: BoxFit.cover,
                    dotColor: const Color(0xFF6991C7),
                    dotSize: 5.5,
                    dotSpacing: 16.0,
                    dotBgColor: Colors.transparent,
                    showIndicator: true,
                    overlayShadow: true,
                    overlayShadowColors: Colors.white,
                    overlayShadowSize: 0.9,
                    images: List.generate(
                      images.length,
                      (index) {
                        return InkWell(
                          onTap: () {},
                          child: ImagePreview(
                            img: images[index],
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                buildUpComingEventList(),
                UIHelper.verticalSpace(16),
                buildNearbyConcerts(),
              ],
            ),
          ),
        ],
      );
    } else if (_currentIndex == 1) {
      return const NewsHome();
    } else if (_currentIndex == 2) {
      return const WaletScreen();
    } else if (_currentIndex == 3) {
      return const VijanaScreen();
    } else if (_currentIndex == 4) {
      return const Profile();
    }
    return null;
  }

  Widget buildSearchAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            "APP NAME",
            style: headerStyle.copyWith(
              color: Colors.white,
            ),
          ),
          UIHelper.verticalSpace(16),
          Text(
            "Karibu, Costantino Dionis Gwaka",
            style: subtitleStyle.copyWith(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUpComingEventList() {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalSpace(16),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: upcomingEvents.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final event = upcomingEvents[index];
                return UpComingEventCard(
                  event: event,
                  onTap: () => viewEventDetail(event),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void viewEventDetail(Event event) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (BuildContext context, animation, __) {
          return FadeTransition(
            opacity: animation,
            child: EventDetailPage(event),
          );
        },
      ),
    );
  }

  Widget buildNearbyConcerts() {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text("Ratiba za michezo", style: headerStyle),
              const Spacer(),
              const Icon(Icons.more_horiz),
              UIHelper.horizontalSpace(16),
            ],
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: nearbyEvents.length,
              shrinkWrap: true,
              primary: false,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final event = nearbyEvents[index];
                var animation = Tween<double>(begin: 800.0, end: 0.0).animate(
                  CurvedAnimation(
                    parent: controller,
                    curve: Interval(
                      (1 / nearbyEvents.length) * index,
                      1.0,
                      curve: Curves.decelerate,
                    ),
                  ),
                );
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) => Transform.translate(
                    offset: Offset(animation.value, 0.0),
                    child: NearbyEventCard(
                      event: event,
                      onTap: () => viewEventDetail(event),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Text("Neno La Mungu", style: headerStyle),
              const Spacer(),
              const Icon(Icons.more_horiz),
              UIHelper.horizontalSpace(16),
            ],
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: nearbyEvents.length,
              shrinkWrap: true,
              primary: false,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final event = nearbyEvents[index];
                var animation = Tween<double>(begin: 800.0, end: 0.0).animate(
                  CurvedAnimation(
                    parent: controller,
                    curve: Interval(
                      (1 / nearbyEvents.length) * index,
                      1.0,
                      curve: Curves.decelerate,
                    ),
                  ),
                );
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) => Transform.translate(
                    offset: Offset(animation.value, 0.0),
                    child: NenoCard(
                      event: event,
                      onTap: () => viewEventDetail(event),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
      bottomNavigationBar: HomePageButtonNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        child: const Icon(FontAwesomeIcons.dollarSign),
      ),
    );
  }
}
