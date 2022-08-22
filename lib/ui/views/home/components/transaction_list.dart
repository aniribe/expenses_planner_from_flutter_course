import 'package:flutter/material.dart';
import '../../../../model/transaction.dart';
import '../../../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TransactionItem(transaction: transactions[index]);
      },
      itemCount: transactions.length,
    );
  }
}
