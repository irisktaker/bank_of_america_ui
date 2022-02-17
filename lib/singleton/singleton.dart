import '/models/history_of_transactions_data.dart';

class Singleton {
  Singleton();
  static final Singleton instance = Singleton();

  List<HistoryOfTransactionsData> historyTransaction = [
    HistoryOfTransactionsData(
      logo: "assets/images/zara.png",
      date: "29 Sep.21",
      brandName: "ZARA Mall",
      amountValue: 49.99,
      performance: "assets/icons/down-arrow.png",
    ),
    HistoryOfTransactionsData(
      logo: "assets/images/rewe.png",
      date: "29 Sep.21",
      brandName: "REWE N23",
      amountValue: 76.45,
      performance: "assets/icons/down-arrow.png",
    ),
    HistoryOfTransactionsData(
      logo: "assets/images/nike.png",
      date: "29 Sep.21",
      brandName: "Nile Town",
      amountValue: 109.99,
      performance: "assets/icons/down-arrow.png",
    ),
    HistoryOfTransactionsData(
      logo: "assets/images/carrefour.png",
      date: "28 Sep.21",
      brandName: "Carrefour",
      amountValue: 15.33,
      performance: "assets/icons/down-arrow.png",
    ),
    HistoryOfTransactionsData(
      logo: "assets/images/zara.png",
      date: "29 Sep.21",
      brandName: "ZARA Mall",
      amountValue: 49.99,
      performance: "assets/icons/upward-arrow.png",
    ),
  ];
}
