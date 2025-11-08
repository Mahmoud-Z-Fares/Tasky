import 'package:flutter/material.dart';
import 'package:tasky/app_bone/consts.dart';
import 'package:tasky/app_bone/validator.dart';
import 'package:tasky/views/auth/login_view.dart';
import 'package:tasky/views/auth/widgets/custom_buttom_navigator.dart';
import 'package:tasky/widgets/custom_button.dart';
import 'package:tasky/widgets/custom_text_field.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = 'RegisterView';
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var userNameValidator = Validator.validateName;
  var emailValidator = Validator.validateEmail;
  var passwordValidator = Validator.validatePassword;
  var confirmPasswordValidator = Validator.validateConfirmPassword("", "");

  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigatorBar(
        onTap: () {
          Navigator.pushReplacementNamed(context, LoginView.routeName);
        },
        firstText: "Already Have An Account? ",
        secondText: "Sign in",
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
                SizedBox(height: 90),
                Text("Register", style: styleBlack32W700),

                Text("User Name", style: styleBlack16W400),

                CustomTextForm(
                  controller: userNameController,
                  validator: userNameValidator,
                  hintText: "enter your full Name",
                ),

                Text("Email", style: styleBlack16W400),

                CustomTextForm(
                  controller: emailController,
                  validator: emailValidator,
                  hintText: "enter your email",
                ),
                Text("password", style: styleBlack16W400),
                CustomTextForm(
                  isPassword: true,
                  controller: passwordController,
                  validator: userNameValidator,
                  hintText: " password",
                ),

                Text("Confirm Password", style: styleBlack16W400),
                CustomTextForm(
                  isPassword: true,
                  controller: confirmPasswordController,
                  validator: (text) {
                    return Validator.validateConfirmPassword(
                      text,
                      passwordController.text,
                    );
                  },
                  hintText: " password",
                ),
                SizedBox(height: 50),
                CustomButton(
                  title: "Register",
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      print(" every thing right  ");
                    } else {
                      print(" every thing wrong  ");
                    }
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
