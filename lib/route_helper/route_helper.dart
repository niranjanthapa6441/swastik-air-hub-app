import 'package:get/get.dart';
import 'package:swastik_air_hub/pages/booking_details_page/main_booking_details_page.dart';
import 'package:swastik_air_hub/pages/homepage/main_home_page.dart';
import 'package:swastik_air_hub/pages/menu/main_menu_page.dart';
import 'package:swastik_air_hub/pages/notification/main_notification_page.dart';
import 'package:swastik_air_hub/pages/profilepage/main_profile_page.dart';
import 'package:swastik_air_hub/pages/search_flight_page/main_search_flight_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String searchFlight = '/searchFlight';
  static const String bookingDetails = '/bookingDetails';
  static const String viewProfile = '/viewProfile';
  static const String viewNotifications = '/viewNotifications';
  static const String menu = '/menu';

  static String getInitial() => '$initial';
  static String getSearchFlight() => '$searchFlight';
  static String getBookingDetails() => '$bookingDetails';
  static String getViewProfile() => '$viewProfile';
  static String getViewNotiifcations() => '$viewNotifications';
  static String getMenu() => '$menu';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => Homepage()),
    GetPage(name: searchFlight, page: () => SeacrhFlightPage()),
    GetPage(name: bookingDetails, page: () => BookingDetails()),
    GetPage(name: viewProfile, page: () => ProfilePage()),
    GetPage(name: viewNotifications, page: () => NotificationPage()),
    GetPage(name: menu, page: () => MenuPage()),
  ];
}
