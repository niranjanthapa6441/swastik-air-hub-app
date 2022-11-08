import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swastik_air_hub/controller/customer_controller.dart';
import 'package:swastik_air_hub/route_helper/route_helper.dart';
import 'package:swastik_air_hub/utils/Color/colors.dart';
import 'package:swastik_air_hub/utils/dimesions/dimesions.dart';
import 'package:swastik_air_hub/widgets/account_widget.dart';
import 'package:swastik_air_hub/widgets/app_icon.dart';
import 'package:swastik_air_hub/widgets/big_text.dart';

class ProfilePageBody extends StatefulWidget {
  const ProfilePageBody({Key? key}) : super(key: key);

  @override
  _ProfilePageBodyState createState() => _ProfilePageBodyState();
}

class _ProfilePageBodyState extends State<ProfilePageBody> {
  @override
  Widget build(BuildContext context) {
    Get.find<CustomerDetailController>().getCustomerDetails();
    return GetBuilder<CustomerDetailController>(builder: (context) {
      return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: Dimensions.height20),
              child: Center(
                child: AppIcon(
                  icon: Icons.person,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.purpleColor,
                  size: Dimensions.height10 * 15,
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            AccountWidget(
                appIcon: AppIcon(
                  icon: Icons.person,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.purpleColor,
                  size: Dimensions.height10 * 5,
                ),
                bigText: BigText(
                  text: context.customer!.firstName.toString(),
                  color: AppColors.textColor,
                )),
            SizedBox(
              height: Dimensions.height20,
            ),
            AccountWidget(
                appIcon: AppIcon(
                  icon: Icons.person,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.purpleColor,
                  size: Dimensions.height10 * 5,
                ),
                bigText: BigText(
                  text: context.customer!.middleName.toString().isEmpty
                      ? 'Middle Name'
                      : context.customer!.middleName.toString(),
                  color: AppColors.textColor,
                )),
            SizedBox(
              height: Dimensions.height20,
            ),
            AccountWidget(
                appIcon: AppIcon(
                  icon: Icons.person,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.purpleColor,
                  size: Dimensions.height10 * 5,
                ),
                bigText: BigText(
                  text: context.customer!.lastName.toString(),
                  color: AppColors.textColor,
                )),
            SizedBox(
              height: Dimensions.height20,
            ),
            AccountWidget(
                appIcon: AppIcon(
                  icon: Icons.email_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.purpleColor,
                  size: Dimensions.height10 * 5,
                ),
                bigText: BigText(
                  text: context.customer!.email.toString(),
                  color: AppColors.textColor,
                  textOverflow: TextOverflow.ellipsis,
                )),
            SizedBox(
              height: Dimensions.height20,
            ),
            AccountWidget(
                appIcon: AppIcon(
                  icon: Icons.phone_android,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.purpleColor,
                  size: Dimensions.height10 * 5,
                ),
                bigText: BigText(
                  text: context.customer!.phoneNumber.toString(),
                  color: AppColors.textColor,
                )),
            GestureDetector(
              onTap: () {
                Get.toNamed(RouteHelper.getUpdTeProfile());
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: Dimensions.height30,
                  left: Dimensions.width30 + Dimensions.width30 * 3,
                  right: Dimensions.width30 + Dimensions.width30 * 3,
                ),
                height: Dimensions.screenHeight / 19,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  color: AppColors.purpleColor,
                ),
                child: Center(
                  child: BigText(
                    text: "Edit Profile",
                    size: Dimensions.font20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
