import 'package:expenses_planner/config/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../model/transaction.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  String? titleInput;
  String? amountInput;
  DateTime? selectedDate;

  bool showChart = false;

  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 25.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Bread',
      amount: 0.90,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Rice',
      amount: 1.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Coffee',
      amount: 3.40,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get recentTransaction {
    return transactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList();
  }

  void setTitle(String value) => titleInput = value;

  void setAmount(String value) => amountInput = value;

  void addTransactionHandler(String title, String amount) {
    addNewTransaction(title, amount);
    redirectBack();
  }

  void addNewTransaction(String title, String amount) {
    final newTransaction = Transaction(
        title: title,
        amount: double.parse(amount),
        id: DateTime.now().toString(),
        date: selectedDate as DateTime);

    transactions.add(newTransaction);
    notifyListeners();
  }

  void onDateChosen(DateTime date) {
    selectedDate = date;

    notifyListeners();
  }

  void onSwitchChanged(bool value) {
    showChart = value;
    notifyListeners();
  }

  Future<void> redirectBack() async => _navigationService.popRepeated(1);
}
