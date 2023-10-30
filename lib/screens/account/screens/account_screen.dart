import 'package:artisanaflutterapp/blocs/signin/signin_bloc.dart';
import 'package:artisanaflutterapp/blocs/signin/signin_event.dart';
import 'package:artisanaflutterapp/blocs/signin/signin_state.dart';
import 'package:artisanaflutterapp/screens/account/widgets/below_app_bar.dart';
import 'package:artisanaflutterapp/screens/account/widgets/orders.dart';
import 'package:artisanaflutterapp/widgets/app_bottom_nav_bar.dart';
import 'package:artisanaflutterapp/widgets/grocery_search_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFfed9cd),
          actions: [
            IconButton(
              onPressed: () async {
                context.read<SigninBloc>().add(LogoutEvent());
              },
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.black,
              ),
            )
          ],
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
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(56.0),
            child: GrocerySearchTextFormField(),
          ),
        ),
        bottomNavigationBar: const AppBottomNavBar(index: 0),
        body: BlocListener<SigninBloc, SigninState>(
          listener: (context, state) async {
            print("loginstate:$state");

            if (state is UserLogoutState) {
              Navigator.of(context).pushNamed('/home');
            }
          },
          child: const SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20),

                  // BelowAppBar(),
                  SizedBox(height: 20),
                  //TopButtons(),
                  //SizedBox(height: 20),
                  Orders(),
                ],
              ),
            ),
          ),
        ));
  }
}
