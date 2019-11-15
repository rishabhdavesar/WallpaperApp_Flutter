import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'details.dart';

class ListWidget extends StatefulWidget {
  @override
  _ListWidgetState createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  List<Container> getList = new List();
  

  var pics = [
    {"nama": "Aquaman", "pic": "1.jpg"},
    {"nama": "batman", "pic": "2.png"},
    {"nama": "suoe", "pic": "3.png"},
    {"nama": "Aquafdfman", "pic": "4.JPG"},
    {"nama": "Aquamddan", "pic": "5.jpg"},
    {"nama": "Aquaddsman", "pic": "6.png"},
  ];

  listbuild() async {
    for (var i = 0; i < pics.length; i++) {
      final photo = pics[i];
      final String pic = photo["pic"];
      getList.add(
        new Container(
          // color: Colors.blue,
          // height: 600,

          padding: EdgeInsets.all(10),
          height: 200,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Hero(
                
                tag: photo['nama'],
                child: Material(
                    child: new InkWell(
                      onTap: () =>
                     
                        Navigator.of(context).push(  new MaterialPageRoute(
                              builder: (BuildContext context) => new Detail(
                                    nama: photo['nama'],
                                    pic: pic,
                                  ),
                            )),
                  child: new Image.asset(
                    "lib/images/$pic",
                    fit: BoxFit.cover,
                  ),
                )),
              )),
        ),
        //new Text(photo['nama'],)
      );
    }
  }

  @override
  void initState() {
    listbuild();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     timeDilation = 2.0;
    double y = MediaQuery.of(context).size.width;
    return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 15, left: 5),
                padding: EdgeInsets.only(right: 20),
                child: new Text(
                  "Get Premium",
                  style: TextStyle(color: Colors.blueAccent),
                ))
          ],
        ),
        body: 

        
                 Stack(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: 45, left: y / 2 * 0.7),
                  padding: EdgeInsets.only(right: 20),
                  child: new Text(
                    "Colorful",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )),
              Container(
                padding: EdgeInsets.only(top: 120),
                child: GridView.count(
                  crossAxisCount: 2,
                  //padding: EdgeInsets.only(top: 150),
                  // mainAxisSpacing: ,
                  childAspectRatio: 0.7,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: getList,
                  shrinkWrap: true,
                  //  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          ),
        
        
      ),
    );
  }
}
