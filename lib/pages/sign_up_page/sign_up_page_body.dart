import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/app_text_field.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({Key? key}) : super(key: key);

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var middleNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Column(children: [
            Container(
              height: Dimensions.height25,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textEditingController: firstNameController,
                hintText: "First Name",
                icon: Icons.person),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textEditingController: middleNameController,
                hintText: "Middle Name",
                icon: Icons.person),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textEditingController: lastNameController,
                hintText: "Last Name",
                icon: Icons.person),
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
                icon: Icons.password),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textEditingController: confirmPasswordController,
                hintText: "Confirm Password",
                icon: Icons.password),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textEditingController: emailController,
                hintText: "Email",
                icon: Icons.email),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
                textEditingController: phoneNumberController,
                hintText: "Phone Number",
                icon: Icons.phone),
          ]),
          SizedBox(
            height: Dimensions.height30,
          ),
          Container(
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
                text: "Sign Up",
                size: Dimensions.font30,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.height10,
          ),
          GestureDetector(
            onTap: () => Get.toNamed(RouteHelper.signIn),
            child: Container(
              height: 30,
              margin: EdgeInsets.only(bottom: Dimensions.height30),
              child: Center(
                child: RichText(
                  text: TextSpan(
                      text: "Have an Account Already? ",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: Dimensions.font20,
                      ),
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: Dimensions.font20 * 1.25,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
