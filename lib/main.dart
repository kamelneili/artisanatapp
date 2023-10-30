import 'package:artisanaflutterapp/app_router.dart';
import 'package:artisanaflutterapp/blocs/account/account_bloc.dart';
import 'package:artisanaflutterapp/blocs/account/account_event.dart';
import 'package:artisanaflutterapp/blocs/address/address_bloc.dart';
import 'package:artisanaflutterapp/blocs/admin/admin_bloc.dart';
import 'package:artisanaflutterapp/blocs/cart/cart_bloc.dart';
import 'package:artisanaflutterapp/blocs/category/category_bloc.dart';
import 'package:artisanaflutterapp/blocs/category/category_event.dart';
import 'package:artisanaflutterapp/blocs/home/home_bloc.dart';
import 'package:artisanaflutterapp/blocs/home/home_event.dart';
import 'package:artisanaflutterapp/blocs/rating/rating_bloc.dart';
import 'package:artisanaflutterapp/blocs/search/search_bloc.dart';
import 'package:artisanaflutterapp/blocs/signin/signin_bloc.dart';
import 'package:artisanaflutterapp/blocs/signup/signup_bloc.dart';
import 'package:artisanaflutterapp/config/theme.dart';
import 'package:artisanaflutterapp/repository/account_repository.dart';
import 'package:artisanaflutterapp/repository/address_repository.dart';
import 'package:artisanaflutterapp/repository/admin_repository.dart';
import 'package:artisanaflutterapp/repository/auth_repository.dart';
import 'package:artisanaflutterapp/repository/cart_repository.dart';
import 'package:artisanaflutterapp/repository/home_repository.dart';
import 'package:artisanaflutterapp/repository/search_repository.dart';
import 'package:artisanaflutterapp/screens/home/screens/home_screen.dart';
import 'package:artisanaflutterapp/screens/login/logIn_screen.dart';
import 'package:artisanaflutterapp/screens/signup/signup_screen.dart';
import 'package:artisanaflutterapp/screens/splash/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    super.key,
    required this.appRouter,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignupBloc(authRepository: AuthRepository()),
          ),
          BlocProvider(
            create: (context) => SigninBloc(authRepository: AuthRepository()),
          ),
          BlocProvider(
            create: (context) => HomeBloc(homeRepository: HomeRepository())
              ..add(LoadProductEvent()),
          ),
          BlocProvider(
            create: (_) =>
                CartBloc(cartRepository: CartRepository())..add(LoadCart()),
          ),
          BlocProvider(
            create: (_) => AddressBloc(addressRepository: AddressRepository()),
          ),
          BlocProvider(
            create: (_) => AccountBloc(accountRepository: AccountRepository())
              ..add(LoadOrdersEvent()),
          ),
          BlocProvider(
              create: (_) => AdminBloc(adminRepository: AdminRepository())),
          BlocProvider(
              create: (_) => CategoryBloc(homeRepository: HomeRepository())
              //  ..add(LoadingCategoryProductEvent()),
              ),
          BlocProvider(
              create: (_) => RatingBloc(homeRepository: HomeRepository())),
          BlocProvider(
              create: (_) => SearchBloc(searchRepository: SearchRepository())),
        ],
        child: MaterialApp(
            onGenerateRoute: appRouter.generateRoute,
            debugShowCheckedModeBanner: false,
            home: const SplashScreen()));
  }
}
