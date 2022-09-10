import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:nasa/widgets/drawer_config.dart';
import 'package:nasa/widgets/story_card.dart';

import '../theme/color.dart';
import '../widgets/gallery_item.dart';
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
      child: Stack(
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
          ],
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.6,
          maxChildSize: 0.9,
          builder: (context, controller) => ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 10, top: 5),
              color: Colors.white,
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Generated code for this Divider Widget...
Divider(
  height: 8,
  thickness: 4,
  indent: 140,
  endIndent: 140,
  color: Color.fromARGB(255, 219, 219, 219),
),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
                            child: Text("Top Stories", style: TextStyle(color: labelColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                          ),
                          Icon(Icons.search)
                        ],
                      ),
                    SettingItem(title: "Hello", leadingIcon: "./assets/images/atemis.jpg",),
        
                    SizedBox(height: 20,),
        
                    SettingItem(title: "Hello", leadingIcon: "./assets/images/sat.png",),
        
                    SizedBox(height: 20,),
        
                    SettingItem(title: "Hello", leadingIcon: "./assets/images/station.jpg",),
        
                    SizedBox(height: 30,),

                    Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
                            child: Text("Gallery", style: TextStyle(color: labelColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                          ),
                    
                    SizedBox(height: 20,),
        
                    getPopulars(),
        
                    SizedBox(height: 30,),

                    Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 25),
                            child: Text("Other Space News", style: TextStyle(color: labelColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                          ),
                    
                    SizedBox(height: 20,),
        
                    SettingItem(title: "Hello", leadingIcon: "./assets/images/sat.png",),
        
                    SizedBox(height: 20,),
        
                    SettingItem(title: "Hello", leadingIcon: "./assets/images/station.jpg",),
        
                    SizedBox(height: 20,),
                  ],
                ),
              )
            ),
          ),
        )
        ],
      ),
    );
  }

  getPopulars(){
    return 
      CarouselSlider(
        options: CarouselOptions(
          height: 370,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .75,
        ),
        items: [
          PopularItem(),
          PopularItem(),
          PopularItem(),
          PopularItem(),
        ]
      );
  }

  Widget buildSheet(){
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 0.7,
      
      // snap: true,
      builder: (_, controller) => SingleChildScrollView(
        controller: controller,
        scrollDirection: Axis.vertical,
        
        child: Padding(
        
              padding: const EdgeInsets.only(left: 10, right: 10),
        
              child: Column(
        
              crossAxisAlignment: CrossAxisAlignment.start,
              
        
               
        
              children: [
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
      ),
    );
  }

}