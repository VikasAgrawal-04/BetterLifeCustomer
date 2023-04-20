import 'package:flutter/material.dart';

import '../widgets.dart';
import 'my_loading_indicator.dart';

class MySliverList<T> extends StatelessWidget {
  final String title;
  final Status status;
  final String? emptyMessage;
  final String? errorMessage;

  final StatusWidgetBuilder? errorBuilder;
  final StatusWidgetBuilder? emptyBuilder;
  final StatusWidgetBuilder? loadingBuilder;
  final NullableIndexedWidgetBuilder itemBuilder;
  final List<T> list;

  const MySliverList({
    required this.title,
    required this.status,
    required this.itemBuilder,
    required this.list,
    this.errorBuilder,
    this.emptyBuilder,
    this.loadingBuilder,
    this.emptyMessage,
    this.errorMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _buildHeader(),
        _buildList(context),
      ],
    );
  }

  Widget _buildHeader() {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText(
            text: title,
          ),
          const Gap(20),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    Widget child = const SizedBox.shrink();
    switch (status) {
      case Status.initial:
      case Status.loading:
        child = loadingBuilder?.call(context) ??
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const Center(child: MyLoadingIndicator()),
            );
        break;
      case Status.empty:
        child = emptyBuilder?.call(context) ??
            EmptyScreen(message: emptyMessage ?? 'No data found');
        break;
      case Status.success:
        child = _onSuccess();
        break;
      case Status.error:
        child =
            errorBuilder?.call(context) ?? ErrorScreen(message: errorMessage);
        break;
    }

    if (!status.isSuccess) {
      return SliverToBoxAdapter(
        child: AnimatedSwitcher(
          duration: kDuration,
          child: child,
        ),
      );
    }

    return child;

    // return SliverList(
    //   delegate: SliverChildBuilderDelegate(
    //     (context, index) {
    //       return StatusHandler(
    //         status: status,
    //         onSuccess: ,
    //         errorBuilder: errorBuilder,
    //         emptyBuilder: emptyBuilder,
    //         loadingBuilder: loadingBuilder,
    //       );
    //     },
    //   ),
    // );
  }

  SliverList _onSuccess() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: list.length,
        itemBuilder,
      ),
    );
  }
}
