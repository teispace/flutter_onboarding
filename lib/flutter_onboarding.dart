library flutter_onboarding;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onboarding/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlutterOnBoarding extends StatefulWidget {
  final List<IntroModel> pages;
  final Color backgroundColor;
  final MaterialPageRoute onGetStartedRoute;

  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;
  final TextStyle skipButtonTextStyle;
  final Color nextButtonColor;
  final Color getStartedButtonColor;
  final TextStyle getStartedButtonTextStyle;
  final double imageHeight;
  final double imageWidth;

  const FlutterOnBoarding({
    Key? key,
    required this.pages,
    required this.backgroundColor,
    this.activeIndicatorColor = Colors.pink,
    this.inactiveIndicatorColor = Colors.white,
    this.skipButtonTextStyle = const TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 20,
    ),
    this.nextButtonColor = Colors.orange,
    this.getStartedButtonColor = Colors.pink,
    this.getStartedButtonTextStyle = const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.w500,
    ),
    this.imageHeight = 300,
    this.imageWidth = 300,
    required this.onGetStartedRoute,
  }) : super(key: key);

  @override
  FlutterOnBoardingState createState() => FlutterOnBoardingState();
}

class FlutterOnBoardingState extends State<FlutterOnBoarding> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < widget.pages.length; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  List<Widget> buildFlutterOnBoardingPages() {
    final children = <Widget>[];

    for (int i = 0; i < widget.pages.length; i++) {
      children.add(_showPageData(widget.pages[i]));
    }
    return children;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 12.0,
      width: isActive ? 35.0 : 12.0,
      decoration: BoxDecoration(
        color: isActive
            ? widget.activeIndicatorColor
            : widget.inactiveIndicatorColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  bool isAlreadyViewed = false;

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      setState(() {
        isAlreadyViewed = _seen;
      });
      Navigator.of(context).pushReplacement(widget.onGetStartedRoute);
    } else {
      await prefs.setBool('seen', true);
    }
  }

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  @override
  Widget build(BuildContext context) {
    return isAlreadyViewed
        ? const Scaffold()
        : Scaffold(
            backgroundColor: widget.backgroundColor,
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: SafeArea(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: Container(
                            color: Colors.transparent,
                            child: PageView(
                              physics: const ClampingScrollPhysics(),
                              controller: _pageController,
                              onPageChanged: (int page) {
                                setState(
                                  () {
                                    _currentPage = page;
                                  },
                                );
                              },
                              children: buildFlutterOnBoardingPages(),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(),
                          ),
                        ),
                        _currentPage != widget.pages.length - 1
                            ? Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: TextButton(
                                        onPressed: () {
                                          _pageController.jumpToPage(
                                              widget.pages.length - 1);
                                        },
                                        child: Text(
                                          'Skip',
                                          style: widget.skipButtonTextStyle,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: FractionalOffset.bottomRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          right: 20,
                                          bottom: 10,
                                        ),
                                        child: FloatingActionButton(
                                          elevation: 5,
                                          backgroundColor:
                                              widget.nextButtonColor,
                                          child: const Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            _pageController.nextPage(
                                              duration: const Duration(
                                                milliseconds: 500,
                                              ),
                                              curve: Curves.ease,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Expanded(
                                flex: 1,
                                child: _showGetStartedButton(),
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget _showPageData(IntroModel page) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(page.imagePath),
              height: widget.imageHeight,
              width: widget.imageWidth,
            ),
          ),
          const SizedBox(height: 30.0),
          Text(
            page.title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: page.titleColor,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 15.0),
          Text(
            page.description,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: page.descriptionColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _showGetStartedButton() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context, widget.onGetStartedRoute);
        },
        child: Container(
          decoration: BoxDecoration(
            color: widget.getStartedButtonColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Center(
            child: Text(
              'Get Started',
              style: widget.getStartedButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
