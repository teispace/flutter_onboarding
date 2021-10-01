import 'package:flutter/material.dart';
import 'package:flutter_onboarding/flutter_onboarding.dart';
import 'package:flutter_onboarding/onboarding_model.dart';
import 'home.dart';

class ExampleOnBoarding extends StatelessWidget {
  ExampleOnBoarding({Key? key}) : super(key: key);

  final pages = [
    IntroModel(
      title: 'On boarding page 1',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      imagePath: 'assets/image.png',
    ),
    IntroModel(
      title: 'On boarding page 2',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      imagePath: 'assets/image.png',
    ),
    IntroModel(
      title: 'On boarding page 3',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      imagePath: 'assets/image.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterOnBoarding(
        backgroundColor: Colors.green,
        pages: pages,
        onGetStartedRoute: MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
    );
  }
}
