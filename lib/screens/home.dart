import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:nasa/widgets/drawer_config.dart';
import 'package:nasa/widgets/story_card.dart';

import '../theme/color.dart';
import 'stories.dart';




class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 70, 16, 0),
                    child: Text("Welcome to NASA Stories",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
  padding: const EdgeInsetsDirectional.fromSTEB(16, 35, 16, 44),
  child: Text(
        '"To reach for new heights and reveal the unknown so that what we do and learn will benefit all humankind."',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 18,
          color: Colors.white,
        )
  )
),
SizedBox(height: 30,),
Container(
  decoration: BoxDecoration(
        color: Colors.white,
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
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
                      child: Text("Top Stories", style: TextStyle(color: labelColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                    ),
                    SettingItem(title: "NASA to Stand Down on Artemis I Launch Attempts in Early September, Reviewing Options", leadingIcon: "./assets/images/atemis.jpg",),
                    SizedBox(height: 20,),
                    SettingItem(title: "NASA Sets TV Coverage for Russian Spacewalk", leadingIcon: "./assets/images/sat.png",),
                    SizedBox(height: 20,),
                    SettingItem(title: "NASA, Axiom Sign Second Private Astronaut Mission to Space Station Order", leadingIcon: "./assets/images/station.jpg",),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
  Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (context) => const StoriesPage()
      ), 
     ModalRoute.withName("/Stories")
    );
                      },
                      child: Center(
                        child: Column(
                          children: [
                            Icon(Icons.arrow_drop_up),
                            Text("tap for more")
                          ],
                        ),
                      ),
                    )
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