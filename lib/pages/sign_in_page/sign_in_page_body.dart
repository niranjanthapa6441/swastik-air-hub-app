import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/base/show_custom_snack_bar.dart';
import 'package:swastik_air_hub/model/LoginBody.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/app_text_field.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

import '../../controller/auth_controller.dart';

class SignInPageBody extends StatefulWidget {
  const SignInPageBody({Key? key}) : super(key: key);

  @override
  State<SignInPageBody> createState() => _SignInPageBodyState();
}

class _SignInPageBodyState extends State<SignInPageBody> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (authController) {
      return Container(
        child: ListView(
          children: [
            Column(children: [
              Container(
                height: Dimensions.height20 * 10,
              ),
              Container(
                margin: EdgeInsets.only(left: Dimensions.width30),
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: Dimensions.font30 * 2,
                        fontWeight: FontWeight.w600,
                        color: AppColors.purpleColor,
                      ),
                    ),
                    Text(
                      "Sign In to your account",
                      style: TextStyle(
                        fontSize: Dimensions.font10 * 2,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[400],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              AppTextField(
                  textEditingController: usernameController,
                  hintText: "Username",
                  icon: Icons.person),
              SizedBox(
                height: Dimensions.height20,
              ),
              AppTextField(
                textEditingController: passwordController,
                hintText: "Password",
                icon: Icons.password,
                isObscure: true,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
            ]),
            SizedBox(
              height: Dimensions.height30,
            ),
            GestureDetector(
              onTap: () {
                _loginValidation();
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: Dimensions.width30 +
                      Dimensions.width30 +
                      Dimensions.width30 +
                      Dimensions.width30,
                  right: Dimensions.width30 +
                      Dimensions.width30 +
                      Dimensions.width30 +
                      Dimensions.width30,
                ),
                height: Dimensions.screenHeight / 13,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.purpleColor,
                ),
                child: Center(
                  child: BigText(
                    text: "Sign In",
                    size: Dimensions.font30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            GestureDetector(
              onTap: () => Get.toNamed(RouteHelper.signUp),
              child: Container(
                height: 30,
                margin: EdgeInsets.only(bottom: Dimensions.height30),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: "Don't Have an Account? ",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: Dimensions.font20,
                        ),
                        children: [
                          TextSpan(
                            text: "Create",
                            style: TextStyle(
                              color: AppColors.purpleColor,
                              fontSize: Dimensions.font20 * 1.25,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  void _loginValidation() {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    if (username.isEmpty) {
      showCustomSnackBar("Username is Empty", title: "Username");
    } else if (password.isEmpty) {
      showCustomSnackBar("Password is Empty", title: "Password");
    } else {
      LoginBody userCredentials =
          LoginBody(username: username, password: password);
      var authController = Get.find<AuthController>();
      authController.login(userCredentials).then((status) {
        print(status.isSucces);
        if (status.isSucces) {
          Get.toNamed(RouteHelper.getNavigation());
        } else {
          showCustomSnackBar("Username/password don't match",
              title: "Invalied Login details");
        }
      });
    }
  }
}
