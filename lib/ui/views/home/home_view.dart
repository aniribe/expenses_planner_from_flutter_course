import 'package:expenses_planner/ui/views/home/components/user_transactions.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: const Text('Flutter App')),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Card(
                elevation: 5,
                child: Text('CHILD'),
              ),
              UserTransactions(
                transactions: model.transactions,
                onAddPressed: model.addNewTransaction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
