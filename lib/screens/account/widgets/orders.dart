import 'package:artisanaflutterapp/blocs/account/account_bloc.dart';
import 'package:artisanaflutterapp/blocs/account/account_state.dart';
import 'package:artisanaflutterapp/config/constants.dart';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/config/newsCardSkelton.dart';
import 'package:artisanaflutterapp/models/order.dart';
import 'package:artisanaflutterapp/screens/account/widgets/single_product.dart';
import 'package:artisanaflutterapp/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

import '../../../blocs/home/home_bloc.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order>? orders;
  //final AccountServices accountServices = AccountServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    //orders = await accountServices.fetchMyOrders(context: context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                bottom: 10,
                left: 15,
              ),
              child: const Text(
                'Your Orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.only(
            //     right: 15,
            //   ),
            //   child: Text(
            //     'See all',
            //     style: TextStyle(
            //       color: GlobalVariables.selectedNavBarColor,
            //     ),
            //   ),
            // ),
          ],
        ),
        //

        // display orders
        Column(
          children: [
            BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
              if (state is OrdersLoadingState) {
                return ListView.separated(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => const NewsCardSkelton(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                );
              }
              if (state is OrdersLoadedState) {
                return MasonryGridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 23,
                  itemCount: state.orders.length,
                  padding: const EdgeInsets.symmetric(
                      horizontal: kPaddingHorizontal),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('kk');
                        print('order:$state.orders[index]');
                        Navigator.of(context).pushNamed(
                          '/orderDetails',
                          arguments: state.orders[index],
                        );
                      },
                      //************************* */

                      //*********************** */
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFffe6e6)),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            IconButton(
                                              onPressed: () {},
                                              icon: const ImageIcon(AssetImage(
                                                  'assets/delivery1.png')),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    'ID:    ${state.orders[index].id}'),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    'Date:    ${DateFormat().format(
                                                      DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                              state
                                                                  .orders[index]
                                                                  .orderedAt),
                                                    )}',
                                                    style: kEncodeSansSemiBold
                                                        .copyWith(
                                                      color: kBlackColor,
                                                      fontSize: 12,
                                                      //SizeConfig.blockSizeHorizontal! * 3.5,
                                                    )),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                    'Address:  ${state.orders[index].address} ',
                                                    style: kEncodeSansSemiBold
                                                        .copyWith(
                                                      color: kBlackColor,
                                                      fontSize: 12,
                                                      //SizeConfig.blockSizeHorizontal! * 3.5,
                                                    )),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                    'Total:      ${state.orders[index].totalPrice} DT',
                                                    style: kEncodeSansSemiBold
                                                        .copyWith(
                                                      color: kBlackColor,
                                                      fontSize: 12,
                                                      //SizeConfig.blockSizeHorizontal! * 3.5,
                                                    )),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                const Divider(
                                                    height: 5,
                                                    color: Colors.black)
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),

                              //
                              SizedBox(
                                height: 70,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount:
                                      state.orders[index].products.length,
                                  itemBuilder: (context, i) => Container(
                                    margin: const EdgeInsets.only(right: 3.0),
                                    child: SingleProduct(
                                      image: state
                                          .orders[index].products[i].images[0],
                                    ),
                                  ),
                                ),
                              ),

                              //
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xFFcc3300)),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            // Change your radius here
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),

                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                          '/home',
                                        );
                                      },
                                      child: const Text('Reorder'),
                                      // color: const Color.fromRGBO(254, 216, 19, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100, // <-- Your width
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                const Color(0xFFcc3300)),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            // Change your radius here
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),

                                      onPressed: () {
                                        Navigator.of(context).pushNamed(
                                          '/orderDetails',
                                          arguments: state.orders[index],
                                        );
                                      },
                                      child: const Text('View'),
                                      // color: const Color.fromRGBO(254, 216, 19, 1),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Text("somethnig went wrong");
              }
            }),
          ],
        ),
      ],
    );
  }
}
