import 'package:flutter/material.dart';
import 'package:tasky/app_bone/consts.dart';
import 'package:tasky/app_bone/validator.dart';
import 'package:tasky/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'tasky';
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
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                children: [
                  TextSpan(
                    text: "Sign up",
                    style: TextStyle(color: mainColor),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
      backgroundColor: whiteColor,
      body: Form(
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // shape: OutlinedBorder.lerp(a, b, t),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: mainColor,
                  minimumSize: Size(double.infinity, 48),
                ),

                onPressed: () {
                  if (key.currentState!.validate()) {}
                },
                child: Text("Login", style: TextStyle(color: whiteColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
