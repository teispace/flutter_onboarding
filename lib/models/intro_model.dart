import 'package:flutter/material.dart';

class IntroModel {
  /// The title section of the page. This is typically a [Text] widget.
  final Widget title;

  /// The description section of the page. This is typically a [Text] widget.
  final Widget description;

  /// The image section of the page. This is typically an [Image] widget.
  final Widget image;

  IntroModel({
    required this.title,
    required this.description,
    required this.image,
  });
}
