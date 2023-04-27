// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api/api.dart';
import 'package:better_life_customer/select_previous_caretaker/cubit/cubit.dart';
import 'package:better_life_customer/select_previous_caretaker/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template select_previous_caretaker_page}
/// A description for SelectPreviousCaretakerPage
/// {@endtemplate}
class SelectPreviousCaretakerPage extends StatelessWidget {
  /// {@macro select_previous_caretaker_page}
  const SelectPreviousCaretakerPage({
    required this.onSkip,
    required this.caretakers,
    required this.onProceed,
    super.key,
  });
  // final int appointmentId;
  final List<Caretaker> caretakers;
  final ValueChanged<AppointmentDetails?> onProceed;
  final VoidCallback onSkip;

  /// The static route for SelectPreviousCaretakerPage
  // static Route<dynamic> route() {
  //   return MaterialPageRoute<dynamic>(
  //     builder: (_) => const SelectPreviousCaretakerPage(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectPreviousCaretakerCubit(
        // appointmentId,
        caretakers,
        context.read<ApiRepo>(),
        onProceed,
        onSkip,
      ),
      child: const SelectPreviousCaretakerView(),
      // child: const Scaffold(
      //   appBar: MyAppBar(
      //     title: Text('Better-Life'),
      //   ),
      //   body: SelectPreviousCaretakerView(),
      // ),
    );
  }
}

/// {@template select_previous_caretaker_view}
/// Displays the Body of SelectPreviousCaretakerView
/// {@endtemplate}
class SelectPreviousCaretakerView extends StatelessWidget {
  /// {@macro select_previous_caretaker_view}
  const SelectPreviousCaretakerView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectPreviousCaretakerBody();
  }
}
