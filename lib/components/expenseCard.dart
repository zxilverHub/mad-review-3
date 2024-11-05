import 'package:assignment5/models/expensesitems.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class expenseCard extends StatelessWidget {
  expenseCard({super.key, required this.i});

  Expensesitems i;

  var currencyFormat = NumberFormat.currency(
    decimalDigits: 2,
    symbol: "\$",
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  i.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(DateFormat.yMMMd().format(i.date)),
              ],
            ),
            Text(currencyFormat.format(i.price))
          ],
        ),
      ),
    );
  }
}
