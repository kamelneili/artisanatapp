// import 'dart:ffi';

// import 'package:artisanaflutterapp/config/constants.dart';
// import 'package:artisanaflutterapp/config/size_config.dart';
// import 'package:artisanaflutterapp/models/product.dart';
// import 'package:artisanaflutterapp/screens/product_details/widgets/product_information.dart';
// import 'package:artisanaflutterapp/widgets/custom_buttom.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ProductDetails extends StatelessWidget {
//   final Product product;
//   const ProductDetails({Key? key, required this.product}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     //  Restaurant restaurant = Restaurant.restaurants[0];
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Stack(
//                   children: [
//                     Align(
//                       alignment: Alignment.topCenter,
//                       child: Padding(
//                         padding: const EdgeInsets.all(12.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               height: SizeConfig.blockSizeVertical! * 4,
//                               width: SizeConfig.blockSizeVertical! * 4,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: kWhiteColor,
//                               ),
//                               //   child: SvgPicture.asset(
//                               //       'assets/left-navigation-back-svgrepo-com.svg'),
//                               //
//                             ),
//                             Container(
//                                 height: SizeConfig.blockSizeVertical! * 4,
//                                 width: SizeConfig.blockSizeVertical! * 4,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: kWhiteColor,
//                                 ),
//                                 child: Text("kkkkkkk",
//                                     style: TextStyle(
//                                         color: Colors
//                                             .red)) //SvgPicture.asset('favourite-svgrepo-com.svg'),
//                                 )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       height: SizeConfig.blockSizeVertical! * 50,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.vertical(
//                           bottom: Radius.elliptical(
//                               MediaQuery.of(context).size.width, 50),
//                         ),
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: NetworkImage(
//                             product.images[0],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // ProductInformation(product: product),
//                 CustomButton(
//                   title: "Make an appointment",
//                   onTap: () async {
//                     //  final user = await auth.FirebaseAuth.instance.currentUser;
//                     //print(user);
//                     // user != null
//                     //     ?
//                     Navigator.pushNamed(context, '/delivery_time',
//                         arguments: product);
//                     // :
//                     // Navigator.pushNamed(context, '/loginScreen');
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   //** */
// }
