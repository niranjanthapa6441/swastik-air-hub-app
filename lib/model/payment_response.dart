class PaymentReponse {
  String paymentMethod;
  String paymentStatus;
  int paidAmount;

  PaymentReponse(
      {required this.paymentMethod,
      required this.paymentStatus,
      required this.paidAmount});
}
