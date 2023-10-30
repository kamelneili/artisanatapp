import 'package:artisanaflutterapp/blocs/signin/signin_bloc.dart';
import 'package:artisanaflutterapp/blocs/signin/signin_event.dart';
import 'package:artisanaflutterapp/blocs/signin/signin_state.dart';
import 'package:artisanaflutterapp/screens/account/widgets/account_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninBloc, SigninState>(
        listener: (context, state) async {
      print("loginstate:$state");

      if (state is UserLogoutState) {
        Navigator.of(context).pushNamed('/home');
      }
      Column(
        children: [
          Row(
            children: [
              AccountButton(
                text: 'Your Orders',
                onTap: () {},
              ),
              AccountButton(
                text: 'Turn Seller',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              AccountButton(
                  text: 'Log Out',
                  onTap: () => {
                        context.read<SigninBloc>().add(LogoutEvent()),
                      }),
              AccountButton(
                text: 'Your Wish List',
                onTap: () {},
              ),
            ],
          ),
        ],
      );
    });
  }
}
