import 'package:api/api.dart';
import 'package:better_life_customer/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:better_life_customer/location/cubit/location_cubit.dart';
import 'package:better_life_customer/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_theme/my_theme.dart';
import 'package:widgets/widgets.dart';

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
            title: 'Better Life',
            theme: MyTheme.light(context),
            home: MultiBlocProvider(
              providers: [
                BlocProvider<BottomNavCubit>(
                  create: (context) => BottomNavCubit(),
                ),
                BlocProvider(
                  create: (context) => LocationCubit(),
                  lazy: false,
                ),
              ],
              child: const SplashPage(),
            ),
          );
        },
      ),
    );
  }
}
