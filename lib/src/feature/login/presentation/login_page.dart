import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vba_crypto_signal/src/feature/home/presentation/home_page.dart';
import 'package:vba_crypto_signal/src/feature/login/bloc/login_bloc.dart';
import 'package:vba_crypto_signal/src/feature/navigation_bar/nav_bar.dart';
import 'package:vba_crypto_signal/src/utils/consts/screen_utils.dart';
import 'package:vba_crypto_signal/src/utils/custom_widgets/cards.dart';
import 'package:vba_crypto_signal/src/utils/custom_widgets/text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();
bool _secureText = true;
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 32, 51, 1),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,////80
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        flexibleSpace: Center(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 30,
                left: 20,
                right: 20
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios, color: Colors.white,)),
                ),
                const SizedBox(width: 80,),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Log In',
                    style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: getFontSize(20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state){
          if( state is LoginError){
            buildNetworkLayOut();
          }
          else if(state is LoginInputError){
            buildErrorLayOut();
          }
          else if(state is LoginLoaded){
            clearTextData();
            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Navigation()));
          }
        },
        builder: (context, state){
          if(state is LoginLoading){
            return Stack(
              children: [
                buildInitialInput(),
                const Center(
                  child: CircularProgressIndicator(),
                ),
              ],
            );
          }else{
            return buildInitialInput();
          }
        },
      ),
    );
  }

  Widget buildInitialInput ()=> Column(
    children: [
      SizedBox(height: getProportionateScreenHeight(17),),
      BigCard(
        height: getProportionateScreenHeight(335),
        width: getProportionateScreenWidth(335),
        child: Padding(padding: const EdgeInsets.all(17),
          child: Column(
            children: [
              InputField(label: "Email Address", hint: "you@example.com", keyboardType: TextInputType.emailAddress, obscure: false, controller: email,),
              InputField(label: "Password", hint: "Not less than 8 characters", keyboardType: TextInputType.visiblePassword, obscure: _secureText, controller: password,
                suffixIcon: IconButton(
                    icon: Icon(
                      (_secureText
                          ? Icons.remove_red_eye_outlined
                          : Icons.security),
                      color: const Color.fromRGBO(234, 185, 107, 1),
                    ),
                    onPressed: () {
                      setState(() {
                        _secureText = !_secureText;
                      });
                    }
                ),
              ),
              const SizedBox(height: 18,),
              RectangularTextButton(
                title: "Log In",
                width: getProportionateScreenWidth(255),
                height: getProportionateScreenWidth(48),
                style: const TextStyle(
                  color: Color.fromRGBO(19,19,19, 1),
                  fontSize: 15,
                  fontWeight: FontWeight.w500
                  // fontSize:
                ),
                bgColor: const Color.fromRGBO(234, 185, 107, 1),
                onTap: (){
                  BlocProvider.of<LoginBloc>(context).add(Login(email.text, password.text));
                },
              ),
            ],
          ),
        ),
      ),

      const SizedBox(height: 25,),

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(width: 70, child: Divider(color: Colors.blueGrey,),),
          Text(
            '  OR  ',
            style: TextStyle(color: Color.fromRGBO(139, 139, 139, 1), fontSize: 17, fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 70, child: Divider(color: Colors.blueGrey,),),
        ],
      ),
      const SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/flat-color-icons_google.svg'),
          const SizedBox(width: 20,),
          SvgPicture.asset('assets/images/ri_apple-fill.svg'),
        ],
      ),
      const SizedBox(height: 10,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
              'Don\'t have an account?',
            style: TextStyle(color: Color.fromRGBO(139, 139, 139, 1),
              fontSize: 14
          )),
          const SizedBox(width: .2),
          TextButton(onPressed: (){}, child: const Text(
            'Sign up',
            style: TextStyle(
              color: Color.fromRGBO(234, 185, 107, 1),
              fontSize: 14
            ),
          ))
        ],
      ),
    ],
  );


  ScaffoldFeatureController buildErrorLayOut ()=> ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Error: Make sure each of the InputFields are correctly filled")),
  );

  ScaffoldFeatureController buildNetworkLayOut ()=> ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Login Error")),
  );

  clearTextData (){
    email.clear();
    password.clear();
  }
}

