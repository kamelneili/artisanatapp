// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:artisanaflutterapp/blocs/cart/cart_bloc.dart';
import 'package:artisanaflutterapp/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:artisanaflutterapp/models/product.dart';

class CartProduct extends StatefulWidget {
  final int index;
  Map d;
  CartProduct({
    Key? key,
    required this.index,
    required this.d,
  }) : super(key: key);
  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  String? quantity;

  @override
  void initState() {
    setState(() {
      quantity = widget.d['quantity'].toString();
    });
    super.initState();
  }

  void getQty() {
    setState(() {
      //
      quantity = widget.d['quantity'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = Product.fromMap(widget.d['product']);

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Image.network(
                widget.d['product']["images"][0],
                fit: BoxFit.contain,
                height: 135,
                width: 135,
              ),
              Column(
                children: [
                  Container(
                    width: 235,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.d['product']["name"],
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      '\$${widget.d['product']['price']}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text('Eligible for FREE Shipping'),
                  ),
                  Container(
                    width: 235,
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: const Text(
                      'In Stock',
                      style: TextStyle(
                        color: Colors.teal,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black12,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (quantity == '1') {
                          //  context.read<CartBloc>().add(RemoveProduct(product));
                          Navigator.of(context).pushNamed('/home');
                        } else {
                          context.read<CartBloc>().add(RemoveProduct(product));
                          getQty();
                        }
                      },
                      child: Container(
                        width: 35,
                        height: 32,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.remove,
                          size: 18,
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12, width: 1.5),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Container(
                        width: 35,
                        height: 32,
                        alignment: Alignment.center,
                        child: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                          if (state is CartLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is SuccessRemovingProductToCart) {
                            print("jjjjjjjjjjjjjjj");
                            print(state.data["cart"][widget.index]["quantity"]);
                            return Text(state.data["cart"][widget.index]
                                    ["quantity"]
                                .toString());
                          }
                          if (state is SuccessAddingProductToCart) {
                            print(state.data["cart"][widget.index]["quantity"]);
                            return Text(state.data["cart"][widget.index]
                                    ["quantity"]
                                .toString());
                          } else {
                            return const Text('something went wrong');
                          }
                        }),
                      ),
                    ),
                    InkWell(
                      //   onTap: () => increaseQuantity(product),
                      onTap: () => {
                        context.read<CartBloc>().add(AddProduct(product)),
                        getQty(),
                      },
                      child: Container(
                        width: 35,
                        height: 32,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.add,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
