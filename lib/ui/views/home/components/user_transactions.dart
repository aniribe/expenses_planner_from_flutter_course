import 'package:expenses_planner/ui/views/home/components/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import '../../../../model/transaction.dart';
import 'new_transaction.dart';

class UserTransactions extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String, String) onAddPressed;

  const UserTransactions({
    Key? key,
    required this.transactions,
    required this.onAddPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(
          onAddPressed: onAddPressed,
        ),
      ],
    );
  }
}
