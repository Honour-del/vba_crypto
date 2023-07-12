import 'package:flutter/material.dart';
import 'package:vba_crypto_signal/src/utils/consts/screen_utils.dart';
import 'package:vba_crypto_signal/src/utils/custom_widgets/cards.dart';


/// the is the bots-list page
class Bots extends StatelessWidget {
  const Bots({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();
    return ListView(
      physics: const BouncingScrollPhysics(),
      controller: controller,
      children: const [
        VBACard2(status: 'Active',),
        VBACard2(status: 'Inactive', color: Color.fromRGBO(139, 139, 139, 1), color2: Color.fromRGBO(139, 139, 139, 0.3)),
        VBACard2(status: 'Active',),
      ],
    );
  }
}
