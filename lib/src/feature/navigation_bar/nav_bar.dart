
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vba_crypto_signal/src/feature/home/presentation/home_page.dart';
import 'package:vba_crypto_signal/src/feature/navigation_bar/blocs/nav_bar_bloc.dart';
import 'package:vba_crypto_signal/src/feature/navigation_bar/blocs/nav_bar_bloc.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:numbers/screens/homepage/home_page.dart';
// import 'package:numbers/utils/constants.dart';

// final currentTabProvider = StateProvider.autoDispose<int>((ref) => 0);

class Navigation extends StatelessWidget {
  static const routeName = "/navigation";
  const Navigation({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context,) {
    // int currentTab = ref.watch(currentTabProvider);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: BlocBuilder<NavBarBloc, NavBarState>(
        builder: (context, state){
          if(state is AppStarted){
            return const HomePage();
          }
          else if(state is FirstPageLoaded){
            return const HomePage();
          }else if(state is SecondPageLoaded){
            return const HomePage();
          }else if(state is ThirdPageLoaded){
            return const HomePage();
          }
          else{
            return Container();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<NavBarBloc, NavBarState>(
        builder: (context, state){
          return Material(
            elevation: 0.0,
            color: const Color.fromRGBO(33, 51, 69, 1),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: const Color.fromRGBO(14, 32, 51, 1),
                  width: 0.5.w,
                ),
                borderRadius: BorderRadius.circular(70.0)),
            child: BottomNavigationBar(
              elevation: 0.0,
              // backgroundColor: const Color.fromRGBO(33, 51, 69, 1),
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.white, //(0xff59647D)
              selectedItemColor: const Color.fromRGBO(234, 185, 107, 1), //TODO
              selectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
              unselectedLabelStyle: TextStyle(
                fontSize: 12.sp,
                color: const Color(0xff59647D),
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0.h),
                    child: const ImageIcon(
                      AssetImage(
                        'assets/images/Graph.png',
                      ),
                      size: 45,
                      // color:,
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0.h),
                    child: const ImageIcon(
                      AssetImage(
                        'assets/images/Activity.png',
                      ),
                    ),
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.only(bottom: 2.0.h),
                    child: const ImageIcon(
                      AssetImage(
                        'assets/images/Setting.png',
                      ),
                    ),
                  ),
                  label: "",
                ),
              ],
              currentIndex: context.select((NavBarBloc bloc) => bloc.currentIndex),
              onTap: (index) => context.read<NavBarBloc>().add(PageTapped(index)),
            ),
          );
        },
      ),
    );
  }
}
