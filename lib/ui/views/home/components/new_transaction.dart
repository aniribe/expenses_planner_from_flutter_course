import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../widgets/adaptive_button.dart';

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
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedDate == null
                        ? 'No Date Chosen!'
                        : DateFormat.yMd().format(selectedDate!),
                  ),
                  AdaptiveFlatButton(
                    text: 'Choose Date',
                    handler: () => getShowDatePicker(context, onDateChosen),
                  ),
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
      ),
    );
  }
}
