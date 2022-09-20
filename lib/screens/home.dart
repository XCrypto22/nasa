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
                    const SettingItem(title: "A Stormy Stellar Nursery", leadingIcon: 'https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/gsfc_20171208_archive_e000226_orig.jpg',),
        
                    const SizedBox(height: 20,),
        
                    const SettingItem(title: "NASA’s Perseverance Rover Investigates Geologically Rich Mars Terrain", leadingIcon: "https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/shuster_2_screenshot_skinner.png?itok=x-o2u6Y-",),
        
                    const SizedBox(height: 20,),
        
                    const SettingItem(title: "25 Years of Continuous Robotic Mars Exploration – From Pathfinder to Perseverance", leadingIcon: "https://www.nasa.gov/sites/default/files/styles/full_width/public/thumbnails/image/mars_exploration_30_perseverance_sol_46_apr_2021.jpg?itok=o9qVXmTH",),
        
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
                            child: Text("Upcoming Mission Events", style: TextStyle(color: labelColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                          ),
                    
                    const SizedBox(height: 20,),

                    getNews(),

                    const SizedBox(height: 30,),

                    const Padding(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                            child: Text("Watch Videos", style: TextStyle(color: labelColor, fontWeight: FontWeight.w600, fontSize: 24,)),
                          ),
                    
                    const SizedBox(height: 20,),

                    moreNews(),

                    const SizedBox(height: 10,),

                    moreNews(),

                    const SizedBox(height: 20,),

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
Container(
  padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
    children: [
  
      ClipRRect(
  
        borderRadius: const BorderRadius.only(
  
          bottomLeft: Radius.circular(8),
  
          bottomRight: Radius.circular(0),
  
          topLeft: Radius.circular(8),
  
          topRight: Radius.circular(0),
  
        ),
  
        child: Image.network(
  
          'https://i.ytimg.com/vi/xpO4_IJINAM/sddefault.jpg',
  
          width: 100,
  
          height: 100,
  
          fit: BoxFit.cover,
  
        ),
  
      ),

      SizedBox(width: 20,),
  
      Expanded(
  
              child: Text(
  
                'Astounding View of NASA’s Artemis I Rocket at Rollout', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500 ),
  
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