import 'package:artisanaflutterapp/blocs/cart/cart_bloc.dart';
import 'package:artisanaflutterapp/blocs/home/home_bloc.dart';
import 'package:artisanaflutterapp/blocs/home/home_event.dart';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/repository/home_repository.dart';
import 'package:artisanaflutterapp/screens/home/widgets/address_box.dart';
import 'package:artisanaflutterapp/screens/home/widgets/carousel_image.dart';
import 'package:artisanaflutterapp/screens/home/widgets/deal_of_day.dart';
import 'package:artisanaflutterapp/screens/home/widgets/top_categories.dart';
import 'package:artisanaflutterapp/widgets/app_bottom_nav_bar.dart';
import 'package:artisanaflutterapp/widgets/grocery_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var mytoken = pref.getString('token');
  }

  int leng = 0;
  @override
  void initState() {
    super.initState();
    gettoken();
    getleng();
    // TODO: implement initState
  }

  //
  getleng() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      leng = prefs.getInt('cartleng')!;
    });
    print('leng');
    print('leng:$leng');
  }

  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFfed9cd),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' Art Space',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
        actions: [
          BlocBuilder<CartBloc, CartState>(builder: (context, state) {
            //  print("product page state: $state");

            if (state is SuccessAddingProductToCart) {
              return IconButton(
                onPressed: () {
                  print("/********************");
                  print(state.data);
                  Navigator.of(context)
                      .pushNamed('/cart-deals', arguments: state.data);
                },
                icon: Badge(
                  isLabelVisible: true,
                  label: Text("${state.data["cart"].length}"),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                  ),
                ),
              );
            }
            return IconButton(
              onPressed: () {},
              icon: Badge(
                isLabelVisible: true,
                label: Text(leng.toString()),
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
              ),
            );
          }),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: GrocerySearchTextFormField(),
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(index: 0),
      body: const SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              TopCategories(),
              SizedBox(height: 10),
              CarouselImage(),
              SizedBox(height: 10),
              DealOfDay(),
            ],
          ),
        ),
      ),
    );
  }
}
