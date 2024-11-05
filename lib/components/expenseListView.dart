import 'package:assignment5/components/expenseCard.dart';
import 'package:assignment5/models/expensesitems.dart';
import 'package:flutter/material.dart';

class ExpenseListView extends StatefulWidget {
  ExpenseListView({super.key, required this.expensesList});

  final List<Expensesitems> expensesList;

  @override
  State<ExpenseListView> createState() => _ExpenseListViewState();
}

class _ExpenseListViewState extends State<ExpenseListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.expensesList.length,
      itemBuilder: (_, i) => Dismissible(
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) => removeItem(widget.expensesList[i]),
        background: Container(
          color: Colors.red.shade400,
          child: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Icon(Icons.delete),
                SizedBox(width: 10),
                Text("Delete")
              ],
            ),
          ),
        ),
        key: ValueKey(i),
        child: expenseCard(i: widget.expensesList[i]),
      ),
    );
  }

  removeItem(Expensesitems item) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    var itemIndex = widget.expensesList.indexOf(item);

    setState(() {
      widget.expensesList.remove(item);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${item.name} is removed"),
          action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                widget.expensesList.insert(itemIndex, item);
              });
            },
          ),
        ),
      );
    });
  }
}
