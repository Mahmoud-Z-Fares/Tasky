import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasky/utils/consts.dart';
import 'package:tasky/utils/data_base.dart';
import 'package:tasky/utils/validator.dart';
import 'package:tasky/utils/appdialog.dart';
import 'package:tasky/views/auth/data/fire_base_data_base/data_base_user.dart';
import 'package:tasky/views/auth/data/models/user_model.dart';
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
                  onPressed: () async {
                    await register(password: passwordController.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> register({required String password}) async {
    Appdialog.showLoading(context);
    var result = await DataBaseUserAuth.registerUser(
      userModel: UserModel(
        name: userNameController.text,
        email: emailController.text,
        uid: FirebaseAuth.instance.currentUser!.uid,
      ),
      password: passwordController.text,
    );
    switch (result) {
      case DataBaseSuccess<UserModel>():
        Navigator.pop(context);
        emailController.clear();
        passwordController.clear();
        userNameController.clear();
        confirmPasswordController.clear();
        Navigator.pushReplacementNamed(context, LoginView.routeName);

        throw UnimplementedError();
      case DataBaseError<UserModel>():
        //Navigator.pop(context);
        Appdialog.showError(context, result.error);
        throw UnimplementedError();
    }
  }
}
