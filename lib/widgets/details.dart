import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail({this.nama, this.pic});
  final String nama;
  final String pic;

  @override
  Widget build(BuildContext context) {
    double y = MediaQuery.of(context).size.width;
    double x = MediaQuery.of(context).size.height;
    return SafeArea(
          child: new Scaffold(
            backgroundColor:  Colors.white,
      //       appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   leading: Icon(
      //     Icons.arrow_back_ios,
      //     color: Colors.black,
      //   ),
        
      // ),
        body: 
            Scaffold(
                        body: new Container(
               // margin: EdgeInsets.only(bottom: 50),
                 height: x,
                 width: y,
                  child: new Hero(
                    tag: nama,
                    child: new Material(
                      child: new GestureDetector(
                        onVerticalDragEnd: (DragEndDetails details)
                        { 
                          Navigator.pop(context);

                        },
                        child: new Image.asset(
                          "lib/images/$pic",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
            ),
           
           
          
        
      ),
    );
  }
}
