import 'package:stacked/stacked.dart';
import '../../../model/transaction.dart';

class HomeViewModel extends BaseViewModel {
  String? titleInput;
  String? amountInput;

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
  ];

  void setTitle(String value) => titleInput = value;

  void setAmount(String value) => amountInput = value;

  void addNewTransaction(String title, String amount) {
    final newTransaction = Transaction(
        title: title,
        amount: double.parse(amount),
        id: DateTime.now().toString(),
        date: DateTime.now());

    transactions.add(newTransaction);
    notifyListeners();
  }
}
