// import 'package:beautycentre/config/constants.dart';
// import 'package:beautycentre/models/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:readmore/readmore.dart';

// import '../config/size_config.dart';

// class ProductInformation extends StatelessWidget {
//   final Product product;
//   const ProductInformation({Key? key, required this.product}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);

//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             height: 20,
//           ),
//           Container(
//             color: Colors.white,
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(product.name,
//                     style: kEncodeSansSemiBold.copyWith(
//                         color: kDarkBrownColor,
//                         fontSize: SizeConfig.blockSizeHorizontal! * 7)),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text('Product Information',
//                     style: kEncodeSansRagular.copyWith(color: kBlackColor)),
//                 SizedBox(height: 5),
//                 // Text(
//                 //     'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet,',
//                 //     style: kEncodeSansSemiBold),
//                 ReadMoreText(
//                   product.description,
//                   trimLines: 2,
//                   trimCollapsedText: ' Read More...',
//                   trimExpandedText: ' Show Less',
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
    
//     //
    
    
    
    
    
   