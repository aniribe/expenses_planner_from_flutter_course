import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({
    Key? key,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: FittedBox(
                      child: Text(
                          '\$ ${transactions[index].amount.toStringAsFixed(2)}')),
                ),
              ),
              title: Text(
                transactions[index].title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle:
                  Text(DateFormat.yMMMd().format(transactions[index].date)),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {},
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
