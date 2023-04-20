// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:better_life_customer/view_appointment/widgets/photo_viewer.dart';
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
        itemCount: list.length,
        itemBuilder: (context, index) {
          final diet = list[index];
          return MyNetworkImage(
            urlToImage: diet,
            onTap: () => Get.to<void>(
              () => PhotoViewer(
                url: diet,
              ),
            ),
          );
        },
      ),
    );
  }
}
