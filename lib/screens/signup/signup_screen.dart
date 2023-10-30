import 'package:artisanaflutterapp/blocs/signup/signup_bloc.dart';
import 'package:artisanaflutterapp/blocs/signup/signup_event.dart';
import 'package:artisanaflutterapp/blocs/signup/signup_state.dart';
import 'package:artisanaflutterapp/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  static const String routeName = '/signup';

  const SignupScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const SignupScreen(),
    );
  }

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isLoading = false;
  bool authenticated = false;
  bool loginError = false;
  late SignupBloc signupBloc;

  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController adress = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();

  TextEditingController zip = TextEditingController();
  @override
  bool _passVisibility = true;

  @override
  void initState() {
    const bool passwordVisible = false;
    signupBloc = BlocProvider.of<SignupBloc>(context);

    TextEditingController email = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController country = TextEditingController();
    TextEditingController adress = TextEditingController();
    TextEditingController zip = TextEditingController();

    TextEditingController phone = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: BlocListener<SignupBloc, SignupState>(
          listener: (context, state) async {
            if (state is LoginLoadingState) {
              _drawLoading();
            } else if (state is UserLoginSuccessState) {
              //  Navigator.of(context).pushNamed('/home', arguments: state.data);
            } else if (state is LoginErrorState) {
              const snackBar = SnackBar(
                  content: Text('Username or password is incorrect !!!'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                    // child: SizedBox(
                    //   width: 70,
                    //   height: 70,
                    //   child: Image(
                    //     fit: BoxFit.fill,
                    //     image: AssetImage('assets/logo.png'),
                    //   ),
                    // ),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: (isLoading) ? _drawLoading() : _drawLoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _drawLoginForm() {
    if (loginError) {
      return Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Login Error'),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    loginError = false;
                  });
                },
                child: const Text(
                  'try Again',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      );
    }
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'name',
                errorStyle: TextStyle(color: Colors.white)),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid name';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'email',
                errorStyle: TextStyle(color: Colors.white)),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            obscureText: _passVisibility,
            controller: password,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Password',
              errorStyle: const TextStyle(color: Colors.white),
              suffixIcon: IconButton(
                onPressed: () {
                  _passVisibility = !_passVisibility;

                  setState(() {});
                },
                icon: _passVisibility
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 48,
          ),

          SizedBox(
            width: double.infinity,
            child: CustomButton(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  signupBloc.add(RegisterButtonPressed(
                      email: email.text,
                      name: name.text,
                      password: password.text));
                  Navigator.of(context).pushNamed('/home');
                }
              },
              title: 'Signup',
            ),
          ),
          //auth_login

          //

          //
        ],
      ),
    );
  }

  Widget _drawLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
