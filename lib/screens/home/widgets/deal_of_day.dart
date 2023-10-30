import 'package:artisanaflutterapp/blocs/cart/cart_bloc.dart';
import 'package:artisanaflutterapp/blocs/home/home_bloc.dart';
import 'package:artisanaflutterapp/blocs/home/home_event.dart';
import 'package:artisanaflutterapp/blocs/home/home_state.dart';
import 'package:artisanaflutterapp/config/constants.dart';
import 'package:artisanaflutterapp/config/newsCardSkelton.dart';
import 'package:artisanaflutterapp/config/skeleton.dart';
import 'package:artisanaflutterapp/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({Key? key}) : super(key: key);

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      print('state:$state');
      if (state is ProductLoadingState) {
        return ListView.separated(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (context, index) => const NewsCardSkelton(),
          separatorBuilder: (context, index) => const SizedBox(height: 20),
        );
      }
      if (state is ProductLoadedState) {
        print(state.products);
        return Container(
          child: MasonryGridView.count(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 23,
            itemCount: state.products.length,
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/ProductDetailsScreen',
                    arguments: state.products[index],
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(kBorderRadius),
                              child: Image(
                                height: 124,
                                width: 161,
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    state.products[index].images[0]),
                              )),
                        ),
                        Positioned(
                            top: 12,
                            right: 12,
                            child: GestureDetector(
                                // onTap: () {},
                                // child: const Image(
                                //   height: 20,
                                //   width: 20,
                                //   image: AssetImage(
                                //       'assets/images/unselected_favourite.png'),
                                // ),
                                ))
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.products[index].name,
                                style: kEncodeSansCondensedThin.copyWith(
                                  color: kDarkBrownColor,
                                  fontSize: 16,
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            Text("${state.products[index].price} DT",
                                style: kEncodeSansSemiBold.copyWith(
                                  color: kBlackColor,
                                  fontSize: 12,
                                  //SizeConfig.blockSizeHorizontal! * 3.5,
                                ))
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Added to your Cart!'),
                              ),
                            );
                            context
                                .read<CartBloc>()
                                .add(AddProduct(state.products[index]));
                            //modify icon_cart
                          },
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      } else {
        return const Text('Something went wrong.');
      }
    });
  }
}
