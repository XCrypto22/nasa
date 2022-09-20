import 'package:flutter/material.dart';


class News extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _NewsState();
}

class _NewsState extends State<News>{

  @override
  Widget build(BuildContext context){
    return Padding(
  
        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 12, 8),
  
        child: Container(
  
          width: MediaQuery.of(context).size.width * 0.7,
  
          decoration: BoxDecoration(
  
            color: Colors.white,
  
            boxShadow: [
  
              BoxShadow(
  
                blurRadius: 5,
  
                color: Color(0x44111417),
  
                offset: Offset(0, 2),
  
              )
  
            ],
  
            borderRadius: BorderRadius.circular(8),
  
          ),
  
          child: Padding(
  
            padding: EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
  
            child: Row(
  
              mainAxisSize: MainAxisSize.max,
  
              children: [
  
                Expanded(
  
                  child: Column(
  
                    mainAxisSize: MainAxisSize.max,
  
                    mainAxisAlignment: MainAxisAlignment.center,
  
                    crossAxisAlignment: CrossAxisAlignment.start,
  
                    children: [
  
                      Container(
  
                        width: double.infinity,
  
                        height: 270,
  
                        decoration: BoxDecoration(
  
                          color: Color(0xFFE0E3E7),
  
                          borderRadius: BorderRadius.circular(8),
  
                        ),
  
                        child: Padding(
  
                          padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
  
                          child: ClipRRect(
  
                            borderRadius: BorderRadius.circular(6),
  
                            child: Image.network(
  
                              'https://www.nasa.gov/sites/default/files/styles/image_card_4x3_ratio/public/thumbnails/image/iss067e029147.jpg',
  
                              width: 100,
  
                              height: 100,
  
                              fit: BoxFit.cover,
  
                            ),
  
                          ),
  
                        ),
  
                      ),
  
                      Padding(
  
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 4),
  
                        child: Text(
  
                          'International Space Station Expedition 68 Soyuz Launch',
  
                          style:
  
                              TextStyle(
  
                            fontFamily: 'Outfit',
  
                                    color: Color(0xFF0F1113),
  
                                    fontSize: 18,
  
                                    fontWeight: FontWeight.w500,
  
                          )
  
                        ),
  
                      ),
  
                      Row(
  
                        mainAxisSize: MainAxisSize.max,
  
                        children: [
  
                          Expanded(
  
                            child: Padding(
  
                              padding:
  
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
  
                              child: Text(
  
                                'September 21, 2022',
  
                                style: TextStyle(
  
                                  fontFamily: 'Outfit',
  
                                      color: Color(0xFF57636C),
  
                                      fontSize: 14,
  
                                      fontWeight: FontWeight.normal,
  
                                )
  
                              ),
  
                            ),
  
                          ),
  
                        ],
  
                      ),
  
                    ],
  
                  ),
  
                ),
  
              ],
  
            ),
  
          ),
  
        ),
  
      );
  
  }
}