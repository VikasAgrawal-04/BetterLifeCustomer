import 'package:api/api.dart';
import 'package:better_life_customer/constants/text_decorations.dart';
import 'package:better_life_customer/history/cubit/cubit.dart';
import 'package:better_life_customer/history/widgets/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';
import 'package:widgets/widgets/my_loading_indicator.dart';

/// {@template history_body}
/// Body of the HistoryPage.
///
/// Add what it does
/// {@endtemplate}
class HistoryBody extends StatelessWidget {
  /// {@macro history_body}
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.initial:
          case Status.loading:
            return const MyLoadingIndicator();
          case Status.success:
            return _showTransaction(state.transactions);
          case Status.error:
            return const Center(child: ErrorScreen());

          case Status.empty:
            return const EmptyScreen(
              message: 'No transactions available',
            );
        }
      },
    );
  }

  ListView _showTransaction(List<CustomerReward> transactions) {
    return ListView.builder(
      itemCount: transactions.length,
      itemBuilder: (context, index) => _tile(context, transactions[index]),
    );
  }

  HistoryTile _tile(BuildContext context, CustomerReward transaction) {
    return HistoryTile(
      title: Text(
        transaction.transactionTitle ?? '',
        style: TextDecorations.tileTitle,
      ),
      subtitle: _getTransactionTpe(transaction, context),
      subSubtitle: Text(
        '${transaction.transdate ?? ''} ${transaction.transtime ?? ''}',
        style: context.textTheme.bodySmall,
      ),
    );
  }

  Text _getTransactionTpe(CustomerReward transaction, BuildContext context) {
    final isSale = transaction.transactiontype == 'S';
    Color color = Colors.blue;
    var text = '';

    if (isSale) {
      color = Colors.blue;
      text = '+${transaction.salebonuspoints?.toString() ?? ''}';
    } else {
      color = Colors.red;
      text = '-${transaction.rewardpointsused?.toString() ?? ''}';
    }

    return Text(
      text,
      style: TextDecorations.tileSubtitle.copyWith(
        color: color,
      ),
    );
  }
}
