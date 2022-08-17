import 'dart:io';
import 'package:expenses_planner/ui/views/home/components/new_transaction.dart';
import 'package:expenses_planner/ui/widgets/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../util/ui_helpers.dart';
import 'components/transaction_list.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: appBarIos(context, model),
              child: getBody(context, model),
            )
          : Scaffold(
              appBar: appBar(context, model),
              body: getBody(context, model),
              floatingActionButton: Platform.isIOS
                  ? Container()
                  : FloatingActionButton(
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

void onNewTransactionButtonPressed(BuildContext context, HomeViewModel model) {
  showModalBottomSheet(
      context: context,
      builder: (_) {
        return NewTransaction(
          onAddPressed: model.addTransactionHandler,
          onDateChosen: model.onDateChosen,
          selectedDate: model.selectedDate,
        );
      });
}

ObstructingPreferredSizeWidget appBarIos(
    BuildContext context, HomeViewModel model) {
  return CupertinoNavigationBar(
    middle: const Text('Personal Expenses'),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          child: const Icon(CupertinoIcons.add),
          onTap: () => onNewTransactionButtonPressed(context, model),
        )
      ],
    ),
  );
}

Widget getBody(BuildContext context, HomeViewModel model) {
  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isLandscape(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Show chart'),
                Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: model.showChart,
                    onChanged: (value) => model.onSwitchChanged(value)),
              ],
            ),
          if (!isLandscape(context))
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar(context, model).preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: Chart(recentTransactions: model.recentTransaction),
            ),
          if (!isLandscape(context))
            Container(
                height: (MediaQuery.of(context).size.height -
                        appBar(context, model).preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.7,
                child: TransactionList(transactions: model.transactions)),
          if (isLandscape(context))
            model.showChart
                ? Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar(context, model).preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                    child: Chart(recentTransactions: model.recentTransaction),
                  )
                : Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar(context, model).preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                    child: TransactionList(transactions: model.transactions)),
        ],
      ),
    ),
  );
}
