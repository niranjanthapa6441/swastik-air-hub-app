import 'package:flutter/material.dart';
import 'package:swastik_air_hub/pages/search_flight_page/components/date_time_picker.dart';

import 'input_fields.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<SearchBody> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.75,
          margin: EdgeInsets.all(20),
          child: ListView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 10,
                    ),
                    SearchFields(),
                    SizedBox(
                      height: 10,
                    ),
                    SearchFields(),
                    SizedBox(
                      height: 10,
                    ),
                    SearchFields(),
                    SizedBox(
                      height: 10,
                    ),
                    SearchFields(),
                    CustomDateTimePicker(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
