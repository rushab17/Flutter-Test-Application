import 'package:flutter/material.dart';

enum Profiles { Shipper, Transporter }

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Profiles _jobs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 150),
        Text('Please select your profile',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 23,
                fontWeight: FontWeight.bold)),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 12),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: ListTile(
              title: Row(children: [
                Image.asset('assets/images/Shipper.png'),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipper',
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 20),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 8),
                    Text('Lorem ipsum dolor sit amet,\nconsectetur adipiscing',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Color(0xff6A6C7B)))
                  ],
                )
              ]),
              leading: Radio(
                activeColor: Color(0xff2E3B62),
                toggleable: true,
                value: Profiles.Shipper,
                groupValue: _jobs,
                onChanged: (Profiles value) {
                  setState(() {
                    _jobs = value;
                  });
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            padding: EdgeInsets.only(top: 10, bottom: 12),
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: ListTile(
              title: Row(children: [
                Image.asset('assets/images/Transporter.png'),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Transporter',
                        style: TextStyle(fontFamily: 'Roboto', fontSize: 20)),
                    SizedBox(height: 8),
                    Text('Lorem ipsum dolor sit amet,\nconsectetur adipiscing',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            color: Color(0xff6A6C7B)))
                  ],
                )
              ]),
              leading: Radio(
                activeColor: Color(0xff2E3B62),
                toggleable: true,
                value: Profiles.Transporter,
                groupValue: _jobs,
                onChanged: (Profiles value) {
                  setState(() {
                    _jobs = value;
                  });
                  _jobs = value;
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 30),
        FlatButton(
            height: 60,
            minWidth: 320,
            color: Color(0xff2E3B62),
            child: Text(
              'CONTINUE',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 19,
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => Scaffold(
                          body: Center(
                        child: Text("App HomePage",
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 25,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold)),
                      ))));
            })
      ]),
    );
  }
}
