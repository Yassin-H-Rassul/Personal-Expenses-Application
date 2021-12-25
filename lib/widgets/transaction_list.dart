import 'package:flutter/material.dart';

import '../models/transaction.dart';

import './transaction_item.dart';

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
                    const SizedBox(
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
                return TransactionItem(
                    userTransaction: userTransactions[index],
                    deleteTx: deleteTx);
              },
            ),
    );
  }
}
