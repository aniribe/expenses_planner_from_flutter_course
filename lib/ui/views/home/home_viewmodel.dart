import 'package:stacked/stacked.dart';
import '../../../model/transaction.dart';

class HomeViewModel extends BaseViewModel {
  List<Transaction> transactions = [
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
}
