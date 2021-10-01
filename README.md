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

Copyright (c) 2021 iamkrishnaa

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
