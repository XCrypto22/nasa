import 'package:flutter/material.dart';

import '../theme/color.dart';




class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(),
              childCount: 1,
            ),
          )
        ],
      )
    );
  }

  Widget getAppBar(){
    return Container(
      child: IconButton(
        onPressed: () {
          
        },
        icon: const Icon(Icons.menu, color: Colors.black,),
      ),
    );
  }


  Widget buildBody(){
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color: Colors.red
      ),
    );
  }

}