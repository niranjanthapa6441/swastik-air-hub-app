import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swastik_air_hub/base/show_custom_snack_bar.dart';
import 'package:swastik_air_hub/controller/auth_controller.dart';
import 'package:swastik_air_hub/model/SIgnUp.dart';
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
  SharedPreferences? preferences;

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
              icon: Icons.password,
              isObscure: true,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            AppTextField(
              textEditingController: confirmPasswordController,
              hintText: "Confirm Password",
              icon: Icons.password,
              isObscure: true,
            ),
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
          GestureDetector(
            onTap: () {
              _registrationValidation();
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
                  text: "Sign Up",
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
                            color: AppColors.purpleColor,
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

  Future<void> _registrationValidation() async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String middleName = middleNameController.text.trim();
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    String email = emailController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    if (firstName.isEmpty) {
      showCustomSnackBar("First Name is Empty", title: "First Name");
    } else if (lastName.isEmpty) {
      showCustomSnackBar("Last Name is Empty", title: "Last Name");
    } else if (username.isEmpty) {
      showCustomSnackBar("Username is Empty", title: "Username");
    } else if (password.isEmpty) {
      showCustomSnackBar("Password is Empty", title: "Password");
    } else if (confirmPassword.isEmpty) {
      showCustomSnackBar("Confirm Password is Empty",
          title: "Confirm Password");
    } else if (email.isEmpty) {
      showCustomSnackBar("Email is Empty", title: "Email");
    } else if (phoneNumber.isEmpty) {
      showCustomSnackBar("Phone Number is Empty", title: "Phone Number");
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar("Invalid Email", title: "Email");
    } else if (password.length < 8) {
      showCustomSnackBar("Password less than 8 characters", title: "Password");
    } else if (password != confirmPassword) {
      showCustomSnackBar("Password's Don't Match", title: "Password");
    } else if (!phoneNumber.isPhoneNumber) {
      showCustomSnackBar("In Valid Phone Number", title: "PhoneNumber");
    } else if (phoneNumber.length < 10 || phoneNumber.length > 10) {
      showCustomSnackBar("Phone Number Should be 10", title: "PhoneNumber");
    } else {
      SignUpBody newUser = SignUpBody(
          firstName: firstName,
          lastName: lastName,
          middleName: middleName,
          email: email,
          username: username,
          phoneNumber: phoneNumber,
          password: password);
      print(newUser.toString());
      var authController = Get.find<AuthController>();
      authController.registration(newUser).then((status) {
        print(status.isSucces);
        if (status.isSucces) {
          Get.toNamed(RouteHelper.signIn);
          customSnackBar(
              "Registration Successful! Please Verify Your Email Before logging In",
              title: "Registration");
        } else {
          if (status.message.toLowerCase() == "bad request") {
            showCustomSnackBar('Password must contain characters',
                title: "Registration");
          }
        }
      });
    }
  }

  customSnackBar(String message,
      {bool isError = true,
      String title = "Error",
      Color color = Colors.green}) {
    Get.snackbar(title, message,
        titleText: BigText(
          text: title,
          color: Colors.white,
        ),
        messageText: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        backgroundColor: color);
  }
}
