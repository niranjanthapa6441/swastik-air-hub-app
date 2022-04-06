import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

import '../../base/show_custom_snack_bar.dart';

class DetailConfirmationPageBody extends StatefulWidget {
  const DetailConfirmationPageBody({Key? key}) : super(key: key);

  @override
  _DetailConfirmationPageBodyState createState() =>
      _DetailConfirmationPageBodyState();
}

class _DetailConfirmationPageBodyState
    extends State<DetailConfirmationPageBody> {
  bool firstValue = false;
  bool secondValue = false;
  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var middleNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children: [
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height10, left: Dimensions.width10),
                child: BigText(
                  text: "Contact Details",
                  color: AppColors.mainBlackColor,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height10,
                    left: Dimensions.width10,
                    right: Dimensions.width10),
                width: Dimensions.width30 * 20,
                height: Dimensions.height30 * 10,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainBlackColor, width: 2),
                  borderRadius: BorderRadius.circular(Dimensions.radius25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: Dimensions.width30 * 6,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'First Name',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width30 * 6,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Middle Name',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: Dimensions.width30 * 6,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Last Name',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width30 * 6,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: Dimensions.width10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Dimensions.width30 * 8,
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            value: firstValue,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                firstValue = value!;
                              });
                            },
                            activeColor: Colors.blue,
                          ),
                          BigText(
                            text: "I am a passenger in this flight",
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height10, left: Dimensions.width10),
                child: BigText(
                  text: "Passenger Details",
                  color: AppColors.mainBlackColor,
                ),
              ),
              Container(
                height: 350,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: AppConstants.NUMBER_OF_TRAVELLER,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          top: Dimensions.height10,
                          left: Dimensions.width10,
                          right: Dimensions.width10,
                          bottom: Dimensions.width10),
                      width: Dimensions.width30 * 20,
                      height: Dimensions.height30 * 9,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.mainBlackColor),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius25),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.mainBlackColor),
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: Dimensions.width30 * 6,
                                    child: TextFormField(
                                      controller: firstNameController,
                                      decoration: const InputDecoration(
                                        labelText: 'First Name',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width30 * 6,
                                    child: TextFormField(
                                      controller: middleNameController,
                                      decoration: const InputDecoration(
                                        labelText: 'Middle Name',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: Dimensions.width30 * 6,
                                    child: TextFormField(
                                      controller: lastNameController,
                                      decoration: const InputDecoration(
                                        labelText: 'Last Name',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width30 * 6,
                                    child: TextFormField(
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                        labelText: 'Email',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: Dimensions.width10),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: Dimensions.width30 * 8,
                                    child: TextFormField(
                                      controller: phoneNumberController,
                                      decoration: const InputDecoration(
                                        labelText: 'Phone Number',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: [
              Checkbox(
                value: secondValue,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    secondValue = value!;
                  });
                },
                activeColor: Colors.blue,
              ),
              BigText(
                text: "I agree with terms and conditions.",
                size: 14,
              ),
              SizedBox(
                width: Dimensions.width15,
              ),
              GestureDetector(
                onTap: (() {
                  // _validatePassengerDetails();
                  Get.toNamed(RouteHelper.getTripSummarty());
                }),
                child: BigText(
                  text: "Continue",
                  size: 20,
                  color: AppColors.purpleColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _validatePassengerDetails() {
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
      print("dsfsdf");
    }
  }
}
