// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:artisanaflutterapp/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/screens/cart/widgets/cart_product.dart';
import 'package:artisanaflutterapp/screens/cart/widgets/cart_subtotal.dart';
import 'package:artisanaflutterapp/screens/home/widgets/address_box.dart';
import 'package:artisanaflutterapp/widgets/custom_buttom.dart';

class CartScreen extends StatefulWidget {
  //List<dynamic> cart;
  final Map<dynamic, dynamic> data;
  const CartScreen({
    Key? key,
    required this.data,
  }) : super(key: key);
  static const String routeName = '/cart-deals';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    int sum = 0;

    widget.data['cart']
        .map((e) => sum += e['quantity'] * e['product']['price'] as int)
        .toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: const Color(0xFFfed9cd),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            iconSize: 20.0,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // const AddressBox(),
              //  CartSubtotal(sum: sum),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Proceed to Buy (${widget.data['cart'].length} items)',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                color: Colors.black12.withOpacity(0.08),
                height: 1,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: CustomButton(
              //     //text: 'Proceed to Buy user.cart.length items)',
              //     onTap: () {}
              //   ),
              // ),
              const SizedBox(height: 15),
              Container(
                color: Colors.black12.withOpacity(0.08),
                height: 1,
              ),

              const SizedBox(height: 5),
              SizedBox(
                child: ListView.builder(
                  itemCount: widget.data["cart"].length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return CartProduct(
                        index: index, d: widget.data["cart"][index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                    title: 'Check out',
                    onTap: () {
                      Navigator.of(context).pushNamed('/address', arguments: [
                        widget.data["cart"],
                        sum.toDouble(),
                      ]);

                      //  color: Colors.yellow[600], title: '',
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
