import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../flutter_onboarding.dart';
import '../src/widgets/custom_rounded_button.dart';

class FlutterOnBoarding extends StatefulWidget {
  FlutterOnBoarding({
    super.key,
    required this.pages,
    this.scrollDirection = Axis.vertical,
    this.physics = const BouncingScrollPhysics(),
    required this.onDone,
    this.activeIndicatorShape,
    this.inactiveIndicatorShape,
    this.activeIndicatorSize,
    this.inactiveIndicatorSize,
    this.pageController,
    this.skipButtonText,
    this.nextButtonText,
    this.doneButtonText,
    this.indicator,
    this.navigationControl,
    this.indicatorActiveColor,
    this.indicatorInactiveColor,
    this.skipButtonColor,
    this.nextButtonColor,
    this.loadingWidget,
    this.shouldUseDefaultStorage = true,
  }) : assert(pages.isNotEmpty, 'You must provide at least one page.');

  /// The list of pages to display in the onboarding flow.
  /// Pages are of type [IntroModel], and are rendered in order.
  final List<IntroModel> pages;

  /// For the direction of the scroll, use [Axis.horizontal] for left-to-right scrolling, and [Axis.vertical] for top-to-bottom scrolling.
  final Axis scrollDirection;

  /// Scroll Physics. Defaults to [BouncingScrollPhysics].
  final ScrollPhysics? physics;

  /// Onboarding done callback. This is called when the user taps the done button.
  final VoidCallback onDone;

  //dot indicator decorators

  /// The shape of the dot indicator. Defaults to [RoundedRectangleBorder].
  final ShapeBorder? activeIndicatorShape;

  /// The shape of the dot indicator. Defaults to [RoundedRectangleBorder].
  final ShapeBorder? inactiveIndicatorShape;

  /// The size of the dot indicator. Defaults to [Size.square(10.0)].
  final Size? activeIndicatorSize;

  /// The size of the dot indicator. Defaults to [Size.square(10.0)].
  final Size? inactiveIndicatorSize;

  /// Page controller used to control the scrolling of the onboarding flow.
  final PageController? pageController;

  /// Skip Button Text
  final String? skipButtonText;

  /// Next Button Text
  final String? nextButtonText;

  /// Done Button Text
  final String? doneButtonText;

  /// The widget to show as the indicator. Defaults to [DotsIndicator].
  final Widget? indicator;

  /// The widget for controlling the state of the onboarding flow. i.e. Navigation buttons.
  final Widget? navigationControl;

  /// Indicator active color. Defaults to [Theme.of(context).primaryColor].
  final Color? indicatorActiveColor;

  /// Indicator inactive color. Defaults to [Colors.grey].
  final Color? indicatorInactiveColor;

  /// Skip TextButton color. Defaults to [Theme.of(context).primaryColor].
  final Color? skipButtonColor;

  /// Next TextButton color. Defaults to [Theme.of(context).primaryColor].
  final Color? nextButtonColor;

  /// Widget that shows before inititalizing the onboarding flow. Defaults to [CircularProgressIndicator].
  final Widget? loadingWidget;

  /// Whether to use the default storage to store the onboarding state. Defaults to true.
  /// This is useful if you want to use your own storage, from inside your logic.
  /// If this is set to false and you don't provide your own storage logic, the onboarding flow will not be marked as done. and will reappear on every app launch.
  /// Note: Handle the one time show logic yourself if you set this to false.
  final bool shouldUseDefaultStorage;

  @override
  State<FlutterOnBoarding> createState() => _FlutterOnBoardingState();
}

class _FlutterOnBoardingState extends State<FlutterOnBoarding> {
  /// The current page displayed in the onboarding flow. Defaults to 0.
  int currentPage = 0;

  /// The [PageController] used to control the scrolling of the onboarding flow.
  late PageController pageController;

  /// The [SharedPreferences] instance used to store the onboarding state. Defaults to null.
  late SharedPreferences prefs;

