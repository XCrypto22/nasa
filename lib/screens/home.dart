import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:animations/animations.dart';
import 'package:nasa/widgets/drawer_config.dart';
import 'package:nasa/widgets/news_item.dart';
import 'package:nasa/widgets/story_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:intl/intl.dart';
import 'package:nasa/widgets/video_card.dart';
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
  List<NasaPhotos> galleryData = [];
  List<NasaMissions> missionData = [];
  List<Widget> missionCards = [];
  List<Widget> photoCards = [];
  String server = '10.0.2.2'; //10.0.2.2 / 192.168.1.149

  getNasaNews() async {
    try {
      final url = Uri.parse('http://$server:5000/data');
      final img_url = Uri.parse('http://$server:5000/gallery');
      final msn_url = Uri.parse('http://$server:5000/missions');

      var response = await http.get(url);
      var img_response = await http.get(img_url);
      var msn_response = await http.get(msn_url);

      var jsonData = jsonDecode(response.body);
      var img_jsonData = jsonDecode(img_response.body);
      var msn_jsonData = jsonDecode(msn_response.body);

      for (var n in jsonData) {
        NasaNews nasaNews = NasaNews(n['title'], n['image'], n['uri']);
        newsData.add(nasaNews);
      }

      for (var n in img_jsonData) {
        NasaPhotos nasaPhotos = NasaPhotos(n['title'], n['image'],
            n['description'], n['photographer'], n['date']);
        galleryData.add(nasaPhotos);
      }

      for (var n in msn_jsonData) {
        NasaMissions nasaMissions = NasaMissions(
            n['title'], n['image'], n['details'], n['date'], n['time_zone']);
        missionData.add(nasaMissions);
      }

      for (var n in missionData) {
        missionCards.add(News(
            title: n.title,
            image: n.image,
            details: n.details,
            date: n.date,
            time_zone: n.time_zone,
            onTap: () {
              showModal(
                  configuration: const FadeScaleTransitionConfiguration(
                    transitionDuration: Duration(milliseconds: 500),
                  ),
                  context: context,
                  builder: (ctx) => AlertDialog(
                        scrollable: true,
                        title: Text(n.title),
                        content: Text(
                            '${n.details}\n\nTime Zone: ${n.time_zone}\nDate: ${n.date}'),
                      ));
            }));
      }

      for (var n in galleryData) {
        photoCards.add(PopularItem(
            image_url: n.image,
            sub_title: n.title,
            onTap: () {
              showModal(
                  configuration: const FadeScaleTransitionConfiguration(
                    transitionDuration: Duration(milliseconds: 500),
                  ),
                  context: context,
                  builder: (ctx) => AlertDialog(
                        scrollable: true,
                        title: Text(n.title),
                        content: Text(
                            '${n.description}\n\nCredit: ${n.photographer}\nDate Created: ${n.date}'),
                      ));
            }));
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
        children: [
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

                      photoCards.isNotEmpty ? getPopulars() : pics(),

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
                        child: Text("Video of the Day",
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

                      VideoPlayerCard(),

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

  photoList() {
    FutureBuilder(
        future: getNasaNews(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data == null) {
            return ListView.separated(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: PopularItem(
                  image_url:
                      'https://images.pexels.com/photos/816608/pexels-photo-816608.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  sub_title: 'Hello World',
                ),
              ),
              separatorBuilder: (_, __) => const SizedBox(
                height: 2,
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: snapshot.data.length < 10 ? snapshot.data.length : 10,
              itemBuilder: (context, i) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: PopularItem(
                      image_url: snapshot.data[i].image,
                      sub_title: snapshot.data[i].title,
                    ));
              },
            );
          }
        });
  }

  getPhotoList() {
    FutureBuilder(
        future: getNasaNews(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.data == null) {
            return ListView.separated(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (_, __) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: PopularItem(
                  image_url:
                      'https://images.pexels.com/photos/816608/pexels-photo-816608.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  sub_title: 'Hello World',
                ),
              ),
              separatorBuilder: (_, __) => const SizedBox(
                height: 2,
              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: snapshot.data.length < 10 ? snapshot.data.length : 10,
              itemBuilder: (context, i) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: PopularItem(
                      image_url: snapshot.data[i].image,
                      sub_title: snapshot.data[i].title,
                    ));
              },
            );
          }
        });
  }

  pics() {
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
                'https://images.pexels.com/photos/816608/pexels-photo-816608.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            sub_title: 'NASA World',
          ),
          PopularItem(
            image_url:
                'https://images.pexels.com/photos/816608/pexels-photo-816608.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            sub_title: 'NASA World',
          ),
          PopularItem(
            image_url:
                'https://images.pexels.com/photos/816608/pexels-photo-816608.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            sub_title: 'NASA World',
          ),
        ]);
  }

  getPopulars() {
    return CarouselSlider(
        options: CarouselOptions(
          height: 370,
          enlargeCenterPage: true,
          disableCenter: true,
          viewportFraction: .75,
        ),
        items: photoCards);
  }

  Widget getNews() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: missionCards,
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

class NasaPhotos {
  final String title, image, description, photographer, date;
  NasaPhotos(
      this.title, this.image, this.description, this.photographer, this.date);
}

class NasaMissions {
  final String title, image, details, date, time_zone;
  NasaMissions(this.title, this.image, this.details, this.date, this.time_zone);
}
