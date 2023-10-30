import 'package:artisanaflutterapp/blocs/category/category_bloc.dart';
import 'package:artisanaflutterapp/config/constants.dart';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/screens/home/screens/category_deals_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/category/category_event.dart';

class TopCategories extends StatefulWidget {
  const TopCategories({Key? key}) : super(key: key);

  @override
  State<TopCategories> createState() => _TopCategoriesState();
}

class _TopCategoriesState extends State<TopCategories> {
  List<String> categories = [
    "All",
    "Produit Halfa",
    "Chapeau & Couffin",
    "Divers",
    "Margoum",
    "Hinna"
  ];

  List<String> icons = [
    "All items_icon",
    "Dress_icon",
    "Hat_icon",
    "Watch_icon"
  ];

  int current = 0;
  final String category = '';
  final int _currentIndex = 0;
  void navigateToCategoryPage(BuildContext context, String category) {
    Navigator.pushNamed(context, CategoryDealsScreen.routeName,
        arguments: category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 38,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: ((context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    current = index;
                  });

                  context.read<CategoryBloc>().add(
                      LoadCategoryProductEvent(category: categories[index]));
                  // navigateToCategoryPage(context, categories[index]);
                  Navigator.of(context).pushNamed('/category-deals',
                      arguments: categories[index]);
                  print('here');
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                  margin: EdgeInsets.only(
                      left: index == 0 ? kPaddingHorizontal : 15,
                      right: index == categories.length - 1
                          ? kPaddingHorizontal
                          : 0),
                  height: 38,
                  decoration: BoxDecoration(
                    color: current == index ? kBrownColor : kGreysColor,
                    borderRadius: BorderRadius.circular(8),
                    border: current == index
                        ? null
                        : Border.all(
                            color: kLightGreyColor,
                            width: 1,
                          ),
                  ),
                  child: Text(categories[index],
                      style: current == index
                          ? kEncodeSansMedium.copyWith(
                              color: current == index
                                  ? kWhiteColor
                                  : kDarkBrownColor,
                              fontSize: 16,
                              //SizeConfig.blockSizeHorizontal! * 3,
                            )
                          : kEncodeSansRagular.copyWith(
                              color: current == index
                                  ? kWhiteColor
                                  : kDarkBrownColor,
                              fontSize: 16,
                              //SizeConfig.blockSizeHorizontal! * 3,
                            )),
                ),
              )),
        ));
  }
}
