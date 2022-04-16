import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:swastik_air_hub/controller/flight_controller.dart';
import 'package:swastik_air_hub/model/search_flight_request_body.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/utils/app_constants/app_constants.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

import '../../base/show_custom_snack_bar.dart';
import '../../controller/sector_controller.dart';
import '../../widgets/app_text_field.dart';

class SearchFlightPageBody extends StatefulWidget {
  const SearchFlightPageBody({Key? key}) : super(key: key);
  @override
  State<SearchFlightPageBody> createState() => _SearchFlightPageBodyState();
}

class _SearchFlightPageBodyState extends State<SearchFlightPageBody> {
  String? sector;
  List<dynamic> productTypesList = [];
  DateTime _selectedValue = DateTime.now();
  String dropdownValue = '';
  bool sectorSelection = false;
  var numberOfTravellerController = TextEditingController();
  var firstNameController = TextEditingController();
  var passwordController = TextEditingController();
  bool isShowing = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> sectorCodes = Get.find<SectorController>().sectorCodes;

    return ListView(
      children: [
        Column(
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
                  AppTextField(
                      textEditingController: passwordController,
                      hintText: DateFormat.yMMMd().format(_selectedValue),
                      icon: Icons.calendar_today_outlined,
                      readOnly: true,
                      widget: IconButton(
                          onPressed: () {
                            _getDateFromUser();
                          },
                          icon: Icon(
                            Icons.calendar_today_outlined,
                            color: AppColors.purpleColor,
                          ))),
                  SizedBox(
                    height: Dimensions.height30 * 1.35,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: Dimensions.width20, right: Dimensions.width20),
                    height: Dimensions.height10 * 6.25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              spreadRadius: 6,
                              offset: Offset(1, 8),
                              color: Colors.grey.withOpacity(0.2))
                        ]),
                    child: Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.width20, right: Dimensions.width20),
                      child: Center(
                        child: DropdownButton<String>(
                          elevation: 16,
                          style: TextStyle(color: AppColors.mainBlackColor),
                          underline: null,
                          icon: null,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                              sectorSelection = true;
                              print(dropdownValue);
                            });
                          },
                          items: sectorCodes
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          hint: sectorSelection
                              ? Text(dropdownValue.toString())
                              : Text("Select Sector"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height30 * 1.35,
                  ),
                  AppTextField(
                      textEditingController: numberOfTravellerController,
                      hintText: "Number Of Traveller",
                      icon: Icons.person),
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
        ),
      ],
    );
  }

  void _searchFlight() {
    String sectorCode = dropdownValue;
    String departureDate = DateFormat.yMMMMd().format(_selectedValue);
    if (dropdownValue.isEmpty) {
      showCustomSnackBar("Select Sector", title: "Sector");
    } else if (!(numberOfTravellerController.text.toString().trim().isNum) ||
        numberOfTravellerController.text.toString().trim().isEmpty) {
      showCustomSnackBar("Provide Valid Details", title: "Number Of Traveller");
    } else {
      String number = numberOfTravellerController.text.toString().trim();
      int numberOfTraveller = int.parse(number);
      AppConstants.NUMBER_OF_TRAVELLER = numberOfTraveller;
      SearchFlightRequestBody searchFlightRequestBody = SearchFlightRequestBody(
          sectorCode: sectorCode,
          departureDate: departureDate,
          numberOfTraveller: numberOfTraveller);
      var flightController = Get.find<FlightController>();

      flightController
          .findAvailableflights(searchFlightRequestBody)
          .then((status) {
        if (status.isSucces) {
          Get.toNamed(RouteHelper.getAvailableFlightsAndTickets());
          showCustomSnackBar("Showing Available Flights",
              title: "Search Flights");
        } else {
          showCustomSnackBar(status.message, title: "Search Flight");
        }
      });
    }
  }

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (_pickerDate != null) {
      setState(() {
        _selectedValue = _pickerDate;
        print(DateFormat.yMMMMd().format(_selectedValue));
      });
    }
  }
}
