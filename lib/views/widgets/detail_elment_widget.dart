import 'package:flutter/material.dart';
import 'package:sample_weather_app/utils/app_style.dart';

class DetailElmentWidget extends StatelessWidget {
  const DetailElmentWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyle.styleRegular12,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          value,
          style: AppStyle.styleMedium14,
        ),
      ],
    );
  }
}
