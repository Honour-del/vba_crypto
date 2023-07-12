import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vba_crypto_signal/src/feature/home/model/crypto_model.dart';
import 'package:vba_crypto_signal/src/feature/home/presentation/widgets/bots.dart';
import 'package:vba_crypto_signal/src/feature/home/presentation/widgets/signal_groups.dart';
import 'package:vba_crypto_signal/src/utils/consts/screen_utils.dart';
import 'package:vba_crypto_signal/src/utils/custom_widgets/appBar.dart';
import 'package:vba_crypto_signal/src/utils/custom_widgets/cards.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final controller = ScrollController();

List<CryptModel> data = [
  CryptModel(id: 0, name: 'BTCUSDT', icon: 'assets/images/Combined Shape.svg', amount: '36.77 %'),
  CryptModel(id: 1, name: 'ETHUSDT', icon: 'assets/images/Group 14.svg', amount: '24.77 %'),
  CryptModel(id: 2, name: 'BNBUSDT', icon: 'assets/images/Combined Shape.svg', amount: '36.07 %'),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 32, 51, 1),
      extendBody: true,
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: CircleAvatar(radius: 20,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                ),
                const SizedBox(width: 10,),
                SizedBox(
                  height: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hey, Jacobs',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      SizedBox(height: 1,),
                      Align(
                        child: Text(
                          'Welcome back',
                          style: TextStyle(color: Color.fromRGBO(139, 139, 139, 1),
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Align(
                  alignment: Alignment.center,
                  child: Icon(Icons.notifications_none_outlined, color: Colors.white, size: 24,),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: 0,
            left: 20,
            right: 20
        ),
        child: Column(
          children: [
            BigCard(
              gradient: true,
              height: getProportionateScreenHeight(175.202),
              width: getProportionateScreenWidth(335),
              child: Padding(padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Wallet',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13
                            ),
                          ),

                          OutlinedButton(onPressed: (){},
                            style: OutlinedButton.styleFrom(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                              side: const BorderSide(
                                color: Colors.white,
                              )
                            ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SvgPicture.asset('assets/images/Combined Shape.svg', color: Colors.white,),
                                  const SizedBox(width: 2,),
                                  const Text(
                                    'Binance',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13
                                    ),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white, size: 24,),
                                ],
                              ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: getProportionateScreenHeight(30),),

                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Account Balance',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 7,),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        r'$ 12 480.00',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: getFontSize(32)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20,),

            SizedBox(
              height: 100,
              child: Scrollbar(
                // thickness: 3,
                controller: controller,
                // scrollbarOrientation: ScrollbarOrientation.bottom,
                isAlwaysShown: false,
                // radius: const Radius.circular(3),
                // thumbVisibility: true,
                child: ListView.separated(
                    shrinkWrap: true,
                  controller: controller,
                    itemCount: 3,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
                      return VBACard1(asset: data[index].icon, name: data[index].name, amount: data[index].amount);
                    },
                    separatorBuilder: (context, index){
                      return const SizedBox(width: 20,);
                    },
                ),
              ),
            ),


            const SizedBox(height: 10,),

            const Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.center,
                child: TabBarComponent(tabViews: [
                  SignalGroup(),
                  Bots(),
                ]),
              ),)
          ],
        ),
      ),
    );
  }
}
