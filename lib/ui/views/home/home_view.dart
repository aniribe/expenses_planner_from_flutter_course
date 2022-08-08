import 'package:expenses_planner/ui/views/home/components/new_transaction.dart';
import 'package:expenses_planner/ui/widgets/chart.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'components/transaction_list.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Flutter App'),
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
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Chart(recentTransactions: model.recentTransaction),
              TransactionList(transactions: model.transactions),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
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
        ),
      ),
    );
  }
}