  /// Whether the onboarding flow is loading. Defaults to true.
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    pageController = widget.pageController ?? PageController();

    if (widget.shouldUseDefaultStorage) {
      _initPrefs();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    bool? isDone = prefs.getBool('isDone');

    if (isDone != null && isDone) {
      widget.onDone.call();
      return;
    }

    setState(() {
      isLoading = false;
    });
  }

  //set onboarding state to done
  _setOnboardingDone() async {
    if (widget.shouldUseDefaultStorage) {
      await prefs.setBool('isDone', true);
    }
  }

  //dispose
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? widget.loadingWidget ??
            const Center(child: CircularProgressIndicator())
        : SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children: [
                  PageView.builder(
                    itemCount: widget.pages.length,
                    controller: pageController,
                    physics: widget.physics,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    scrollDirection: widget.scrollDirection == Axis.vertical
                        ? Axis.vertical
                        : Axis.horizontal,
                    itemBuilder: (context, index) {
                      bool isLastPage = index == widget.pages.length - 1;
                      IntroModel introModel = widget.pages[index];
                      return Column(
                        children: [
                          // image
                          _buildMainPageContent(introModel, context),

                          const SizedBox(height: 32.0),

                          if (widget.scrollDirection != Axis.vertical)
                            widget.indicator ?? _buildIndicators(),

                          // button
                          widget.navigationControl ??
                              _buildNavigationSection(
                                  isLastPage, context, index),
                          const SizedBox(height: 32.0),
                        ],
                      );
                    },
                  ),
                  if (widget.scrollDirection == Axis.vertical)
                    Positioned(
                      right: 0.0,
                      top: 0.0,
                      child: widget.indicator ?? _buildIndicators(),
                    ),
                ],
              ),
            ),
          );
  }

  Expanded _buildMainPageContent(
    IntroModel introModel,
    BuildContext context,
  ) {
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // image
                introModel.image,

                const SizedBox(height: 32.0),

                // title
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  child: introModel.title,
                ),

                // description
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 32.0,
                  ),
                  child: introModel.description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildNavigationSection(
    bool isLastPage,
    BuildContext context,
    int index,
  ) {
    return Row(
      mainAxisAlignment:
          isLastPage ? MainAxisAlignment.end : MainAxisAlignment.spaceBetween,
      children: [
        if (!isLastPage)
          TextButton(
            onPressed: () {
              pageController.animateToPage(
                widget.pages.length - 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            },
            child: Text(
              widget.skipButtonText ?? "Skip",
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: widget.skipButtonColor ?? Theme.of(context).primaryColor,
              ),
            ),
          ),
        CustomRoundedButton(
          color: widget.nextButtonColor ?? Theme.of(context).primaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 32.0,
            ),
            child: Text(
              index == widget.pages.length - 1
                  ? widget.doneButtonText ?? "Done"
                  : widget.nextButtonText ?? "Next",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          onTap: () async {
            if (index == widget.pages.length - 1) {
              await _setOnboardingDone();
              widget.onDone.call();
            } else {
              pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              );
            }
          },
        ),
      ],
    );
  }

  _buildIndicators() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DotsIndicator(
        dotsCount: widget.pages.length,
        position: currentPage,
        axis: widget.scrollDirection,
        decorator: DotsDecorator(
            activeShape: widget.activeIndicatorShape ??
                (const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                )),
            activeSize: widget.activeIndicatorSize ??
                (widget.scrollDirection == Axis.vertical
                    ? const Size(9.0, 24.0)
                    : const Size(24.0, 9.0)),
            shape: widget.inactiveIndicatorShape ??
                (const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                )),
            size: widget.inactiveIndicatorSize ?? const Size(9.0, 9.0),
            color: widget.indicatorInactiveColor ?? Colors.grey,
            activeColor:
                widget.indicatorActiveColor ?? Theme.of(context).primaryColor),
      ),
    );
  }
}
