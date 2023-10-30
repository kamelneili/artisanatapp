import 'package:artisanaflutterapp/blocs/cart/cart_bloc.dart';
import 'package:artisanaflutterapp/blocs/rating/rating_bloc.dart';
import 'package:artisanaflutterapp/blocs/rating/rating_event.dart';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/models/product.dart';
import 'package:artisanaflutterapp/screens/product_details/widgets/stars.dart';
import 'package:artisanaflutterapp/widgets/custom_buttom.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  const ProductDetailsScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
    super.initState();
    getrating();
  }

  getrating() async {
    double totalRating = 0;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    double r = prefs.getDouble("r")!;
    print("r:$r");
    for (int i = 0; i < widget.product.rating!.length; i++) {
      setState(() {
        totalRating += r;
      });
      if (widget.product.rating![i].userId == userId) {
        myRating = r.toDouble();
      }
    }
    if (totalRating != 0) {
      setState(() {
        avgRating = totalRating / r;
      });
    }
  }

  // getuserId() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? userId = prefs.getString('userId');
  //   return userId;
  // }

  void addToCart() {
    context.read<CartBloc>().add(AddProduct(widget.product));
  }

  // void navigateToSearchScreen(String query) {
  //   Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  // }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.id!,
                  ),
                  Stars(
                    rating: avgRating,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Text(
                widget.product.name,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            CarouselSlider(
              items: widget.product.images.map(
                (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RichText(
                text: TextSpan(
                  text: 'Deal Price: ',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '${widget.product.price} DT',
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.description),
            ),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: CustomButton(
            //     title: 'Buy Now',
            //     onTap: () {},
            //   ),
            // ),
            const SizedBox(height: 10),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: addToCart,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFFcc3300)),
                  ),
                  child: const Text('Add to cart'),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              color: Colors.black12,
              height: 5,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'Rate The Product',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RatingBar.builder(
              initialRating: myRating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: GlobalVariables.secondaryColor,
              ),
              onRatingUpdate: (rating) {
                print('here');
                context.read<RatingBloc>().add(RateProductEvent(
                      product: widget.product,
                      rate: rating,
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
