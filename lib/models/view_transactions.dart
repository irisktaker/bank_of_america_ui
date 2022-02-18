class ViewTransactions {
  String date;
  String brandName;
  double amountValue;
  String currency;
  String performance;

  ViewTransactions({
    required this.date,
    required this.brandName,
    required this.amountValue,
    this.currency = "\$",
    required this.performance,
  });
}