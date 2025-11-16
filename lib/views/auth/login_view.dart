import 'package:flutter/material.dart';
import 'package:tasky/utils/consts.dart';
import 'package:tasky/utils/data_base.dart';
import 'package:tasky/utils/validator.dart';
import 'package:tasky/utils/appdialog.dart';
import 'package:tasky/views/auth/data/fire_base_data_base/data_base_user.dart';
import 'package:tasky/views/auth/register_view.dart';
import 'package:tasky/views/auth/widgets/custom_buttom_navigator.dart';
import 'package:tasky/views/home_view/home_view.dart';
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
  var passwordValidator = Validator.validateName;
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
                  onPressed: () async {
                    await login(emailController.text, passwordController.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login(String emailAddress, String password) async {
    Appdialog.showLoading(context);

    if (key.currentState!.validate()) {
      var result = await DataBaseUserAuth.logingUser(
        emailAddress: emailController.text,
        password: passwordController.text,
      );

      switch (result) {
        case DataBaseSuccess<void>():
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, HomeView.routeName);
          throw UnimplementedError();
        case DataBaseError<void>():
          Appdialog.showError(context, result.error);
          throw UnimplementedError();
      }
    }
  }
}
