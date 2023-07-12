
import 'package:flutter/material.dart';
import 'package:vba_crypto_signal/src/utils/consts/screen_utils.dart';

class TabBarComponent extends StatefulWidget {
  final List<Widget> tabViews;

  const TabBarComponent({Key? key, // required this.tabs,
    required this.tabViews})
      : super(key: key);

  @override
  State<TabBarComponent> createState() => _TabBarComponentState();
}

class _TabBarComponentState extends State<TabBarComponent> with SingleTickerProviderStateMixin{
  TabController? _tabController;
  int selectedTab = 0;
  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController!.addListener(() {
      if(!_tabController!.indexIsChanging){
        setState(() {
          selectedTab = _tabController!.index;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Column(children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          labelPadding: const EdgeInsets.only(left: 20, right: 20),
          labelStyle: TextStyle(
            fontSize: getFontSize(18),
            fontWeight: FontWeight.w700,
            color: Colors.white
            // fontFamily: 'Ubuntu'
          ),
          tabs: [
            _getTab(0, const Text("Signal Groups",
              style: TextStyle(
                  color: Colors.white
              ),
            ),),
            _getTab(1, const Text('Bots',
              style: TextStyle(
                  color: Colors.white
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          // height: 10,
          height: MediaQuery.of(context).size.height / 3,
          child: TabBarView(
            controller: _tabController,
            physics: const BouncingScrollPhysics(),
            children: widget.tabViews,
          ),
        ),
      ]),
    );
  }

  _getTab(index, child){
    return Tab(child: Container(
      padding: const EdgeInsets.all(10),
    // width: 60,
        decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
    color:  (selectedTab == index ? const Color.fromRGBO(33, 51, 69, 1): Colors.transparent ),
    ),
      child: Center(child: child,),
    ));
  }
}
