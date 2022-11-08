import 'package:flutter/material.dart';
import 'package:swastik_air_hub/model/bookingRequest.dart';

import '../../model/passenger.dart';
import '../../utils/Color/colors.dart';
import '../../utils/dimesions/dimesions.dart';

class ContactFormWidget extends StatefulWidget {
  ContactFormWidget({Key? key, this.passenger, this.index}) : super(key: key);
  final int? index;
  PassengerRequest? passenger;
  final state = _ContactFormWidgetState();

  @override
  State<StatefulWidget> createState() {
    return state;
  }

  bool isValidated() => state.validate();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _middleNameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _firstValue = false;
  bool _secondValue = false;
}

class _ContactFormWidgetState extends State<ContactFormWidget> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        margin: EdgeInsets.only(
            top: Dimensions.height10,
            left: Dimensions.width10,
            right: Dimensions.width10,
            bottom: Dimensions.width10),
        width: Dimensions.width30 * 20,
        height: Dimensions.height30 * 9,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainBlackColor),
          borderRadius: BorderRadius.circular(Dimensions.radius25),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.mainBlackColor),
            borderRadius: BorderRadius.circular(Dimensions.radius25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height10,
                    left: Dimensions.width10,
                    right: Dimensions.width10,
                    bottom: Dimensions.width10),
                child: Text(
                  "Passenger - ${widget.index! + 1}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: const Color.fromARGB(169, 46, 38, 196)),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: Dimensions.width30 * 6,
                      child: TextFormField(
                        controller: widget._firstNameController,
                        onChanged: (value) =>
                            widget.passenger!.firstName = value,
                        onSaved: (value) => widget.passenger!.firstName = value,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width30 * 6,
                      child: TextFormField(
                        controller: widget._middleNameController,
                        onChanged: (value) =>
                            widget.passenger!.middleName = value,
                        onSaved: (value) =>
                            widget.passenger!.middleName = value,
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
                        controller: widget._lastNameController,
                        onChanged: (value) =>
                            widget.passenger!.lastName = value,
                        onSaved: (value) => widget.passenger!.lastName = value,
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width30 * 6,
                      child: TextFormField(
                        controller: widget._emailController,
                        onChanged: (value) =>
                            widget.passenger!.phoneNumber = value,
                        onSaved: (value) =>
                            widget.passenger!.phoneNumber = value,
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
      ),
    );
  }

  bool validate() {
    //Validate Form Fields by form key
    bool validate = formKey.currentState!.validate();
    if (validate) formKey.currentState!.save();
    return validate;
  }
}
