import 'package:artisanaflutterapp/blocs/search/search_bloc.dart';
import 'package:artisanaflutterapp/blocs/search/search_state.dart';
import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:artisanaflutterapp/config/newsCardSkelton.dart';
import 'package:artisanaflutterapp/screens/home/widgets/address_box.dart';
import 'package:artisanaflutterapp/screens/search/widget/searched_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    // fetchSearchedProduct();
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

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
      body: Column(
        children: [
          // const AddressBox(),
          const SizedBox(height: 10),
          BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            print('statesearch:$state');
            if (state is ProductLoadingState) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.separated(
                      itemCount: 3,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const NewsCardSkelton(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                    ),
                  ],
                ),
              );
            } else if (state is ProductSearchedState) {
              return Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.pushNamed(
                        //   ProductDetailScreen.routeName,
                        //   arguments: products![index],
                        //
                        //  );
                      },
                      child: SearchedProduct(
                        product: state.products[index],
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Text('something went wrong');
            }
          }),
        ],
      ),
    );
  }
}
