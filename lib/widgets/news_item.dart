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
  
                              'https://images.unsplash.com/photo-1590556409324-aa1d726e5c3c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1287&q=80',
  
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
  
                          'The Key to Starting Every Day Right',
  
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
  
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.',
  
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