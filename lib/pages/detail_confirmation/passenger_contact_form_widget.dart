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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: Dimensions.width30 * 6,
                      child: TextFormField(
                        controller: widget._firstNameController,
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width30 * 6,
                      child: TextFormField(
                        controller: widget._middleNameController,
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
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.width30 * 6,
                      child: TextFormField(
                        controller: widget._emailController,
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
                        controller: widget._contactController,
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
