import 'package:flutter/cupertino.dart';
import '../views/home/home_view.dart';
import '../views/home/home_viewmodel.dart';

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
