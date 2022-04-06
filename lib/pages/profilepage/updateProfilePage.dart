import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/app_text_field.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

import '../../base/show_custom_snack_bar.dart';
import '../../route_helper/route_helper.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({Key? key}) : super(key: key);

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(' Update Profile'),
        backgroundColor: Color.fromARGB(169, 46, 38, 196),
      ),
      body: Container(
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
                height: Dimensions.screenHeight / 19,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.purpleColor,
                ),
                child: Center(
                  child: BigText(
                    text: "Update Profile",
                    size: Dimensions.font20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _registrationValidation() async {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String middleName = middleNameController.text.trim();
    String email = emailController.text.trim();
    String phoneNumber = phoneNumberController.text.trim();
    if (firstName.isEmpty) {
      showCustomSnackBar("First Name is Empty", title: "First Name");
    } else if (lastName.isEmpty) {
      showCustomSnackBar("Last Name is Empty", title: "Last Name");
    } else if (email.isEmpty) {
      showCustomSnackBar("Email is Empty", title: "Email");
    } else if (phoneNumber.isEmpty) {
      showCustomSnackBar("Phone Number is Empty", title: "Phone Number");
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar("Invalid Email", title: "Email");
    } else if (!phoneNumber.isPhoneNumber) {
      showCustomSnackBar("In Valid Phone Number", title: "PhoneNumber");
    } else if (phoneNumber.length < 10 || phoneNumber.length > 10) {
      showCustomSnackBar("Phone Number Should be 10", title: "PhoneNumber");
    } else {
      Get.back();
    }
  }
}
