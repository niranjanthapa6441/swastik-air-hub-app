import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:swastik_air_hub/controller/flight_controller.dart';
import 'package:swastik_air_hub/model/response_model.dart';
import 'package:swastik_air_hub/model/search_flight_request_body.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

import '../../base/show_custom_snack_bar.dart';
import '../../widgets/app_text_field.dart';

class SearchFlightPageBody extends StatefulWidget {
  const SearchFlightPageBody({Key? key}) : super(key: key);
  @override
  State<SearchFlightPageBody> createState() => _SearchFlightPageBodyState();
}

class _SearchFlightPageBodyState extends State<SearchFlightPageBody> {
  String? sector;
  List<dynamic> productTypesList = [];
  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var middleNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  bool isShowing = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 70,
        ),
        Container(
          height: Dimensions.height40 * 12.5,
          child: Column(
            children: [
              SizedBox(
                height: Dimensions.height30 * 1.35,
              ),
              // FormHelper.dropDownWidget(
              //   context,
              //   "Select Country",
              //   this.sector,
              //   this.sectors,
              //   (onChangedValue) {
              //     this.sector = onChangedValue;
              //   },
              //   (onValidate) {},
              //   borderFocusColor: Colors.white30,
              //   borderColor: Color.fromARGB(153, 170, 166, 166),
              //   borderRadius: Dimensions.radius20,
              //   hintColor: AppColors.purpleColor,
              //   optionLabel: "Labal",
              // ),
              SizedBox(
                height: Dimensions.height30 * 1.35,
              ),
              AppTextField(
                  textEditingController: emailController,
                  hintText: "Email",
                  icon: Icons.email),
              SizedBox(
                height: Dimensions.height30 * 1.35,
              ),
              AppTextField(
                  textEditingController: phoneNumberController,
                  hintText: "Phone Number",
                  icon: Icons.phone),
              SizedBox(
                height: Dimensions.height30 * 1.35,
              ),
              AppTextField(
                  textEditingController: phoneNumberController,
                  hintText: "Phone Number",
                  icon: Icons.phone),
              SizedBox(
                height: Dimensions.height30 * 1.25,
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            _searchFlight();
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
                text: "Search Flight",
                size: Dimensions.font30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _searchFlight() {
    String sectorCode = "KTM-PKR";
    String departureDate = "26 March, 2022";
    int numberOfTraveller = 4;
    SearchFlightRequestBody searchFlightRequestBody = SearchFlightRequestBody(
        sectorCode: sectorCode,
        departureDate: departureDate,
        numberOfTraveller: numberOfTraveller);
    var flightController = Get.find<FlightController>();
    flightController
        .findAvailableflights(searchFlightRequestBody)
        .then((status) {
      print(status.isSucces);
      if (status.isSucces) {
        Get.toNamed(RouteHelper.getAvailableFlightsAndTickets());
        showCustomSnackBar("Showing Available Flights",
            title: "Search Flights");
      } else {
        showCustomSnackBar(status.message, title: "Search Flight");
      }
    });
    print(flightController.availableFlights);
  }
}
