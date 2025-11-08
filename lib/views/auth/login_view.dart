import 'package:flutter/material.dart';
import 'package:tasky/app_bone/consts.dart';
import 'package:tasky/app_bone/validator.dart';
import 'package:tasky/views/auth/register_view.dart';
import 'package:tasky/views/auth/widgets/custom_buttom_navigator.dart';
import 'package:tasky/widgets/custom_button.dart';
import 'package:tasky/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'LoginView';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController();
  var emailValidator = Validator.validateEmail;
  var passwordController = TextEditingController();
  var passwordValidator = Validator.validatePassword;
  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigatorBar(
        onTap: () {
          Navigator.pushReplacementNamed(context, RegisterView.routeName);
        },
        firstText: "Don't have an account? ",
        secondText: "Sign Up",
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 110),
                Text("Login", style: styleBlack32W700),
                SizedBox(height: 40),

                Text("Email", style: styleBlack16W400),

                CustomTextForm(
                  controller: emailController,
                  validator: emailValidator,
                  hintText: "enter your email",
                ),
                SizedBox(height: 10),

                Text("password", style: styleBlack16W400),
                CustomTextForm(
                  isPassword: true,
                  controller: passwordController,
                  validator: passwordValidator,
                  hintText: " password",
                ),
                SizedBox(height: 50),
                CustomButton(
                  title: "Login",
                  onPressed: () {
                    if (key.currentState!.validate()) {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
