class SavingHistoryOfTransactionsData {
  String date;
  String brandName;
  double amountValue;
  String currency;
  String performance;

  SavingHistoryOfTransactionsData({
    required this.date,
    required this.brandName,
    required this.amountValue,
    this.currency = '\$',
    required this.performance,
  });
}