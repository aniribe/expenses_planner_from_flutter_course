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
        body: Column(
          children: [
            const Card(
              elevation: 5,
              child: Text('CHILD'),
            ),
            Column(
              children: model.transactions
                  .map(
                    (transaction) => Card(
                      child: Row(
                        children: [
                          Container(
                            child: Text(transaction.amount.toString()),
                          ),
                          Column(
                            children: [
                              Text(transaction.title),
                              Text(transaction.title),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
