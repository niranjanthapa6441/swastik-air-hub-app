import '../../model/bookingRequest.dart';
import '../../pages/detail_confirmation/passenger_contact_form_widget.dart';

class AppConstants {
  static const String APP_NAME = "Swastik Air Hub";
  static const String BASE_URL =
      "https://swastikair.herokuapp.com/swastikairhub/";
  static const String BUDDHA_BASE_URL =
      "https://buddhairllinesreplica.herokuapp.com/buddhaair/";
  static const String NEPAL_AIRLINES_BASE_URL =
      "https://nepalairreplica.herokuapp.com/nepalairlines/";
  // static const String BUDDHA_BASE_URL = "http://100.64.218.31:8081/buddhaair/";
  // static const String NEPAL_AIRLINES_BASE_URL =
  //     "http://100.64.218.31:8082/nepalairlines/";

  // static const String BASE_URL = "http://100.64.218.31:8083/swastikairhub/";

  static const String API_VERSION = "api/v1/";
  static const String CUSTOMER_URI = API_VERSION + "customer/";
  static const String RECOMMENDED_PRODUCT_URI = "";
  static const String CUSTOMER_BOOKING_DETAIL_URI =
      API_VERSION + "booking/customer/";
  static const String CUSTOMER_PAYMENT_DETAIL_URI =
      API_VERSION + "payment/customer/";
  static const String SIGN_UP_URI = API_VERSION + "customer/register";
  static const String SIGN_IN_URI = API_VERSION + "customer/login";
  static const String TOKEN = "hgv";
  static String USER_ID = "CUSTOMER1";
  static String FROM = "";
  static String To = "";
  static const String SEARCH_AVAILABLE_FLIGHT_URI =
      API_VERSION + "flight/searchFlights";
  static const String SECTOR_URI = API_VERSION + "sector";
  static const String PASSENGER_TICKET_URI =
      API_VERSION + "booking/customer/ticket/";
  static String BOOKING_ID = "";

  static String FLIGHT_DATE = "";
  static int NUMBER_OF_TRAVELLER = 1;
  static String FLIGHT_CODE = "";
  static String TICKET_CODE = "";
  static String DURATION = "";
  static String DEPARTURE_TIME = "";
  static String paymentMethod = "";
  static String paidVia = "";

  static int TotalTicketPrice = 10000;
  static int paidAmount = 0;

  static const String SAVE_BOOKING_DETAIL_URI = API_VERSION + "booking";
  static List<PassengerRequest> passengers = [];
  static addPassengers(PassengerRequest passengerRequest) {
    passengers.add(passengerRequest);
    print("PassengerListLength" + passengers.length.toString());
  }

  static List<PassengerRequest> passengerList() {
    return passengers;
  }
}
