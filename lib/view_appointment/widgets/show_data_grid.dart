import 'package:better_life_customer/view_appointment/cubit/view_appointment_cubit.dart';
import 'package:better_life_customer/view_appointment/widgets/photo_viewer_base64.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';
import 'package:widgets/widgets/my_loading_indicator.dart';

class ShowDataGrid extends StatelessWidget {
  const ShowDataGrid({
    required this.heading,
    required this.cubit,
    super.key,
  });

  final String heading;
  final ViewAppointmentCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text(heading),
      ),
      body: FutureBuilder(
        future: heading == 'Diets'
            ? cubit.fetchDiets()
            : heading == 'Notes'
                ? cubit.fetchNotes()
                : heading == 'Tests'
                    ? cubit.fetchTests()
                    : cubit.fetchPresciptions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MyLoadingIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            final list = snapshot.data;
            print('List ${list?.length}');
            return GridView.builder(
              padding: kPadding,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: list?.length,
              itemBuilder: (context, index) {
                final diet = list![index];
                return Base64Img(
                  urlToImage: diet,
                  onTap: () => Get.to<void>(
                    () => PhotoViewerBase64(
                      url: diet,
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: ErrorScreen());
          }
        },
      ),
    );
  }
}
