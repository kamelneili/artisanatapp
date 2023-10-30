import 'package:artisanaflutterapp/config/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BelowAppBar extends StatefulWidget {
  const BelowAppBar({Key? key}) : super(key: key);
  @override
  State<BelowAppBar> createState() => _BelowAppBarState();
}

class _BelowAppBarState extends State<BelowAppBar> {
  getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      name = pref.getString('name')!;
    });
  }

  String name = '';
  @override
  void initState() {
    super.initState();

    getName();
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;

    return Container(
      decoration: const BoxDecoration(),
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: 'Hello, ',
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: name,
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
