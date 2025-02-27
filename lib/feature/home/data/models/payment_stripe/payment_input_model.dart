class PaymentInputModel {
  final String ccurency;
  final String customerId;
  final num amount;

  PaymentInputModel(
      {required this.ccurency, required this.customerId, required this.amount});
  // toJson() => {
  //   'ccurency':ccurency,
  //   'customerId':customerId,
  //   'amount':amount*100,
  // };
}
