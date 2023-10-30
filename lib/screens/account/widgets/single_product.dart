import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  const SingleProduct({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.all(3),
      child: Image.network(
        image,
        fit: BoxFit.cover,
        height: 60,
        width: 70,
      ),
    );
  }
}
