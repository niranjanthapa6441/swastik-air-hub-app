import 'package:get/get.dart';
import 'package:swastik_air_hub/pages/booking_details_page/main_bookings_page.dart';
import 'package:swastik_air_hub/pages/detail_confirmation/detail_confirmation_page.dart';
import 'package:swastik_air_hub/pages/homepage/main_home_page.dart';
import 'package:swastik_air_hub/pages/homepage/navigation.dart';
import 'package:swastik_air_hub/pages/menu/main_menu_page.dart';
import 'package:swastik_air_hub/pages/notification/main_notification_page.dart';
import 'package:swastik_air_hub/pages/profilepage/main_profile_page.dart';
import 'package:swastik_air_hub/pages/search_flight_page/main_search_flight_page.dart';
import 'package:swastik_air_hub/pages/show_available_flights_and_tickets.dart/show_available_flights_and_tickets_page.dart';
import 'package:swastik_air_hub/pages/show_payment_method/show_payment_method_page.dart';
import 'package:swastik_air_hub/pages/sign_in_page/sign_in.dart';
import 'package:swastik_air_hub/pages/sign_up_page/sign_up.dart';
import 'package:swastik_air_hub/pages/trip_summary/trip_summary_page.dart';
import 'package:swastik_air_hub/pages/view_booking_detail/main_booking_detail.dart';

import '../pages/Login/main_login_page.dart';
import '../pages/Registration/main_registration_page.dart';
import '../pages/flight_ticket_detail_page/flight_ticket_detail_page.dart';

class RouteHelper {
  static const String initial = '/';
  static const String signIn = '/signIn';
  static const String navigation = '/navigation';
  static const String signUp = '/signUp';
  static const String homepage = '/homepage';
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

  static const String viewFlightTicketDetail = '/flightticketdetail';
  static String getInitial() => '$initial';
  static String getNavigation() => '$navigation';
  static String getSignIn() => '$signIn';
  static String getSignUp() => '$signUp';
  static String getHomepage() => '$homepage';
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
  static String getFlightTicketDetail() => '$viewFlightTicketDetail';

  static List<GetPage> routes = [
    GetPage(name: homepage, page: () => Homepage()),
    GetPage(
      name: signIn,
      page: () => SignInPage(),
      popGesture: true,
    ),
    GetPage(name: navigation, page: () => Navigation()),
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
        page: () {
          return ShowAvailableFlightsAndTickets();
        },
        popGesture: true),
    GetPage(
        name: confirmDetail,
        page: () => DetailConfirmationPage(),
        popGesture: true),
    GetPage(
        name: availablePaymentMethods,
        page: () => ShowAvailablePaymentMethods()),
    GetPage(name: tripSummary, page: () => TripSummaryPage()),
    GetPage(name: signUp, page: () => SignUpPage(), popGesture: true),
    GetPage(name: viewFlightTicketDetail, page: () => FlightTicketDetailPage()),
  ];
}
