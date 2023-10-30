import 'package:artisanaflutterapp/config/constants.dart';
import 'package:flutter/material.dart';

import '../config/size_config.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  Function()? onTap;
  final String title;
  CustomButton({
    required this.onTap,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 60,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
        decoration: const BoxDecoration(),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFcc3300),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              )),
          child: Text(
            title,
            style: kEncodeSansRagular.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
