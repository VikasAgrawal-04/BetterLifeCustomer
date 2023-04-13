import 'package:api/api.dart';
import 'package:better_life_customer/home/home.dart';
import 'package:better_life_customer/home/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

/// {@template home_page}
/// A description for HomePage
/// {@endtemplate}
class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  /// The static route for HomePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context.read<ApiRepo>()),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        backgroundColor: context.theme.primaryColor,
        body: const HomeView(),
      ),
    );
  }
}

/// {@template home_view}
/// Displays the Body of HomeView
/// {@endtemplate}
final key = GlobalKey<ScaffoldState>();

class HomeView extends StatelessWidget {
  /// {@macro home_view}
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: const MyDrawer(),
      appBar: MyAppBar(
        title: const Text('Better-Life'),
        leading: IconButton(
          onPressed: () {
            if (key.currentState?.isDrawerOpen ?? false) {
              key.currentState?.closeDrawer();
            } else {
              key.currentState?.openDrawer();
            }
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      body: const HomeBody(),
    );
  }
}
