import 'package:better_life_customer/service_rating/service_rating.dart';
import 'package:better_life_customer/service_rating/widgets/service_rating_card.dart';
import 'package:flutter/material.dart';
import 'package:my_theme/my_theme.dart';
import 'package:widgets/widgets.dart';

/// {@template service_rating_body}
/// Body of the ServiceRatingPage.
///
/// Add what it does
/// {@endtemplate}
class ServiceRatingBody extends StatelessWidget {
  /// {@macro service_rating_body}
  const ServiceRatingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceRatingCubit, ServiceRatingState>(
      builder: (context, state) {
        final cubit = context.read<ServiceRatingCubit>();
        return Form(
          key: state.formKey,
          child: SingleChildScrollView(
            padding: kPadding,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderText(
                  text: 'Service Rating',
                  fontSize: 26,
                ),
                const Gap(20),
                Text(
                  'Rate your caretaker(s)',
                  style: context.textTheme.titleMedium,
                ),
                const Gap(10),
                ...state.caretakers.map(
                  (e) => ExpandedTile(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: kLightGrey),
                      borderRadius: kBorderRadius,
                    ),
                    title: Text(
                      e.fullname ?? '',
                      style: context.textTheme.titleMedium,
                    ),
                    subtitle: Text(e.mobile ?? ''),
                    trailing: const SizedBox.shrink(),
                    children: [
                      ServiceRatingCard(
                        caretaker: e,
                        onRatingChanged: cubit.onRatingChanged,
                        apptId: state.apptId,
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                MyElevatedButton(
                  text: 'Submit',
                  onPressed: context.read<ServiceRatingCubit>().submitRatings,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
