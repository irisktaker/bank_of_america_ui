import 'package:bank_of_america_ui/screens/branches_screen.dart';
import 'package:bank_of_america_ui/screens/constacts_screen.dart';
import 'package:bank_of_america_ui/screens/dashboard/dashboard.dart';
import 'package:bank_of_america_ui/screens/funds_transfer_screen.dart';
import 'package:bank_of_america_ui/screens/messages_screen.dart';
import 'package:bank_of_america_ui/screens/settings_screen.dart';
import 'package:bank_of_america_ui/screens/utility_bills/utility_bills_screen.dart';
import 'package:bank_of_america_ui/screens/wallet/wallet_toggle_screens.dart';
import 'package:flutter/material.dart';

import '/models/drawer_list.dart';
import '/models/view_transactions.dart';
import '/models/saving_history_of_transactions_data.dart';
import '/models/credit_card_history_of_transactions_data.dart';

class Singleton {
  Singleton();
  static final Singleton instance = Singleton();

  List<CDHistoryOfTransactionsData> creditHistoryTransaction = [
    CDHistoryOfTransactionsData(
      logo: "assets/images/zara.png",
      date: "29 Sep.21",
      brandName: "ZARA Mall",
      amountValue: 49.99,
      performance: "assets/icons/down-arrow.png",
    ),
    CDHistoryOfTransactionsData(
      logo: "assets/images/rewe.png",
      date: "29 Sep.21",
      brandName: "REWE N23",
      amountValue: 76.45,
      performance: "assets/icons/down-arrow.png",
    ),
    CDHistoryOfTransactionsData(
      logo: "assets/images/nike.png",
      date: "29 Sep.21",
      brandName: "Nile Town",
      amountValue: 109.99,
      performance: "assets/icons/down-arrow.png",
    ),
    CDHistoryOfTransactionsData(
      logo: "assets/images/carrefour.png",
      date: "28 Sep.21",
      brandName: "Carrefour",
      amountValue: 15.33,
      performance: "assets/icons/down-arrow.png",
    ),
  ];

  List<SavingHistoryOfTransactionsData> savingHistoryTransaction = [
    SavingHistoryOfTransactionsData(
      date: "29 Sep. 21",
      brandName: "Salary DDX Office",
      amountValue: 5045.99,
      performance: "assets/icons/upward-arrow.png",
    ),
    SavingHistoryOfTransactionsData(
      date: "29 Sep. 21",
      brandName: "Office Deposit Refund",
      amountValue: 109.99,
      performance: "assets/icons/upward-arrow.png",
    ),
    SavingHistoryOfTransactionsData(
      date: "26 Sep. 21",
      brandName: "Car Payment",
      amountValue: 499.99,
      performance: "assets/icons/down-arrow.png",
    ),
    SavingHistoryOfTransactionsData(
      date: "24 Sep. 21",
      brandName: "Cash Desk Deposit",
      amountValue: 300.00,
      performance: "assets/icons/upward-arrow.png",
    ),
  ];

  List<ViewTransactions> viewTransactionHistory = [
    ViewTransactions(
      date: "29 Sep. 21",
      brandName: "ZARA Store Mall Sofia",
      amountValue: 45.99,
      performance: "assets/icons/down-arrow.png",
    ),
    ViewTransactions(
      date: "29 Sep. 21",
      brandName: "REWE Store",
      amountValue: 109.99,
      performance: "assets/icons/down-arrow.png",
    ),
    ViewTransactions(
      date: "26 Sep. 21",
      brandName: "NIKE Factory Store",
      amountValue: 499.99,
      performance: "assets/icons/down-arrow.png",
    ),
    ViewTransactions(
      date: "24 Sep. 21",
      brandName: "Cash Desk Deposit",
      amountValue: 300.00,
      performance: "assets/icons/down-arrow.png",
    ),
    ViewTransactions(
      date: "24 Sep. 21",
      brandName: "Cash Desk Deposit",
      amountValue: 300.00,
      performance: "assets/icons/upward-arrow.png",
    ),
    ViewTransactions(
      date: "24 Sep. 21",
      brandName: "Cash Desk Deposit",
      amountValue: 300.00,
      performance: "assets/icons/down-arrow.png",
    ),
    ViewTransactions(
      date: "24 Sep. 21",
      brandName: "Cash Desk Deposit",
      amountValue: 300.00,
      performance: "assets/icons/upward-arrow.png",
    ),
    ViewTransactions(
      date: "24 Sep. 21",
      brandName: "Cash Desk Deposit",
      amountValue: 300.00,
      performance: "assets/icons/down-arrow.png",
    ),
    ViewTransactions(
      date: "24 Sep. 21",
      brandName: "Cash Desk Deposit",
      amountValue: 300.00,
      performance: "assets/icons/down-arrow.png",
    ),
    ViewTransactions(
      date: "24 Sep. 21",
      brandName: "Cash Desk Deposit",
      amountValue: 300.00,
      performance: "assets/icons/down-arrow.png",
    ),
    ViewTransactions(
      date: "24 Sep. 21",
      brandName: "Cash Desk Deposit",
      amountValue: 300.00,
      performance: "assets/icons/upward-arrow.png",
    ),
  ];

  List<DrawerList> drawerList = [
    DrawerList(
      icon: "assets/icons/wallet.png", 
      text: "dashboard",
      bgColor: Colors.transparent,
      isSelected: false,
      nav: const DashBoardScreen(),
    ),
    DrawerList(
      icon: "assets/icons/wallet2.png", 
      text: "wallet",
      bgColor: Colors.transparent,
      isSelected: false,
      nav: const WalletToggleScreens(),
    ),
    DrawerList(
      icon: "assets/icons/messages.png", 
      text: "messages",
      bgColor: Colors.transparent,
      isSelected: false,
      nav: const MessagesScreen(),
    ),
    DrawerList(
      icon: "assets/icons/bills.png", 
      text: "utility bills",
      bgColor: Colors.transparent,
      isSelected: false,
      nav: const UtilityBillsScreen(),
    ),
    DrawerList(
      icon: "assets/icons/funds.png", 
      text: "funds transfer",
      bgColor: Colors.transparent,
      isSelected: false,
      nav: const FundsTransferScreen(),
    ),
    DrawerList(
      icon: "assets/icons/branches.png", 
      text: "branches",
      bgColor: Colors.transparent,
      isSelected: false,
      nav: const BranchesScreen(),
    ),
    DrawerList(
      icon: "assets/icons/settings.png", 
      text: "settings",
      bgColor: Colors.transparent,
      isSelected: false,
      nav: const SettingsScreen(),
    ),
    DrawerList(
      icon: "assets/icons/contact.png", 
      text: "contact",
      bgColor: Colors.transparent,
      isSelected: false,
      nav: const ContactsScreen(),
    ),
  ];
}
