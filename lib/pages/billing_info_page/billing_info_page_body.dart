import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/model/payment_response.dart';

import '../../controller/payment_controller.dart';
import '../../utils/Color/colors.dart';
import '../../utils/dimesions/dimesions.dart';
import '../../widgets/big_text.dart';

class BillingInfoPageBody extends StatefulWidget {
  const BillingInfoPageBody({Key? key}) : super(key: key);

  @override
  _BillingInfoPageBodyState createState() => _BillingInfoPageBodyState();
}

class _BillingInfoPageBodyState extends State<BillingInfoPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  Widget build(BuildContext context) {
    print("current screen height" +
        MediaQuery.of(context).size.height.toString());
    print("width" + MediaQuery.of(context).size.width.toString());
    print(
        Get.find<CustomerPaymentInfoController>().getCustomerPaymentDetails());
    print('sdfasd');
    return Column(
      children: [
        GetBuilder<CustomerPaymentInfoController>(
          builder: (paymentInfo) {
            return Container(
              margin: EdgeInsets.only(
                top: Dimensions.width20,
              ),
              height: Dimensions.height10 * 68,
              child: ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: paymentInfo.customerPaymentDetails.isEmpty
                    ? 0
                    : paymentInfo.customerPaymentDetails.length,
                itemBuilder: (context, index) {
                  return paymentInfo.isLoaded
                      ? _buildCustomerBookingDetailItemPage(
                          index, paymentInfo.customerPaymentDetails[index])
                      : CircularProgressIndicator(
                          color: AppColors.purpleColor,
                        );
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCustomerBookingDetailItemPage(int index, Payment payment) {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: Dimensions.height10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius20),
        color: Color.fromARGB(220, 234, 235, 233),
      ),
      height: Dimensions.width10 * 18,
      child: Row(
        children: [
          //imageContainer
          Container(
            width: 120,
            height: 120,
            margin: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
                bottom: Dimensions.height10,
                top: Dimensions.height10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(169, 113, 103, 250),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigText(
                  text: payment.paymentDate.toString(),
                  color: Color.fromARGB(255, 237, 237, 238),
                ),
                // BigText(
                //   text: "Feburary",
                //   color: Color.fromARGB(255, 238, 237, 237),
                // ),
                // BigText(
                //   text: "2022",
                //   color: Color.fromARGB(255, 238, 237, 237),
                // )
              ],
            ),
          ),
          //textContainer
          Expanded(
            child: Container(
              width: 230,
              height: Dimensions.width10 * 18,
              margin: EdgeInsets.only(top: Dimensions.height10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "Paid Via: " + payment.paidVia.toString(),
                    color: AppColors.mainBlackColor,
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  BigText(
                    text: "Payment Method: " + payment.paymentMethod.toString(),
                    color: AppColors.mainBlackColor,
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  BigText(
                    text: "Paid Amount: " + payment.totalAmount.toString(),
                    color: AppColors.mainBlackColor,
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height15,
                  ),
                  BigText(
                    text: "Status: " + payment.status.toString(),
                    color: AppColors.mainBlackColor,
                    size: 18,
                  ),
                  SizedBox(
                    height: Dimensions.height20 * 0.92,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
