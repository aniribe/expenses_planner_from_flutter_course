import 'package:flutter/material.dart';
import '../views/home/components/new_transaction.dart';
import '../views/home/home_viewmodel.dart';

PreferredSizeWidget appBar(BuildContext context, HomeViewModel model) {
  return AppBar(
    title: const Text('Personal Expenses'),
    actions: [
      IconButton(
        icon: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return NewTransaction(
                  onAddPressed: model.addTransactionHandler,
                  onDateChosen: model.onDateChosen,
                  selectedDate: model.selectedDate,
                );
              });
        },
      )
    ],
  );
}
