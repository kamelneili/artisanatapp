import 'package:artisanaflutterapp/blocs/admin/admin_bloc.dart';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../blocs/admin/admin_event.dart';

class OrderDetailScreen extends StatefulWidget {
  final Order order;
  const OrderDetailScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  int currentStep = 0;
  //final AdminServices adminServices = AdminServices();

  void navigateToSearchScreen(String query) {
    // Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  //
  getType() async {
    print('type:$type');

    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      type = pref.getString('type')!;
    });
  }

  getStatus() async {
    print('status:$status');

    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      status = pref.getInt('status')!;
    });
  }

  int status = 0;
  String type = 'user';
  @override
  void initState() {
    super.initState();
    currentStep = widget.order.status;

    getType();
    getStatus();
    // TODO: implement initState
  }

  // !!! ONLY FOR ADMIN!!!
  // void changeOrderStatus(int status) {
  // adminServices.changeOrderStatus(
  //   context: context,
  //   status: status + 1,
  //   order: widget.order,
  //   onSuccess: () {
  //     setState(() {
  //       currentStep += 1;
  //     });
  //   },
  // );
  // }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: PreferredSize(
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'View order details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order Date:      ${DateFormat().format(
                      DateTime.fromMillisecondsSinceEpoch(
                          widget.order.orderedAt),
                    )}'),
                    Text('Order ID:          ${widget.order.id}'),
                    Text('Order Total:      ${widget.order.totalPrice} DT'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Purchase Details',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < widget.order.products.length; i++)
                      Row(
                        children: [
                          Image.network(
                            widget.order.products[i].images[0],
                            height: 120,
                            width: 120,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.order.products[i].name,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'Qty: ${widget.order.quantity[i]}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Tracking',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black12,
                  ),
                ),
                child: Stepper(
                  currentStep: currentStep,
                  controlsBuilder: (context, details) {
                    print("type:$type");
                    if (type == 'admin') {
                      return ElevatedButton(
                          child: const Text('Donee',
                              style: TextStyle(color: Colors.red)),
                          onPressed: () {
                            print('kk');
                            context.read<AdminBloc>().add(
                                  ChangeOrderStatusEvent(
                                      status: currentStep + 1,
                                      order: widget.order),
                                );
                          });
                    }
                    return const SizedBox();
                  },
                  steps: [
                    Step(
                      title: const Text('Pending'),
                      content: const Text(
                        'Your order is yet to be delivered',
                      ),
                      isActive: currentStep > 0,
                      state: currentStep > 0
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: const Text('Completed'),
                      content: const Text(
                        'Your order has been delivered, you are yet to sign.',
                      ),
                      isActive: currentStep > 1,
                      state: currentStep > 1
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: const Text('Received'),
                      content: const Text(
                        'Your order has been delivered and signed by you.',
                      ),
                      isActive: currentStep > 2,
                      state: currentStep > 2
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                    Step(
                      title: const Text('Delivered'),
                      content: const Text(
                        'Your order has been delivered and signed by you!',
                      ),
                      isActive: currentStep >= 3,
                      state: currentStep >= 3
                          ? StepState.complete
                          : StepState.indexed,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
