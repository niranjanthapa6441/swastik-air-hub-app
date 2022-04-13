import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/model/passenger.dart';
import 'package:swastik_air_hub/pages/detail_confirmation/passenger_contact_form_widget.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

import '../../base/show_custom_snack_bar.dart';

class DetailConfirmationPageBody extends StatefulWidget {
  DetailConfirmationPageBody(
      {Key? key, this.passenger, this.onRemove, this.index})
      : super(key: key);

  final int? index;
  Passenger? passenger;
  final Function? onRemove;
  final state = _DetailConfirmationPageBodyState();

  @override
  State<StatefulWidget> createState() {
    return state;
  }

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _middleNameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _firstValue = false;
  bool _secondValue = false;
}

class _DetailConfirmationPageBodyState
    extends State<DetailConfirmationPageBody> {
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
                            value: widget._firstValue,
                            onChanged: (value) {
                              setState(() {
                                print(value);
                                widget._firstValue = value!;
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
                height: Dimensions.height10 * 35,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: AppConstants.NUMBER_OF_TRAVELLER,
                  itemBuilder: (context, index) {
                    return ContactFormWidget(
                      index: index,
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
                value: widget._secondValue,
                onChanged: (value) {
                  setState(() {
                    print(value);
                    widget._secondValue = value!;
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
    String firstName = widget._firstNameController.text.trim();
    String lastName = widget._lastNameController.text.trim();
    String middleName = widget._middleNameController.text.trim();
    String email = widget._emailController.text.trim();
    String phoneNumber = widget._contactController.text.trim();
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
