import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;

  TransactionList(this.userTransactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      child: userTransactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  children: [
                    Text('No transactions added yet!',
                        style: Theme.of(context).textTheme.subtitle1),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.8,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                );
              },
            )
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: FittedBox(
                          child: Text('\$${userTransactions[index].amount}')),
                      radius: 30,
                    ),
                    title: Text(
                      userTransactions[index].title,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(userTransactions[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 460
                        ? FlatButton.icon(
                            onPressed: () =>
                                deleteTx(userTransactions[index].id),
                            icon: Icon(Icons.delete),
                            label: Text('delete'),
                            textColor: Theme.of(context).errorColor,
                          )
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () =>
                                deleteTx(userTransactions[index].id),
                          ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         padding: EdgeInsets.all(10),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).primaryColorDark,
                //             width: 2,
                //           ),
                //         ),
                //         child: Text(
                //           '\$${userTransactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             color: Theme.of(context).primaryColor,
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             userTransactions[index].title,
                //             style: Theme.of(context).textTheme.subtitle1,
                //           ),
                //           Text(
                //             DateFormat.yMMMd()
                //                 .format(userTransactions[index].date),
                //             style: TextStyle(
                //               color: Colors.grey,
                //               fontSize: 14,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
    );
  }
}
