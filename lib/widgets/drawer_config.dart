import 'package:flutter/material.dart';
import 'package:nasa/screens/home.dart';

class DrawerPage extends StatefulWidget{

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context){
    String text;
    return Drawer(
        backgroundColor: Color.fromARGB(255, 30, 14, 255),
          child: ListView(
            children: <Widget>[
              Container(child: DrawerHeader(child: Container(
                child: Image.asset("assets/images/logo.png",
                      height: 100,),
              ))),
              Container (
                child: Column(
                    children: <Widget>[
                      
                      ListTile(leading: Icon(Icons.home),
                      title: Text("Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400
                      ),),
                          onTap:(){
                              Navigator.pop(context);
  Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(
        builder: (context) => const HomePage()
      ), 
     ModalRoute.withName("/Home")
    );
                              //Navigator.pop(context);
                          }
                      ),
                      ListTile(leading: Icon(Icons.library_books),
                      title: Text("My Stories",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400
                      ),),
                          onTap:(){
                            setState((){
                              text = "settings pressed";
                            });
                          }
                      ),

                      ListTile(leading: Icon(Icons.photo_album),
                      title: Text("Gallery",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400
                      ),),
                          onTap:(){
                            setState((){
                              text = "settings pressed";
                            });
                          }
                      ),

                      ListTile(leading: Icon(Icons.rocket_launch),
                      title: Text("Missions",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400
                      ),),
                          onTap:(){
                            setState((){
                              text = "settings pressed";
                            });
                          }
                      ),

                      ListTile(leading: Icon(Icons.web),
                      title: Text("NASA Website",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400
                      ),),
                          onTap:(){
                            setState((){
                              text = "settings pressed";
                            });
                          }
                      ),
                      
                      ListTile(leading: Icon(Icons.settings),
                      title: Text("Settings",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400
                      ),),
                          onTap:(){
                            setState((){
                              text = "settings pressed";
                            });
                          }
                      ),
                      
                      ListTile(leading: Icon(Icons.info),
                      title: Text("About",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400
                      ),),
                          onTap:(){
                            showAboutDialog(context: context,
                            applicationName: "NASA Stories",
                            applicationVersion: "v1.0.0",
                            applicationIcon: Image.asset('assets/images/logo.png', height: 50,),
                            applicationLegalese: 'Developed by Elton T. Fungirai - eltonfungirai@gmail.com');
                        
                          }
                      ),

                    ]
                ),
              )
            ],
          ),
        );
  }
}