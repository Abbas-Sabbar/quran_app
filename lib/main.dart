import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/core/theme/theme.dart';
import 'package:music_app/core/util/constants/routes.dart';
import 'package:music_app/core/util/cubit/home_cubit.dart';
import 'package:music_app/core/util/cubit/home_states.dart';
import 'package:responsive_framework/responsive_framework.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeStates>(
        // bloc: HomeCubit(),
        builder: (BuildContext context, state) {
          return MaterialApp(
            builder: (context, child) => ResponsiveBreakpoints.builder(
              child: child!,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            ),
            navigatorKey: navigatorKey,
            title: 'Music App',
            debugShowCheckedModeBanner: false,
            themeMode: HomeCubit.get(context).isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: ThemesManager.lightTheme,
            darkTheme: ThemesManager.darkTheme,
            // home: HomeScreen(),
            initialRoute: Routes.homeScreen,
            routes: Routes.routes,
          );
        },
      ),
    );
  }
}
