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

Copyright © 2021 iamkrishnaa All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

- Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.
- Redistributions in binary form must reproduce the above copyright notice, this
  list of conditions and the following disclaimer in the documentation and/or
  other materials provided with the distribution.
- Neither the name of iamkrishnaa nor the names of its contributors may be used to
  endorse or promote products derived from this software without specific prior
  written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS “AS IS” AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.io/).

For help on editing package code, view the [documentation](https://flutter.io/developing-packages/).
