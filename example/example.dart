import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_onboarding/flutter_onboarding.dart';
import 'home.dart';

class ExampleOnBoarding extends StatelessWidget {
  const ExampleOnBoarding({Key? key}) : super(key: key);

  /// This is the list of pages that will be shown in the on boarding screen.
  List<IntroModel> pages(BuildContext context) {
    return [
      IntroModel(
        title: Text(
          'On boarding page 1',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
        description: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        image: Image.asset(
          'assets/image.png',
          fit: BoxFit.contain,
          height: MediaQuery.of(context).size.height * 0.5,
        ).animate().fadeIn().scale().move(
              delay: 800.ms,
              duration: 600.ms,
            ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterOnBoarding(
        pages: pages(context),
        onDone: () {
          /// When done button is press we navigate to the home page.
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        },
      ),
    );
  }
}
