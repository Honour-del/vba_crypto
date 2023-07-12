import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vba_crypto_signal/src/utils/consts/screen_utils.dart';


/* Short cards */
class VBACard1 extends StatelessWidget {
  const VBACard1({Key? key,
    required this.asset,
    required this.name,
    required this.amount,
  }) : super(key: key);
  final String asset;
  final String name;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Color.fromRGBO(33, 51, 69, 1),
      ),
      // height: 70,
      width: getProportionateScreenWidth(90),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(asset, height: 24, color: Colors.white,),
            const Spacer(),
            const SizedBox(height: 10,),
            Text(
              name,
              style: const TextStyle( color: Colors.grey),
            ),
            const SizedBox(height: 3,),
             Text(
              amount,
              style: TextStyle( color: Colors.white, fontSize: getFontSize(20)),
            ),
          ],
        ),
      ),
    );
  }
}

/* Long rectangular cards */
class VBACard2 extends StatelessWidget {
  const VBACard2({Key? key,
    this.status,
    this.color,
    this.color2,
  }) : super(key: key);

  final String? status;
  final Color? color;
  final Color? color2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: BigCard(
        height: getProportionateScreenHeight(82),
        width: getProportionateScreenWidth(335),
        child: Padding(padding: const EdgeInsets.all(13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'EMA Cross 50 200 + ADX',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 1.5,),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '(Long)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),

                    TextButton(onPressed: (){},
                        style: TextButton.styleFrom(
                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
                            backgroundColor: color2 ?? const Color.fromRGBO(96, 255, 181, 0.3) //TODO
                        ),
                        child:
                        Text(
                          '\u2022 $status',
                          style: TextStyle(
                            color: color ?? const Color.fromRGBO(96, 255, 181, 1),
                            fontSize: 15,
                          ),
                        )),
                  ],
                ),
              ),
              // const Spacer(),
              const Text(
                'Distribution Bot',
                style: TextStyle(
                  color: Color.fromRGBO(139, 139, 139, 1),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
class RectangularTextButton extends StatelessWidget {
  RectangularTextButton({Key? key,
    this.height, this.width, this.color, this.title, this.onTap, this.style, this.bgColor
  }) : super(key: key);
  double? width;
  double? height;
  String? title;
  Color? color;
  Color? bgColor;
  VoidCallback? onTap;
  TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          color: bgColor,
        ),
        height: height,
        width: width,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title!,
            style: style,
          ),
        ),
      ),
    );
  }
}


class BigCard extends StatelessWidget {
  BigCard({Key? key,
    this.width, this.height, this.child, this.gradient
  }) : super(key: key);
  double? height;
  double? width;
  Widget? child;
  bool? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        gradient: gradient == true ? const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(33, 51, 69, 1),
            Color.fromRGBO(33, 51, 69, 1),
            Color.fromRGBO(33, 51, 69, 1),
            // Color.fromRGBO(234, 185, 107, 1),
            Color.fromRGBO(234, 185, 107, 1)
          ],
          stops: [
            0.24, 0.2, 0.35, 1
          ],
        ) : null,
        color: const Color.fromRGBO(33, 51, 69, 1),
      ),
      height: height,
      width: width,
      child: child,
    );
  }
}
