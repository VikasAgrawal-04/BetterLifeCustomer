import 'package:api/api.dart';
import 'package:better_life_customer/login/cubit/cubit.dart';
import 'package:better_life_customer/login/widgets/login_body.dart';
import 'package:flutter/material.dart';

/// {@template login_page}
/// A description for LoginPage
/// {@endtemplate}
class LoginPage extends StatelessWidget {
  /// {@macro login_page}
  const LoginPage({super.key});

  /// The static route for LoginPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(context.read<ApiRepo>()),
      child: const Scaffold(
        body: LoginView(),
      ),
    );
  }
}

/// {@template login_view}
/// Displays the Body of LoginView
/// {@endtemplate}
class LoginView extends StatelessWidget {
  /// {@macro login_view}
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginBody();
  }
}
