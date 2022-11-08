import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/model/bookingRequest.dart';
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
  List<ContactFormWidget> contactForms = List.empty(growable: true);
  addToList() {
    int count = AppConstants.NUMBER_OF_TRAVELLER;
    for (int i = 0; i < count; i++) {
      setState(() {
        PassengerRequest _contactModel =
            PassengerRequest(id: contactForms.length);
        contactForms.add(ContactFormWidget(
          index: contactForms.length,
          passenger: _contactModel,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    addToList();
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
                  text: "Passenger Details",
                  color: AppColors.mainBlackColor,
                ),
              ),
              Container(
                height: Dimensions.height10 * 65,
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: contactForms.length,
                  itemBuilder: (context, index) {
                    return contactForms[index];
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            onSave();
            Get.toNamed(RouteHelper.getTripSummarty());
          },
          child: Container(
            margin: EdgeInsets.only(
              left: Dimensions.width30 + Dimensions.width30,
              right: Dimensions.width30 + Dimensions.width30,
            ),
            height: Dimensions.screenHeight / 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              color: AppColors.purpleColor,
            ),
            child: Center(
              child: BigText(
                text: "Continue",
                size: Dimensions.font30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  onSave() {
    bool allValid = true;

    //If any form validation function returns false means all forms are not valid
    contactForms
        .forEach((element) => allValid = (allValid && element.isValidated()));

    if (allValid) {
      for (int i = 0; i < contactForms.length; i++) {
        ContactFormWidget item = contactForms[i];
        PassengerRequest request = new PassengerRequest();
        request.firstName = item.passenger!.firstName;
        request.middleName = item.passenger!.middleName;
        request.lastName = item.passenger!.lastName;
        request.phoneNumber = item.passenger!.phoneNumber;
        AppConstants.addPassengers(request);
      }
    } else {
      debugPrint("Form is Not Valid");
    }
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
