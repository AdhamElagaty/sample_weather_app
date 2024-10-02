import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingViewBody extends StatelessWidget {
  const LoadingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xff211772).withOpacity(0.95),
      child: const Padding(
        padding: EdgeInsets.all(12.0),
        child: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 34.0,
          ),
        ),
      ),
    );
  }
}
