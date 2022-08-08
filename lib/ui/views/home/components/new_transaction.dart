import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;

  final void Function(String, String) onAddPressed;
  final void Function(DateTime) onDateChosen;

  NewTransaction({
    Key? key,
    required this.onAddPressed,
    required this.onDateChosen,
    this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              // onChanged: onTitleChanged,
            ),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              // onChanged: onAmountChanged,
            ),
            Row(
              children: [
                Text(
                  selectedDate == null
                      ? 'No Date Chosen!'
                      : DateFormat.yMd().format(selectedDate!),
                ),
                TextButton(
                  onPressed: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2019),
                            lastDate: DateTime.now())
                        .then((pickedDate) {
                      print('SEKECTED: $selectedDate');
                      if (pickedDate == null) {
                        return;
                      }
                      onDateChosen(pickedDate);
                    });
                  },
                  child: const Text('Choose Date'),
                )
              ],
            ),
            TextButton(
              onPressed: () =>
                  onAddPressed(titleController.text, amountController.text),
              child: const Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
            )
          ],
        ),
      ),
    );
  }
}
