import 'package:artisanaflutterapp/blocs/account/account_bloc.dart';
import 'package:artisanaflutterapp/blocs/account/account_event.dart';
import 'package:artisanaflutterapp/blocs/account/account_state.dart';
import 'package:artisanaflutterapp/blocs/signin/signin_bloc.dart';
import 'package:artisanaflutterapp/blocs/signin/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({super.key, required this.index});

  final int index;

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  static bool isLoggedIn = false;
  gettoken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var mytoken = pref.getString('token');
    print('token:$mytoken');
    setState(() {
      if (mytoken == null) {
        isLoggedIn = false;
      } else {
        isLoggedIn = true;
      }
    });
    //return mytoken;
  }

//****** */
  @override
  void initState() {
    super.initState();
    gettoken();
    var mytoken = gettoken();

    // TODO: implement initState
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(48.0),
        ),
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStatePropertyAll(
            Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white),
          ),
        ),
        child: BlocBuilder<SigninBloc, SigninState>(builder: (context, state) {
          print('appbottomstate:$state');
          return NavigationBar(
            backgroundColor: const Color(0xFF996633),
            height: 55,
            selectedIndex: widget.index,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (value) {
              print('state:$state');
              if (value == 0) Navigator.of(context).pushNamed('/home');
              if (value == 4) {
                if (state is UserLogoutState) {
                  Navigator.of(context).pushNamed('/login');
                } else {
                  context.read<AccountBloc>().add(LoadOrdersEvent());
                  Navigator.of(context).pushNamed('/account');
                }
              }
              if (value == 3) {
                if (state is UserLogoutState) {
                  Navigator.of(context).pushNamed('/login');
                } else {
                  context.read<AccountBloc>().add(LoadOrdersEvent());
                  Navigator.of(context).pushNamed('/account');
                }
              }
            },
            destinations: const [
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: NavigationDestination(
                  selectedIcon: Icon(Icons.home, color: Colors.white),
                  icon: Icon(Icons.home_outlined, color: Colors.white),
                  label: 'Home',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: NavigationDestination(
                  selectedIcon: Icon(Icons.shopping_bag, color: Colors.white),
                  icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
                  label: 'Browse',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: NavigationDestination(
                  selectedIcon: Icon(Icons.qr_code, color: Colors.white),
                  icon: Icon(Icons.qr_code_2_outlined, color: Colors.white),
                  label: 'Scan',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: NavigationDestination(
                  selectedIcon: Icon(Icons.history, color: Colors.white),
                  icon: Icon(Icons.history_outlined, color: Colors.white),
                  label: 'Orders',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: NavigationDestination(
                  selectedIcon: Icon(Icons.person, color: Colors.white),
                  icon: Icon(Icons.person_2_outlined, color: Colors.white),
                  label: 'Profile',
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
