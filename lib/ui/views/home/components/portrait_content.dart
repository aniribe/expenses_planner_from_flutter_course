import 'package:expenses_planner/ui/views/home/components/transaction_list.dart';
import 'package:flutter/cupertino.dart';
import '../../../widgets/chart.dart';
import '../../../widgets/my_app_bar.dart';
import '../home_viewmodel.dart';

List<Widget> buildPortraitContent(BuildContext context, HomeViewModel model) {
  return [
    Container(
      height: (MediaQuery.of(context).size.height -
              appBar(context, model).preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.3,
      child: Chart(recentTransactions: model.recentTransaction),
    ),
    Container(
        height: (MediaQuery.of(context).size.height -
                appBar(context, model).preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.7,
        child: TransactionList(transactions: model.transactions))
  ];
}
