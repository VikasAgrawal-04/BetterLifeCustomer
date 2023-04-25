import 'package:api/api.dart';
import 'package:better_life_customer/service_rating/service_rating.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

/// {@template service_rating_page}
/// A description for ServiceRatingPage
/// {@endtemplate}
class ServiceRatingPage extends StatelessWidget {
  /// {@macro service_rating_page}
  const ServiceRatingPage({
    required this.caretakers,
    required this.apptId,
    super.key,
  });
  final int apptId;
  final List<Caretaker> caretakers;

  /// The static route for ServiceRatingPage
  // static Route<dynamic> route() {
  //   return MaterialPageRoute<dynamic>(
  //     builder: (_) => const ServiceRatingPage(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ServiceRatingCubit(
        api: context.read<ApiRepo>(),
        apptId: apptId,
        caretakers: caretakers,
      ),
      child: const Scaffold(
        appBar: MyAppBar(),
        body: ServiceRatingView(),
      ),
    );
  }
}

/// {@template service_rating_view}
/// Displays the Body of ServiceRatingView
/// {@endtemplate}
class ServiceRatingView extends StatelessWidget {
  /// {@macro service_rating_view}
  const ServiceRatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ServiceRatingBody();
  }
}
