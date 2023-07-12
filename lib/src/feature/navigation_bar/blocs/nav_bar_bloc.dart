import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_bar_event.dart';
part 'nav_bar_state.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  int currentIndex = 0;
  NavBarBloc() : super(FirstPageLoaded(0)) {
    // @override
    on<NavBarEvent> ((event, emit){
      if (event is AppStarted){
        add(PageTapped(currentIndex));
      }if( event is PageTapped){
        currentIndex = event.index;
         emit(NavBarIndexUpdated(currentIndex));
        if(currentIndex == 0){
          emit(FirstPageLoaded(currentIndex));
        }if(currentIndex == 1){
          emit(SecondPageLoaded(currentIndex));
        }if(currentIndex == 2){
          emit(ThirdPageLoaded(currentIndex));
        }
      }
    });
  }
}




/*
int currentIndex =0;
  NavBarBloc() : super(FirstPageLoaded(0));
  @override
  Stream<NavBarState> mapEventToState(
      NavBarEvent event,
      )async*{
    if (event is AppStarted){
      add(PageTapped(currentIndex));
    }if( event is PageTapped){
      currentIndex = event.index; // yield NavBarIndexUpdated(currentIndex);
      emit(NavBarIndexUpdated(currentIndex));
      if(currentIndex == 0){
        yield FirstPageLoaded(currentIndex);
        emit(NavBarIndexUpdated(currentIndex));
      }if(currentIndex == 1){
        yield SecondPageLoaded(currentIndex);
      }if(currentIndex == 2){
        yield ThirdPageLoaded(currentIndex);
      }
    }
  }
* */