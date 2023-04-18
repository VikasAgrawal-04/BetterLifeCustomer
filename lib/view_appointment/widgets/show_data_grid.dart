// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class ShowDataGrid extends StatelessWidget {
  const ShowDataGrid({
    required this.heading,
    required this.list,
    super.key,
  });

  final String heading;
  final List<String> list;

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return const EmptyScreen();

    return Scaffold(
      appBar: MyAppBar(
        title: Text(heading),
      ),
      body: GridView.builder(
        padding: kPadding,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        // separatorBuilder: (context, index) => const Gap(10),
        // shrinkWrap: false,
        itemCount: list.length,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final diet = list[index];
          return MyNetworkImage(
            urlToImage: diet,
            // height: 100,
            // width: 1.sw,
          );
        },
      ),
    );
  }
}
