import 'package:artisanaflutterapp/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // super.initState();
    // new Future.delayed(
    //   const Duration(seconds: 3),
    //   // () => Navigator.push(
    //   //       context,
    //   //       MaterialPageRoute(builder: (context) => HomeScreen()),
    //   //     )
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: SizedBox(
                width: double.infinity,
                height: 500,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            //

            CustomButton(
                title: 'Get started',
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/home',
                  );
                }),
          ],
        ),
      ),
    ));
  }
}
