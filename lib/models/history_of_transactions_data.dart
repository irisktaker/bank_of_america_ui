class HistoryOfTransactionsData {
  String logo;
  String date;
  String brandName;
  double amountValue;
  String currency;
  String performance;

  HistoryOfTransactionsData({
    required this.logo,
    required this.date,
    required this.brandName,
    required this.amountValue,
    this.currency = '\$',
    required this.performance,
  });
}