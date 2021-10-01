# flutter_onboarding

A new flutter package that assists developers to create good looking onboarding screen.

### Features

#### >> One time onboarding, will not visible after first run

#### >> Simple and fast

#### >> Animated

### Show some :heart: and star the repo to support the project

## Usage

[Example](https://github.com/Iamkrishnaa/flutter_onboarding/example/example.dart)

To use this package :

- add the dependency to your [pubspec.yaml](https://github.com/Iamkrishnaa/flutter_onboarding/pubspec.yaml) file.

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_onboarding:
```

### How to use

```dart

class ExampleOnBoarding extends StatelessWidget {
  ExampleOnBoarding({Key? key}) : super(key: key);

  /*These are the list of pages to display on onboarding screen
  Each page has title, description, titleColor, descriptionColor and imagepath
  */
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
      //Here we are calling FlutterOnBoarding to show on our page
      body: FlutterOnBoarding(
        bgColor: Colors.green,
        pages: pages,
        onGetStartedRoute: MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
    );
  }
}

```

# Pull Requests

I welcome and encourage all pull requests. It usually will take me within 24-48 hours to respond to any issue or request. Here are some basic rules to follow to ensure timely addition of your request:

1.  Match coding style (braces, spacing, etc.) This is best achieved using `Reformat Code` feature of Android Studio `CMD`+`Option`+`L` on Mac and `CTRL` + `ALT` + `L` on Linux + Windows .
2.  If its a feature, bugfix, or anything please only change code to what you specify.
3.  Please keep PR titles easy to read and descriptive of changes, this will make them easier to merge :)
4.  Pull requests _must_ be made against `develop` branch. Any other branch (unless specified by the maintainers) will get rejected.
5.  Check for existing [issues](https://github.com/iampawan/Flutter-Walkthrough/issues) first, before filing an issue.
6.  Make sure you follow the set standard as all other projects in this repo do
7.  Have fun!

### Created & Maintained By

[Krishna Adhikari](https://github.com/Iamkrishnaa)

# License

    Copyright 2021 Krishna Adhikari

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
