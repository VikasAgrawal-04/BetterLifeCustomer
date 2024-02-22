import 'package:api/api.dart';
import 'package:better_life_customer/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:better_life_customer/location/cubit/location_cubit.dart';
import 'package:better_life_customer/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:my_theme/my_theme.dart';
import 'package:widgets/widgets.dart';

class App extends StatelessWidget {
  const App({
    required this.apiRepo,
    required this.googleApiRepo,
    super.key,
  });
  final ApiRepo apiRepo;
  final GoogleApiRepo googleApiRepo;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiRepo>.value(
          value: apiRepo,
        ),
        RepositoryProvider<GoogleApiRepo>.value(
          value: googleApiRepo,
        ),
        BlocProvider(
          create: (context) => LocationCubit(repo: googleApiRepo),
          lazy: false,
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
            builder: EasyLoading.init(),
            localizationsDelegates: const [
              MonthYearPickerLocalizations.delegate,
            ],
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
