import 'package:assignment5/components/expenseEntry.dart';
import 'package:assignment5/components/expenseListView.dart';
import 'package:assignment5/models/expensesitems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyExpenses extends StatefulWidget {
  MyExpenses({super.key});

  List<Expensesitems> expensesList = [
    Expensesitems(
      name: "Food",
      price: 200,
      date: DateTime.now(),
    ),
    Expensesitems(
      name: "Paper",
      price: 60,
      date: DateTime.now(),
    ),
  ];

  @override
  State<MyExpenses> createState() => _MyExpensesState();
}

class _MyExpensesState extends State<MyExpenses> {
  void addNewItem({required Expensesitems item}) {
    setState(() {
      widget.expensesList.add(item);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Item is added")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My expenses"),
          actions: [
            IconButton(
              onPressed: () => openEntry(),
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ExpenseListView(
            expensesList: widget.expensesList,
          ),

          // child: Column(
          //   children: [
          //     Expanded(
          //       child: SingleChildScrollView(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.stretch,
          //           children: widget.expensesList
          // //               .map(
          //                 (i) => Dismissible(
          //                   direction: DismissDirection.startToEnd,
          //                   onDismissed: (direction) => removeItem(i),
          //                   background: Container(
          //                     color: Colors.red.shade400,
          //                     child: const Padding(
          //                       padding: EdgeInsets.only(left: 10),
          //                       child: Row(
          //                         children: [
          //                           Icon(Icons.delete),
          //                           SizedBox(width: 10),
          //                           Text("Delete")
          //                         ],
          //                       ),
          //                     ),
          //                   ),
          //                   key: ValueKey(i),
          //                   child: expenseCard(i: i),
          //                 ),
          //               )
          //               .toList(),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ),
      ),
    );
  }

  openEntry() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        var keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        print(keyboardHeight);

        return Padding(
          padding: EdgeInsets.only(bottom: keyboardHeight),
          child: expenseEntry(addNewItem: addNewItem),
        );
      },
    );
  }
}
