import 'package:better_life_customer/select_previous_caretaker/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widgets/widgets.dart';

/// {@template select_previous_caretaker_body}
/// Body of the SelectPreviousCaretakerPage.
///
/// Add what it does
/// {@endtemplate}
class SelectPreviousCaretakerBody extends StatelessWidget {
  /// {@macro select_previous_caretaker_body}
  const SelectPreviousCaretakerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectPreviousCaretakerCubit,
        SelectPreviousCaretakerState>(
      builder: (context, state) {
        final cubit = context.read<SelectPreviousCaretakerCubit>();
        return Padding(
          padding: kPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderText(text: 'Choose Caretaker'),
              const Gap(20),
              _container(
                child: Text(
                  'If you want to choose previous caretaker then choose one or two from this list',
                  textAlign: TextAlign.center,
                  style: context.textTheme.titleLarge?.copyWith(
                    color: context.theme.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Gap(40),
              _container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color.fromARGB(255, 239, 239, 239),
                  ),
                ),
                child: _buildCaretakers(),
              ),
              const Gap(20),
              MyElevatedButton(
                text: 'Proceed',
                onPressed: cubit.selectPreviousCaretakers,
              ),
              const Gap(20),
              MyElevatedButton(
                text: 'Skip',
                color: Colors.black,
                onPressed: () async => cubit.onSkip.call(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _container({required Widget child, BoxDecoration? decoration}) {
    return Container(
      padding: kPadding,
      decoration: decoration ??
          BoxDecoration(
            color: const Color(0xffF0F6FE),
            borderRadius: BorderRadius.circular(10),
          ),
      child: child,
    );
  }

  Widget _buildCaretakers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const HeaderText(text: 'Previous Caretakers'),
        const Gap(10),
        const MyDivider(),
        // const Gap(20),
        BlocBuilder<SelectPreviousCaretakerCubit, SelectPreviousCaretakerState>(
          builder: (context, state) {
            final list =
                context.read<SelectPreviousCaretakerCubit>().caretakers;
            return ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Gap(1),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final caretaker = list[index];
                return CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  value: state.selectedCaretakers.contains(caretaker.userid),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    caretaker.fullname ?? '',
                    // style: context.textTheme.titleLarge?.copyWith(
                    //   color: context.theme.primaryColor,
                    //   fontWeight: FontWeight.w600,
                    // ),
                  ),
                  onChanged: (value) {
                    context
                        .read<SelectPreviousCaretakerCubit>()
                        .selectCaretaker(caretaker.userid);
                  },
                );
              },
            );
          },
        ),
      ],
    );
  }
}
