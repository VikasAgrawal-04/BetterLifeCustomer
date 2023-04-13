import 'package:api/api.dart';
import 'package:better_life_customer/register/cubit/cubit.dart';
import 'package:better_life_customer/register/widgets/register_body.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

/// {@template register_page}
/// A description for RegisterPage
/// {@endtemplate}
class RegisterPage extends StatelessWidget {
  /// {@macro register_page}
  const RegisterPage({super.key});

  /// The static route for RegisterPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const RegisterPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(context.read<ApiRepo>()),
      child: const Scaffold(
        appBar: MyAppBar(
          leading: SizedBox.shrink(),
        ),
        body: RegisterView(),
      ),
    );
  }
}

/// {@template register_view}
/// Displays the Body of RegisterView
/// {@endtemplate}
class RegisterView extends StatelessWidget {
  /// {@macro register_view}
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return const RegisterBody();
  }
}
