import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vba_crypto_signal/src/resources/api_provider.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final ApiProvider login = ApiProvider();
    on<LoginEvent>((event, emit) async{
      // TODO: implement event handler
      // if(event is ToggleObscureTextEvent){
      //   emit(PasswordFieldState(!state.o));
      // }
      if(event is Login){
        if(event.email.isEmpty || event.password.isEmpty || event.password.length < 8){
          emit(LoginInputError());
        }else {
          /* perform the login action */
          emit(LoginLoading());
          try{
            final response = await login.login(event.email, event.password);
            if(response == null) {
              emit(LoginError());
            }else{
              /* Goto HomePage if Login is successful */
              emit(LoginLoaded());
            }
          } catch (e){
            emit(LoginError());
          }

          // emit(LoginLoading());
          // await Future.delayed(const Duration(seconds: 3), (){
          //   emit(LoginLoaded('')); // email
          // });
        }
      }
    });
  }
}
