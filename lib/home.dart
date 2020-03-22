import 'package:architect_ui/model.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double pi = 22 / 1260;
  int selectedIndex = 0;

  Widget getListItems(ArchitectModel model) {
    return Container(
      width: 228,
      margin: EdgeInsets.only(right: 30),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Container(
                  foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/${model.imageUrl}"),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned.directional(
                  textDirection: TextDirection.ltr,
                  end: 0,
                  bottom: 1,
                  child: ClipPath(
                    clipper: _Hexagon(),
                    child: Container(
                      width: 70,
                      height: 80,
                      color: Color(0xFFCD9274),
                      child: Transform.rotate(
                        angle: 180 * pi,
                        child: Center(
                          child: Icon(
                            Icons.keyboard_backspace,
                            size: 37,
                            color: Color(0xFFFADDC8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                children: <Widget>[
                  Text(
                    model.name,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: 32,
                      color: Color(0xFFfcf0e4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Center(
                child: Text(
                  model.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 21,
                    color: Color(0xFFaacedc),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.price,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFecdfcf),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 18)
        ],
      ),
    );
  }

  List<IconData> iconList = [
    Icons.pie_chart_outlined,
    Icons.branding_watermark,
    Icons.shopping_cart
  ];

  Widget getBottomBar(int index) {
    return GestureDetector(
      onTap: () {
        selectedIndex = index;
        setState(() {});
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconList[index],
              color: index == selectedIndex
                  ? Color(0xFFf6b889)
                  : Color(0xFF568398),
              size: 40,
            ),
            SizedBox(height: 5),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: index == selectedIndex
                      ? Color(0xFFF6b889)
                      : Color(0xFF568398),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF406376),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 36),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.settings,
                            color: Color(0xFFF5B788), size: 32),
                        Icon(Icons.blur_on, color: Color(0xFFF5B788), size: 32),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30),
                      Text(
                        "Choose you own ready design",
                        maxLines: 2,
                        style:
                            TextStyle(color: Color(0xFFFDF4e8), fontSize: 44),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: listModel
                          .toList()
                          .asMap()
                          .entries
                          .map((MapEntry map) {
                        return getListItems(map.value);
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFF223f50),
                  padding: EdgeInsets.symmetric(horizontal: 55),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: iconList.asMap().entries.map((MapEntry map) {
                        return getBottomBar(map.key);
                      }).toList()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Hexagon extends CustomClipper<Path> {
  double pi = 22 / 1260;
  @override
  Path getClip(Size size) {
    double perpendicular = (size.width / 2) * tan(30 * pi);
    double travel = (size.width / 2) / cos(30 * pi);

    final path = Path();

    path.lineTo(size.width / 2, 0);
    path.lineTo(0, perpendicular);
    path.lineTo(0, perpendicular + travel);
    path.lineTo(size.width / 2, 2 * perpendicular + travel);
    path.lineTo(size.width, perpendicular + travel);
    path.lineTo(size.width, perpendicular);
    path.lineTo(size.width / 2, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
