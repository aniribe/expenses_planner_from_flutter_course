import 'package:expenses_planner/ui/views/home/components/transaction_list.dart';
import 'package:flutter/material.dart';
import '../../../widgets/chart.dart';
import '../../../widgets/my_app_bar.dart';
import '../home_viewmodel.dart';

List<Widget> buildLanscapeContent(BuildContext context, HomeViewModel model) {
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Show chart',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Switch.adaptive(
            activeColor: Theme.of(context).accentColor,
            value: model.showChart,
            onChanged: (value) => model.onSwitchChanged(value)),
      ],
    ),
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
            child: TransactionList(transactions: model.transactions))
  ];
}
