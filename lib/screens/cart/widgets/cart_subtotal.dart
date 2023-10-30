// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartSubtotal extends StatefulWidget {
  int sum;
  CartSubtotal({
    Key? key,
    required this.sum,
  }) : super(key: key);

  @override
  State<CartSubtotal> createState() => _CartSubtotalState();
}

class _CartSubtotalState extends State<CartSubtotal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          const Text(
            'Subtotal ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            widget.sum.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
