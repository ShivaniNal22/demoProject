import 'package:flutter/material.dart';
import 'package:sampleproject/login_page_activity.dart';
import 'package:sampleproject/size_config.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import SVG library
import 'dart:math'; // Import math library for pi constant
import 'core/colors.dart'; // Import color constants

// Widget for drawing rings in the background
class RingsBackground extends StatelessWidget {
  final double width;
  final double height;
  final int ringsCount;
  final double ringSpacing;
  final Color ringColor;

  // Constructor
  RingsBackground({
    required this.width,
    required this.height,
    required this.ringsCount,
    required this.ringSpacing,
    required this.ringColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: RingsPainter(ringsCount: ringsCount, ringSpacing: ringSpacing, ringColor: ringColor),
    );
  }
}

// Custom painter for drawing rings
class RingsPainter extends CustomPainter {
  final int ringsCount;
  final double ringSpacing;
  final Color ringColor;

  // Constructor
  RingsPainter({
    required this.ringsCount,
    required this.ringSpacing,
    required this.ringColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = ringColor;
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    // Draw rings
    for (int i = 0; i < ringsCount; i++) {
      canvas.drawCircle(Offset(centerX, centerY), ringSpacing * i, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// StatefulWidget for the onboarding parent activity
class OnBoardingParentActivity extends StatefulWidget {
  const OnBoardingParentActivity({Key? key}) : super(key: key);

  @override
  State<OnBoardingParentActivity> createState() => _OnBoardingParentActivityState();
}

class _OnBoardingParentActivityState extends State<OnBoardingParentActivity>
    with SingleTickerProviderStateMixin {
  late final PageController controller;
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  int currentPageIndex = 0;

  List<String> images = [
    "images/car1.svg",
    "images/car2.svg",
    "images/car3.svg",
    "images/car4.svg",
    "images/car5.svg",
  ];

  String centralImagePath = "images/car1.svg"; // Initial central image path

  @override
  void initState() {
    super.initState();
    controller = PageController(keepPage: true);
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      child: Container(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Stack(
          children: [
            // Background with rings
            RingsBackground(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight,
              ringsCount: 7, // Adjust as needed
              ringSpacing: 50, // Adjust as needed
              ringColor: Colors.brown.withOpacity(0.05),
            ),
            // PageView for onboarding pages
            PageView.builder(
              controller: controller,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top bar
                    Container(
                      height: SizeConfig.screenHeight * .10,
                      width: SizeConfig.screenWidth,
                      alignment: Alignment.bottomCenter,
                      child: getTopBar(SizeConfig.screenHeight, SizeConfig.screenWidth),
                    ),
                    // Central image and surrounding images
                    Container(
                      height: SizeConfig.screenHeight * .63,
                      width: SizeConfig.screenWidth,
                      alignment: Alignment.bottomCenter,
                      child: getAddFirstPageLayout(SizeConfig.screenHeight, SizeConfig.screenWidth, index),
                    ),
                    // Text content
                    Container(
                      height: SizeConfig.screenHeight * .15,
                      width: SizeConfig.screenWidth,
                      alignment: Alignment.bottomCenter,
                      child: getAddNameLayout(SizeConfig.screenHeight, SizeConfig.screenWidth, index),
                    ),
                    // Bottom button
                    Container(
                      height: SizeConfig.screenHeight * .12,
                      child: getAddBottomButtonLayout(SizeConfig.screenHeight, SizeConfig.screenWidth, index),
                    ),
                  ],
                );
              },
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                  centralImagePath = images[index]; // Update central image path
                  _animationController.reset();
                  _animationController.forward();
                });
              },
            ),
          ],
        ),
      ),
    );
  }


  // Widget for the top bar logo name
  Widget getTopBar(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          top: parentHeight * .05,
          left: parentWidth * 0.05,
          right: parentWidth * 0.05),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "nxcar",
          style: TextStyle(
              color: CommonColor.THEME_COLOR,
              fontSize: SizeConfig.blockSizeHorizontal * 4.5,
              fontFamily: 'Inter_Medium_Font',
              fontWeight: FontWeight.w700),
          textScaleFactor: 1.2,
        ),
        Text(
          "",
          style: TextStyle(
              color: Colors.transparent,
              fontSize: SizeConfig.blockSizeHorizontal * 4.0,
              fontFamily: 'Inter_Medium_Font',
              fontWeight: FontWeight.w500),
          textScaleFactor: 1.2,
        ),
        Text(
          "",
          style: TextStyle(
              color: Colors.transparent,
              fontSize: SizeConfig.blockSizeHorizontal * 4.0,
              fontFamily: 'Inter_Medium_Font',
              fontWeight: FontWeight.w500),
          textScaleFactor: 1.2,
        ),
      ]),
    );
  }



  // Widget for the central image and surrounding images
  Widget getAddFirstPageLayout(double parentHeight, double parentWidth, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                centralImagePath, // Central image
                height: centralImagePath == "images/car3.svg"?parentHeight * 0.13:parentHeight * 0.1,
                width: parentWidth * 0.15,
              ),
              ...List.generate(4, (i) {
                return AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    double angle = (i + _animation.value) * (2 * pi / 4);
                    double radius = parentHeight * 0.2;
                    return Transform.translate(
                      offset: Offset(radius * cos(angle), radius * sin(angle)),
                      child: SvgPicture.asset(
                        images[(i + currentPageIndex + 1) % images.length], // Images surrounding the center
                        height: parentHeight * 0.13,
                        width: parentWidth * 0.15,
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  // Widget for the bottom text
  Widget getAddNameLayout(double parentHeight, double parentWidth, int index) {
    List<String> texts = [
      "Buy a Pre Owned Car with Confidence",
      "Rev Up Your Dreams with Our Used Car Loans",
      "Simplified Used Car Financing with Nxcar"
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: parentHeight * .0),
          child: Container(
            width: parentWidth * 0.9, // Adjust width as needed
            child: Text(
              texts[index],
              style: TextStyle(
                color: CommonColor.BLACK,
                fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                fontFamily: 'Inter_Bold_Font',
                fontWeight: FontWeight.w600,
              ),
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }



  /* Widget for Bottom Button */
  Widget getAddBottomButtonLayout(double parentHeight, double parentWidth, int index) {
    return Padding(
      padding: EdgeInsets.only(left: parentWidth * .05, right: parentWidth * .05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: controller,
            onDotClicked: (index) => controller.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut),
            count: 3,
            effect: WormEffect(
              activeDotColor: CommonColor.THEME_COLOR,
              dotHeight: 11,
              dotWidth: 11,
              type: WormType.underground,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (currentPageIndex < 2) {
                controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
              } else {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPageActivity()));
              }
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: CommonColor.THEME_COLOR,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: parentHeight * .025,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
