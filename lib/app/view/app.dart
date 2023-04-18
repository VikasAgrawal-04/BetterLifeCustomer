import 'package:api/api.dart';
import 'package:better_life_customer/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:better_life_customer/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_theme/my_theme.dart';
import 'package:widgets/widgets.dart';
// import 'package:better_life_customer/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    required this.apiRepo,
    super.key,
  });
  final ApiRepo apiRepo;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiRepo>.value(
          value: apiRepo,
        ),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pearl Hotel',
            theme: MyTheme.light(context),
            home: BlocProvider<BottomNavCubit>(
              create: (context) => BottomNavCubit(),
              child: const SplashPage(),
            ),
          );
        },
      ),
    );
  }
}
