import 'package:architect_ui/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Architect Ui',
      debugShowCheckedModeBanner: false,
      home: ArchitectUI(),
    );
  }
}

class ArchitectUI extends StatefulWidget {
  @override
  _ArchitectUIState createState() => _ArchitectUIState();
}

class _ArchitectUIState extends State<ArchitectUI> {
  double pi = 22 / 1260;

  /// Make a 3d box with the use of four containers
  Widget get3DBox(
      {int color1,
      int color2,
      int color3,
      int color4,
      int color5,
      BoxShadow boxShadow,
      double start = 0.0,
      double top = 0.0,
      scale = 1.0,
      double width = double.infinity,
      double height = double.infinity}) {
    Matrix4 matrix = Matrix4.identity();
    matrix.rotateZ(45 * pi);

    return Positioned.directional(
      textDirection: TextDirection.ltr,
      start: start,
      top: top,
      child: Transform.scale(
        scale: scale,
        child: Container(
          width: width,
          height: height,
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Positioned.directional(
                textDirection: TextDirection.ltr,
                top: 60,
                child: Transform(
                  transform: Matrix4.skewY(-50 / 100),
                  child: Container(
                    width: 110,
                    height: 120,
                    color: Color(color1),
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 110,
                child: Transform(
                  transform: Matrix4.skewY(50 / 100),
                  child: Container(
                    width: 110,
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          Color(color2),
                          Color(color3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 33,
                top: 102,
                child: Transform(
                  transform: Matrix4.rotationX(57 * pi),
                  origin: Offset(77, 77),
                  child: Transform(
                    transform: matrix,
                    origin: Offset(77, 77),
                    child: Container(
                      width: 156,
                      height: 156,
                      decoration: BoxDecoration(
                        boxShadow: [
                          boxShadow == null
                              ? BoxShadow(color: Colors.transparent)
                              : boxShadow,
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: <Color>[
                            Color(color4),
                            Color(color5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFCE8CD),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Stack(
                    children: <Widget>[
                      get3DBox(
                        color1: 0xFF52737F,
                        color2: 0xFF1B3B46,
                        color3: 0xFF3B5865,
                        color4: 0xFF1D353F,
                        color5: 0xFF28434D,
                        start: 22,
                        top: 264,
                        scale: 0.87,
                        width: 220,
                        height: 290,
                        boxShadow: BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: Offset(22, 0),
                          blurRadius: 45,
                          spreadRadius: 0.3,
                        ),
                      ),
                      get3DBox(
                          color1: 0xFFDAA184,
                          color2: 0xFF785657,
                          color3: 0xFFB2826B,
                          color4: 0xFF72584A,
                          color5: 0xFF987562,
                          start: 242,
                          top: 375,
                          scale: 0.46,
                          width: 220,
                          height: 240),
                      get3DBox(
                        color1: 0xFFEACBAC,
                        color2: 0xFFB28A70,
                        color3: 0xFFBE997C,
                        color4: 0xFF9D7D63,
                        color5: 0xFFDFB38E,
                        start: 230,
                        top: -44,
                        scale: 1.4,
                        width: 220,
                        height: 290,
                        boxShadow: BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          offset: Offset(22, 0),
                          blurRadius: 45,
                          spreadRadius: 0.3,
                        ),
                      ),
                      Positioned.directional(
                        textDirection: TextDirection.ltr,
                        start: 40,
                        top: 500,
                        child: Container(
                          width: 250,
                          child: Text(
                            "Ready made rooms to go",
                            maxLines: 2,
                            overflow: TextOverflow.visible,
                            style: TextStyle(
                                color: Color(0xFFFDF4E8), fontSize: 40),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 2),
                    color: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Virtual digital showrooms transform your dreams into reality at one touch of screen.",
                          maxLines: 3,
                          style:
                              TextStyle(color: Color(0xFF8CADBC), fontSize: 21),
                        ),
                        SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Color(0xFFF5B788), width: 3)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  "Get Started",
                                  style: TextStyle(
                                    color: Color(0xFFF5B788),
                                    fontSize: 28,
                                  ),
                                ),
                                Transform.rotate(
                                  angle: 180 * pi,
                                  child: Icon(
                                    Icons.keyboard_backspace,
                                    size: 35,
                                    color: Color(0xFFF5B788),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Paints the background inclined lines.
class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color(0xFF2B4A5B);

    var path = Path();

    path.lineTo(0, .21 * size.height);
    path.lineTo(0.26 * size.width, .28 * size.height);
    path.lineTo(0.26 * size.width, .45 * size.height);
    path.lineTo(0.565 * size.width, .521 * size.height);
    path.lineTo(0.85 * size.width, .44 * size.height);
    path.lineTo(size.width, .475 * size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
