import 'package:get/get.dart';
import 'package:swastik_air_hub/pages/booking_details_page/main_bookings_page.dart';
import 'package:swastik_air_hub/pages/detail_confirmation/detail_confirmation_page.dart';
import 'package:swastik_air_hub/pages/homepage/main_home_page.dart';
import 'package:swastik_air_hub/pages/menu/main_menu_page.dart';
import 'package:swastik_air_hub/pages/notification/main_notification_page.dart';
import 'package:swastik_air_hub/pages/profilepage/main_profile_page.dart';
import 'package:swastik_air_hub/pages/search_flight_page/main_search_flight_page.dart';
import 'package:swastik_air_hub/pages/show_available_flights_and_tickets.dart/show_available_flights_and_tickets_page.dart';
import 'package:swastik_air_hub/pages/show_payment_method/show_payment_method_page.dart';
import 'package:swastik_air_hub/pages/trip_summary/trip_summary_page.dart';
import 'package:swastik_air_hub/pages/view_booking_detail/main_booking_detail.dart';

import '../pages/Login/main_login_page.dart';
import '../pages/Registration/main_registration_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String searchFlight = '/searchFlight';
  static const String bookingDetails = '/bookingDetails';
  static const String viewProfile = '/viewProfile';
  static const String viewNotifications = '/viewNotifications';
  static const String menu = '/menu';
  static const String registration = '/registration';
  static const String login = '/login';
  static const String bookingDetail = '/showBookingDetail';
  static const String tripSummary = '/tripSummary';
  static const String confirmDetail = '/confrimDetail';
  static const String availablePaymentMethods = '/availablePaymentMethods';
  static const String availableFlightsAndTickets =
      '/availableFlightsAndTickets';

  static String getInitial() => '$initial';
  static String getSearchFlight() => '$searchFlight';
  static String getBookingDetails() => '$bookingDetails';
  static String getViewProfile() => '$viewProfile';
  static String getViewNotiifcations() => '$viewNotifications';
  static String getMenu() => '$menu';
  static String getLogin() => '$login';
  static String getResgistration() => '$registration';
  static String getViewBookingDetail() => '$bookingDetail';
  static String getTripSummarty() => '$tripSummary';
  static String getAvailablePaymentMethods() => '$availablePaymentMethods';
  static String getConfrimDetail() => '$confirmDetail';
  static String getAvailableFlightsAndTickets() =>
      '$availableFlightsAndTickets';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => Homepage()),
    GetPage(name: searchFlight, page: () => SeacrhFlightPage()),
    GetPage(name: bookingDetails, page: () => Bookings()),
    GetPage(name: viewProfile, page: () => ProfilePage()),
    GetPage(name: viewNotifications, page: () => NotificationPage()),
    GetPage(name: menu, page: () => MenuPage()),
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: bookingDetail, page: () => BookingDetail()),
    GetPage(
        name: availableFlightsAndTickets,
        page: () => ShowAvailableFlightsAndTickets()),
    GetPage(name: confirmDetail, page: () => DetailConfirmationPage()),
    GetPage(
        name: availablePaymentMethods,
        page: () => ShowAvailablePaymentMethods()),
    GetPage(name: tripSummary, page: () => TripSummaryPage()),
  ];
}
