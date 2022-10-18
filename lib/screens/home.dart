import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:nasa/widgets/drawer_config.dart';
import 'package:nasa/widgets/news_item.dart';
import 'package:nasa/widgets/story_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:shimmer/shimmer.dart';
import 'package:lottie/lottie.dart';

import '../theme/color.dart';
import '../widgets/gallery_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NasaNews> newsData = [];
  String server = '10.0.2.2';
  getNasaNews() async {
    try {
      final url = Uri.parse('http://$server:5000/data');
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);

      for (var n in jsonData) {
        NasaNews nasaNews = NasaNews(n['title'], n['image'], n['uri']);
        newsData.add(nasaNews);
      }
      return newsData;
    } catch (e) {}
  }

  @override
  void initState() {
    getNasaNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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

  Widget getAppBar() {
    return Container(
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildBody() {
    return Expanded(
        child: Stack(children: [
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
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16, 70, 16, 0),
            child: Text(
              "Welcome to NASA Stories",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16, 35, 16, 44),
              child: Text(
                  '"To reach for new heights and reveal the unknown so that what we do and learn will benefit all humankind."',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w200,
                    fontSize: 15,
                    color: Colors.white,
                  ))),
          SizedBox(
            height: 30,
          ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                            child: Text("Top Stories",
                                style: TextStyle(
                                  color: labelColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                )),
                          ),
                        ],
                      ),
                      Container(
                        height: 250,
                        child: FutureBuilder(
                            future: getNasaNews(),
                            builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) {
                              if (snapshot.data == null) {
                                return Shimmer.fromColors(
                                    baseColor: Colors.grey[400]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: ListView.separated(
                                      padding: EdgeInsets.all(0),
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: 3,
                                      itemBuilder: (_, __) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 4),
                                        child: placeHolderRow(),
                                      ),
                                      separatorBuilder: (_, __) =>
                                          const SizedBox(
                                        height: 2,
                                      ),
                                    ));
                              } else {
                                return ListView.builder(
                                  padding: EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length < 3
                                      ? snapshot.data.length
                                      : 3,
                                  itemBuilder: (context, i) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: SettingItem(
                                        title: snapshot.data[i].title,
                                        image: snapshot.data[i].image,
                                        onTap: () async {
                                          try {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        WebviewScaffold(
                                                          initialChild:
                                                              const Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ),
                                                          url: snapshot
                                                              .data[i].uri,
                                                          appBar: AppBar(
                                                              title: Text(
                                                                  snapshot
                                                                      .data[i]
                                                                      .title)),
                                                        )));
                                          } catch (e) {}
                                        },
                                      ),
                                    );
                                  },
                                );
                              }
                            }),
                      ),

                      const SizedBox(
                        height: 15,
                      ),

                      Center(
                        child: Column(
                          children: [
                            const Icon(Icons.more_horiz),
                            TextButton(
                              onPressed: null,
                              child: const Text("Show more"),
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(15),
                                  primary: Colors.blue,
                                  textStyle: const TextStyle(
                                      fontSize: 12, color: Colors.red)),
                            ),
                          ],
                        ),
                      ),

                      Divider(),

                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Gallery",
                                style: TextStyle(
                                  color: labelColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Lottie.network(
                                  'https://assets6.lottiefiles.com/private_files/lf30_nzsbtndw.json',
                                  height: 50),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      getPopulars(),

                      const SizedBox(
                        height: 10,
                      ),

                      Divider(),

                      const SizedBox(
                        height: 10,
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Upcoming Missions",
                                style: TextStyle(
                                  color: labelColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                )),
                            Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Lottie.network(
                                    'https://assets7.lottiefiles.com/packages/lf20_ii6qdbgz.json',
                                    height: 60))
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      getNews(),

                      const SizedBox(
                        height: 30,
                      ),

                      const Padding(
                        padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                        child: Text("Watch Videos",
                            style: TextStyle(
                              color: labelColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            )),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //moreNews(),
                      Shimmer.fromColors(
                          baseColor: Colors.grey[400]!,
                          highlightColor: Colors.grey[100]!,
                          child: ListView.separated(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (_, __) => Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: placeHolderRow(),
                            ),
                            separatorBuilder: (_, __) => const SizedBox(
                              height: 2,
                            ),
                          )),

                      const SizedBox(
                        height: 15,
                      ),

                      Center(
                        child: Column(
                          children: [
                            const Icon(Icons.more_horiz),
                            TextButton(
                              onPressed: null,
                              child: const Text("Show more"),
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(15),
                                  primary: Colors.blue,
                                  textStyle: const TextStyle(
                                      fontSize: 12, color: Colors.red)),
                            ),
                          ],
                        ),
                      ),
                    ])),
          ),
        ),
      ),
    ]));
  }

  Widget placeHolderRow() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            color: Colors.white,
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8.0)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 8.0,
                color: Colors.white,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
              Container(
                width: double.infinity,
                height: 8.0,
                color: Colors.white,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
              Container(
                width: 40,
                height: 8.0,
                color: Colors.white,
              )
            ],
          ))
        ],
      );

  getPopulars() {
    return CarouselSlider(
        options: CarouselOptions(
          height: 370,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .75,
        ),
        items: [
          PopularItem(
            image_url:
                "https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            sub_title: "A Bird's-Eye View of the Vehicle Assembly Base",
          ),
          PopularItem(
            image_url:
                "https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            sub_title: "A Bird's-Eye View of the Vehicle Assembly Base",
          ),
          PopularItem(
            image_url:
                "https://images.pexels.com/photos/1274260/pexels-photo-1274260.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            sub_title: "A Bird's-Eye View of the Vehicle Assembly Base",
          ),
        ]);
  }

  Widget getNews() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          News(),
          News(),
          News(),
        ],
      ),
    );
  }

  Widget moreNews() {
    return // Generated code for this Row Widget...
        Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 15, right: 15),
      child: Row(
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
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              'Astounding View of NASA’s Artemis I Rocket at Rollout',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSheet() {
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
                            builder: (context) => const HomePage()),
                        ModalRoute.withName("/Home"));
                  },
                  icon: const Icon(Icons.arrow_drop_down),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 25),
                    child: Text("All Stories",
                        style: TextStyle(
                          color: labelColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        )),
                  ),
                  Icon(Icons.search)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NasaNews {
  final String title, image, uri;
  NasaNews(this.title, this.image, this.uri);
}
