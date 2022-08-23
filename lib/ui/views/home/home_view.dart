import 'dart:io';
import 'package:expenses_planner/ui/views/home/components/new_transaction.dart';
import 'package:expenses_planner/ui/widgets/chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../util/ui_helpers.dart';
import '../../widgets/app_bar_ios.dart';
import '../../widgets/my_app_bar.dart';
import 'components/lanscape_content.dart';
import 'components/portrait_content.dart';
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

Widget getBody(BuildContext context, HomeViewModel model) {
  return SafeArea(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isLandscape(context)) ...buildLanscapeContent(context, model),
          if (!isLandscape(context)) ...buildPortraitContent(context, model),
        ],
      ),
    ),
  );
}
