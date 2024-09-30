import 'package:flutter/material.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    super.key,
    required this.child,
    required this.onPressed,
    this.width,
    this.height,
    this.textStyle,
    this.backgroundColor,
  });

  final Widget child;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(22))),
        backgroundColor: backgroundColor ?? const Color(0xffB8E893),
        fixedSize: Size(width ?? 340, height ?? 60),
      ),
      child: child,
    );
  }
}
