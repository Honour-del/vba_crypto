// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vba_crypto_signal/src/feature/home/presentation/home_page.dart';
import 'package:vba_crypto_signal/src/feature/login/bloc/login_bloc.dart';
import 'package:vba_crypto_signal/src/feature/login/presentation/login_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vba_crypto_signal/src/feature/navigation_bar/blocs/nav_bar_bloc.dart';
import 'package:vba_crypto_signal/src/feature/navigation_bar/nav_bar.dart';

// 375W X 812H
void main() {
  // Bloc.observer = const AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// class AppBlocObserver extends BlocObserver{
//   const AppBlocObserver();
//   @override
//   void onChange(BlocBase<dynamic> bloc,  Change<dynamic> change){
//     super.onChange(bloc, change);
//     if(bloc is Cubit) print(change);
//   }
//
//   @override
//   void onTransition(
//       Bloc<dynamic, dynamic> bloc,
//       Transition<dynamic, dynamic> transition,
//       ){
//     super.onTransition(bloc, transition);
//     print(transition);
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> LoginBloc()),
        BlocProvider(create: (context)=> NavBarBloc())
      ],
      child: ScreenUtilInit(
          designSize: const Size(375, 812),
          splitScreenMode: true,
          minTextAdapt: true,
          builder: (context, child)=>const MaterialApp(
            // navigatorKey: mainNavigatorKey,
            scrollBehavior: MaterialScrollBehavior(),
            debugShowCheckedModeBanner: false,
            title: 'Hangout padie',
            home: LoginPage(),
            // home: Navigation(),
          )
      ),
    );
  }
}
