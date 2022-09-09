import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:nasa/widgets/drawer_config.dart';
import 'package:nasa/widgets/story_card.dart';

import '../theme/color.dart';
import 'home.dart';




class StoriesPage extends StatefulWidget {
  const StoriesPage({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoriesPage> {
  @override
  Widget build(BuildContext context) {
    String text;
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      drawer: DrawerPage(),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 255, 255, 255),
        centerTitle: true,
      ),
      body: buildBody(),
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
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Align(

                  alignment: AlignmentDirectional(0.05, -1),
                  child: Image.asset(
                    'assets/images/background.jpg',
                      width: double.infinity,
                      height: 500,
                      fit: BoxFit.cover,
                    ),
              ),
              Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  color: Color(0x8D090F13),
                ),
              ),
              Column(
                children: [
SizedBox(height: 60,),
Container(
  decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30)
        )
  ),
  child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
         
            children: [
              SizedBox(height: 20,),
              Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
  Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (context) => const HomePage()
      ), 
     ModalRoute.withName("/Home")
    );
                  },
                  icon: Icon(Icons.arrow_drop_down),
                ),
              ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
                          child: Text("All Stories", style: TextStyle(color: labelColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                        ),
                        Icon(Icons.search)
                      ],
                    ),
                    SettingItem(title: "Hello", leadingIcon: "./assets/images/atemis.jpg",),
                    SizedBox(height: 20,),
                    SettingItem(title: "Hello", leadingIcon: "./assets/images/sat.png",),
                    SizedBox(height: 20,),
                    SettingItem(title: "Hello", leadingIcon: "./assets/images/station.jpg",),
                    SizedBox(height: 20,),
                    SettingItem(title: "Hello", leadingIcon: "./assets/images/atemis.jpg",),
                    SizedBox(height: 20,),
                    SettingItem(title: "Hello", leadingIcon: "./assets/images/sat.png",),
                    SizedBox(height: 20,),
                    SettingItem(title: "Hello", leadingIcon: "./assets/images/station.jpg",),
                    SizedBox(height: 20,),
                   
            ],
          ),
        ),
  )
)
                ],
              )
              ],
            )
          ],
        ),
      ),
    );
  }

}