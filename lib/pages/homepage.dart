import 'package:flutter/material.dart';
import 'mobile_number.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String valueChoose;
  List listItem = ['English'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: CurvePainter1(),
            )),
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: CurvePainter2(),
            )),
        Column(children: [
          SizedBox(height: 150),
          Image.asset('assets/images/Gallery.png'),
          SizedBox(height: 40),
          Text('Please select your Language',
              style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text('You can change the language \nat any time.',
              style: TextStyle(
                  fontFamily: 'Roboto', fontSize: 15, color: Color(0xff6A6C7B)),
              textAlign: TextAlign.center),
          Padding(
            padding: const EdgeInsets.fromLTRB(70, 30, 70, 30),
            child: Container(
              padding: EdgeInsets.only(left: 8, right: 1),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: DropdownButton(
                  hint: Text('English',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                          color: Color(0xff2F3037))),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down, color: Color(0xff9C9C9C)),
                  iconSize: 30,
                  isExpanded: true,
                  underline: SizedBox(),
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  value: valueChoose,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoose = newValue;
                    });
                  },
                  items: listItem.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList()),
            ),
          ),
          FlatButton(
              height: 50,
              minWidth: 220,
              color: Color(0xff2E3B62),
              child: Text(
                'NEXT',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 19,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MobileNumber(),
                    fullscreenDialog: true,
                  )))
        ])
      ]),
    );
  }
}

class CurvePainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0xff93D2F3);
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.8,
        size.width * 0.5, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.99,
        size.width * 1.0, size.height * 0.92);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Color(0x802E3B62);
    paint.style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height * 0.88);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.98,
        size.width * 0.5, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.8,
        size.width * 0.9, size.height * 0.9);
    path.quadraticBezierTo(size.width * 0.945, size.height * 0.916, size.width,
        size.height * 0.91);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
