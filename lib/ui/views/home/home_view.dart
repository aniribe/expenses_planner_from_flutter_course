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
        appBar: appBar(context, model),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar(context, model).preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.4,
                child: Chart(recentTransactions: model.recentTransaction),
              ),
              Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar(context, model).preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.6,
                  child: TransactionList(transactions: model.transactions)),
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

AppBar appBar(BuildContext context, HomeViewModel model) {
  return AppBar(
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
  );
}
