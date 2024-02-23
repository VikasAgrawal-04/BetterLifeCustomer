import 'package:api/api.dart';
import 'package:better_life_customer/constants/text_decorations.dart';
import 'package:better_life_customer/history/cubit/cubit.dart';
import 'package:better_life_customer/history/widgets/history_body.dart';
import 'package:better_life_customer/history/widgets/history_tile.dart';
import 'package:better_life_customer/widgets/coins_stream.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

/// {@template history_page}
/// A description for HistoryPage
/// {@endtemplate}
class HistoryPage extends StatelessWidget {
  /// {@macro history_page}
  const HistoryPage({super.key});

  /// The static route for HistoryPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HistoryPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit(context.read<ApiRepo>()),
      child: const HistoryView(),
    );
  }
}

/// {@template history_view}
/// Displays the Body of HistoryView
/// {@endtemplate}
class HistoryView extends StatelessWidget {
  /// {@macro history_view}
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const HistoryBody(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.primaryColor,
      leading: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.only(left: 8),
        child: GestureDetector(
          onTap: Get.back<void>,
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      title: const Text(
        'History',
        style: TextStyle(color: Colors.black),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: HistoryTile(
          title: const Text(
            'Current Points Balance',
            style: TextDecorations.tileTitle,
          ),
          subtitle: LiveCoinsCount(
            style: TextDecorations.tileSubtitle
                .copyWith(color: context.theme.primaryColor),
          ),
        ),
      ),
    );
  }
}
