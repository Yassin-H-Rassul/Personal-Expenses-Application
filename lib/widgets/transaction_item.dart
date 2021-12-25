import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.userTransaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          child: FittedBox(child: Text('\$${userTransaction.amount}')),
          radius: 30,
        ),
        title: Text(
          userTransaction.title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(userTransaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => deleteTx(userTransaction.id),
                icon: Icon(Icons.delete),
                label: Text('delete'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => deleteTx(userTransaction.id),
              ),
      ),
    );
  }
}
