import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:nasa/widgets/drawer_config.dart';
import 'package:nasa/widgets/news_item.dart';
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
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
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

            alignment: const AlignmentDirectional(0.05, -1),
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
          decoration: const BoxDecoration(
            color: Color(0x8D090F13),
          ),
        ),
        Column(
          children: const [
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 70, 16, 0),
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
  padding: EdgeInsetsDirectional.fromSTEB(16, 35, 16, 44),
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
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              color: Colors.white,
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Generated code for this Divider Widget...
const Divider(
  height: 8,
  thickness: 4,
  indent: 140,
  endIndent: 140,
  color: Color.fromARGB(255, 219, 219, 219),
),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                            child: Text("Top Stories", style: TextStyle(color: labelColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                          ),
                          Icon(Icons.search)
                        ],
                      ),
                    const SettingItem(title: "Hello", leadingIcon: "./assets/images/atemis.jpg",),
        
                    const SizedBox(height: 20,),
        
                    const SettingItem(title: "Hello", leadingIcon: "./assets/images/sat.png",),
        
                    const SizedBox(height: 20,),
        
                    const SettingItem(title: "Hello", leadingIcon: "./assets/images/station.jpg",),
        
                    const SizedBox(height: 15,),

                  Center(
                    child: Column(
                      children: [
                        const Icon(Icons.arrow_drop_up),
                        TextButton(
              onPressed: null,
              child: const Text("Show more"),
              style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(15),
                        primary: Colors.blue,
                        textStyle: const TextStyle(fontSize: 18, color: Colors.red)),
            ),
                      ],
                    ),
                  ),

                    const SizedBox(height: 30,),

                    const Padding(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                            child: Text("Gallery", style: TextStyle(color: labelColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                          ),
                    
                    const SizedBox(height: 20,),

        
                    getPopulars(),
        
                    const SizedBox(height: 30,),

                    const Padding(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                            child: Text("Other Space News", style: TextStyle(color: labelColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                          ),
                    
                    const SizedBox(height: 20,),

                    getNews(),

                    const SizedBox(height: 20,),

                    moreNews(),

                    const SizedBox(height: 10,),

                    moreNews(),

                    const SizedBox(height: 20,),

                    
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

  Widget getNews(){
    return SingleChildScrollView(
      
  scrollDirection: Axis.horizontal,
  child:   Row(

    children: [

      News(),
      News(),
      News(),

    ],
  
  ),
);

  }

  Widget moreNews(){
    return // Generated code for this Row Widget...
Padding(
  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 1),
  child: Row(
    mainAxisSize: MainAxisSize.max,
    children: [
      ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(8),
          topRight: Radius.circular(0),
        ),
        child: Image.network(
          'https://images.unsplash.com/photo-1623199648374-a4ff4e14e719?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2620&q=80',
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
      Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Title',
              style: TextStyle(
                fontFamily: 'Outfit',
                    color: Color(0xFF0F1113),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
              )
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: const [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                  child: Text(
                    'Subtitle',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                          color: Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                    )
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(4, 4, 0, 0),
                  child: Text(
                    'subtext',
                    style: TextStyle(
                      fontFamily: 'Outfit',
                          color: Color(0xFF0F1113),
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                    )
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  ),
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
        
                icon: const Icon(Icons.arrow_drop_down),
        
              ),
        
              ),
        
                  Row(
        
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                    children: const [
        
                      Padding(
        
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
        
                        child: Text("All Stories", style: TextStyle(color: labelColor, fontWeight: FontWeight.w600, fontSize: 24,)),
        
                      ),
        
                      Icon(Icons.search)
        
                    ],
        
                  ),
        
                  const SettingItem(title: "Hello", leadingIcon: "./assets/images/atemis.jpg",),
        
                  const SizedBox(height: 20,),
        
                  const SettingItem(title: "Hello", leadingIcon: "./assets/images/sat.png",),
        
                  const SizedBox(height: 20,),
        
                  const SettingItem(title: "Hello", leadingIcon: "./assets/images/station.jpg",),
        
                  const SizedBox(height: 20,),
        
                  const SettingItem(title: "Hello", leadingIcon: "./assets/images/atemis.jpg",),
        
                  const SizedBox(height: 20,),
        
                  const SettingItem(title: "Hello", leadingIcon: "./assets/images/sat.png",),
        
                  const SizedBox(height: 20,),
        
                  const SettingItem(title: "Hello", leadingIcon: "./assets/images/station.jpg",),
        
                  const SizedBox(height: 20,),
        
              ],
        
              ),
        
        ),
      ),
    );
  }

}