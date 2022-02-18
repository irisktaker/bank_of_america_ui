class CDHistoryOfTransactionsData {
  String logo;
  String date;
  String brandName;
  double amountValue;
  String currency;
  String performance;

  CDHistoryOfTransactionsData({
    required this.logo,
    required this.date,
    required this.brandName,
    required this.amountValue,
    this.currency = '\$',
    required this.performance,
  });
}