import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  const CustomRoundedButton({
    Key? key,
    required this.child,
    required this.color,
    this.onTap,
    this.shouldFill = true,
    this.radius = 100,
    this.width,
    this.height,
  }) : super(key: key);
  final Widget child;
  final Color color;
  final bool shouldFill;
  final Function()? onTap;
  final double radius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: shouldFill ? color : null,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: color,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
