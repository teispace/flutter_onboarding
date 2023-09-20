# flutter_onboarding

A new flutter package that assists developers to create good looking onboarding screen.

### Features

#### >> One time onboarding, will not visible after first run

#### >> Simple and fast

#### >> Animated

### Show some :heart: and star the repo to support the project

## Usage

[Example](https://github.com/teispace/flutter_onboarding/blob/main/example/example.dart)

To use this package :

- add the dependency to your [pubspec.yaml](https://github.com/teispace/flutter_onboarding/blob/main/pubspec.yaml) file.

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_onboarding:
```

### How to use

```dart
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_onboarding/flutter_onboarding.dart';
import 'package:flutter_onboarding/models/intro_model.dart';
import 'home.dart';

class ExampleOnBoarding extends StatelessWidget {
  const ExampleOnBoarding({Key? key}) : super(key: key);

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


```

# Pull Requests

I welcome and encourage all pull requests. It usually will take me within 24-48 hours to respond to any issue or request. Here are some basic rules to follow to ensure timely addition of your request:

1.  Match coding style (braces, spacing, etc.) This is best achieved using `Reformat Code` feature of Android Studio `CMD`+`Option`+`L` on Mac and `CTRL` + `ALT` + `L` on Linux + Windows .
2.  If its a feature, bugfix, or anything please only change code to what you specify.
3.  Please keep PR titles easy to read and descriptive of changes, this will make them easier to merge :)
4.  Pull requests _must_ be made against `develop` branch. Any other branch (unless specified by the maintainers) will get rejected.
5.  Check for existing [issues](https://github.com/teispace/flutter_onboarding/issues) first, before filing an issue.
6.  Make sure you follow the set standard as all other projects in this repo do
7.  Have fun!

### Created & Maintained By

[Teispace Team](https://teispace.com)
[Krishna Adhikari](https://github.com/Iamkrishnaa)

# License

Copyright (c) 2021-2023, teispace.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

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
