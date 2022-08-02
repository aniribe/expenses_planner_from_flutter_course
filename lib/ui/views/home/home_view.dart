import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Card(
              elevation: 5,
              child: Text('CHILD'),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    const TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Add Transaction',
                        style: TextStyle(color: Colors.purple),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: model.transactions
                  .map(
                    (transaction) => Card(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.purple, width: 2)),
                            child: Text(
                              '\$ ${transaction.amount.toString()}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                transaction.title,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(DateFormat.yMMMd().format(transaction.date)),
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
