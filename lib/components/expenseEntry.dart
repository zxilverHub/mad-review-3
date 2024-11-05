import 'package:assignment5/models/expensesitems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class expenseEntry extends StatefulWidget {
  expenseEntry({super.key, required this.addNewItem});

  final Function addNewItem;

  @override
  State<expenseEntry> createState() => _expenseEntryState();
}

class _expenseEntryState extends State<expenseEntry> {
  var dateController = TextEditingController();
  var priceController = TextEditingController();
  var itemController = TextEditingController();

  DateTime? addedDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: itemController,
              decoration: InputDecoration(
                label: Text("Item name"),
                hintText: "Item name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Price"),
                hintText: "Price",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: dateController,
              readOnly: true,
              decoration: InputDecoration(
                label: Text("Date"),
                hintText: "Date",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () => selecDate(),
                  icon: Icon(Icons.calendar_month),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () => addItem(),
                    child: Text("Add item"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void selecDate() async {
    var date = await showDatePicker(
      context: context,
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );

    setState(() {
      addedDate = date;
      dateController.text = DateFormat.yMMMd().format(date!);
    });
  }

  addItem() {
    widget.addNewItem(
      item: Expensesitems(
        name: itemController.text,
        price: double.parse(priceController.text),
        date: addedDate!,
      ),
    );

    Navigator.of(context).pop();
  }
}
