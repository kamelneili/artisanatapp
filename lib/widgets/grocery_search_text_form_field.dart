import 'package:artisanaflutterapp/blocs/search/search_bloc.dart';
import 'package:artisanaflutterapp/blocs/search/search_event.dart';
import 'package:artisanaflutterapp/screens/search/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GrocerySearchTextFormField extends StatefulWidget {
  const GrocerySearchTextFormField({
    super.key,
  });

  @override
  State<GrocerySearchTextFormField> createState() =>
      _GrocerySearchTextFormFieldState();
}

class _GrocerySearchTextFormFieldState
    extends State<GrocerySearchTextFormField> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
    print(query);
    context.read<SearchBloc>().add(SearchProductEvent(query: query));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        bottom: 8.0,
      ),
      child: TextFormField(
        onFieldSubmitted: navigateToSearchScreen,
        // context
        //     .read<SearchBloc>()
        //     .add(SearchProductEvent(query: 'margoum')),

        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: textTheme.bodyMedium!.copyWith(
            color: Colors.black,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: colorScheme.onPrimaryContainer.withAlpha(100),
        ),
      ),
    );
  }
}
