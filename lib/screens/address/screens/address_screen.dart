// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:artisanaflutterapp/blocs/address/address_state.dart';
import 'package:artisanaflutterapp/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:artisanaflutterapp/blocs/address/address_bloc.dart';
import 'package:artisanaflutterapp/blocs/address/address_event.dart';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/screens/address/screens/custom_textfield.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final double totalAmount;
  List cart;
  //Map l;
  AddressScreen({
    Key? key,
    //required this.l,
    required this.totalAmount,
    required this.cart,
  }) : super(key: key);

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController flatBuildingController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final _addressFormKey = GlobalKey<FormState>();

  // String addressToBeUsed = "";
  // List<PaymentItem> paymentItems = [];
  // final AddressServices addressServices = AddressServices();

  @override
  void initState() {
    super.initState();
    // paymentItems.add(
    //   PaymentItem(
    //     amount: widget.totalAmount,
    //     label: 'Total Amount',
    //     status: PaymentItemStatus.final_price,
    //   ),
    // );
  }

  @override
  void dispose() {
    super.dispose();
    flatBuildingController.dispose();
    areaController.dispose();
    pincodeController.dispose();
    cityController.dispose();
  }

  // void payPressed(String addressFromProvider) {
  //   addressToBeUsed = "";

  //   bool isForm = flatBuildingController.text.isNotEmpty ||
  //       areaController.text.isNotEmpty ||
  //       pincodeController.text.isNotEmpty ||
  //       cityController.text.isNotEmpty;

  //   if (isForm) {
  //     if (_addressFormKey.currentState!.validate()) {
  //       addressToBeUsed =
  //           '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';
  //     } else {
  //       throw Exception('Please enter all the values!');
  //     }
  //   } else if (addressFromProvider.isNotEmpty) {
  //     addressToBeUsed = addressFromProvider;
  //   } else {
  //     // showSnackBar(context, 'ERROR');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // var address = context.watch<UserProvider>().user.address;
    String addressToBeUsed =
        '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}';

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
      body: BlocListener<AddressBloc, AddressState>(
          listener: (context, state) async {
            print("loginstate:$state");

            if (state is OrdersavedState) {
              Navigator.of(context).pushNamed(
                '/account',
              );
            }
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //  if (address.isNotEmpty)
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                          ),
                        ),
                        child: BlocBuilder<AddressBloc, AddressState>(
                            builder: (context, state) {
                          print('state:$state');

                          if (state is OrdersavedState) {
                            return Text(
                              state.d["address"],
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            );
                          } else {
                            return const Text(
                              'address',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            );
                          }
                        }),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'OR',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  Form(
                    key: _addressFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: flatBuildingController,
                          hintText: 'Flat, House no, Building',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: areaController,
                          hintText: 'Area, Street',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: pincodeController,
                          hintText: 'Pincode',
                        ),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: cityController,
                          hintText: 'Town/City',
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    onTap: () {
                      context.read<AddressBloc>().add(SaveOrderEvent(
                          widget.cart,
                          widget.totalAmount,
                          '${flatBuildingController.text}, ${areaController.text}, ${cityController.text} - ${pincodeController.text}'));
                    },
                    title: "save address",
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          )),
    );
  }
}
