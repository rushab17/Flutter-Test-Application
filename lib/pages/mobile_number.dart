import 'package:flutter/material.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'otp_verification.dart';

class MobileNumber extends StatefulWidget {
  @override
  _MobileNumberState createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  String phone, internationalnumber;
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phone = number;
      internationalnumber = internationalizedPhoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          iconTheme: IconThemeData(color: Color(0xff2F3037)),
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          child: Column(children: [
            SizedBox(height: 60),
            Text('Please enter your mobile number',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              'You\u{2019}ll receive a 6 digit code \nto verify next.',
              style: TextStyle(
                  fontFamily: 'Roboto', fontSize: 15, color: Color(0xff6A6C7B)),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 35, 20, 30),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: InternationalPhoneInput(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Mobile Number',
                      ),
                      onPhoneNumberChange: onPhoneNumberChange,
                      initialPhoneNumber: phone,
                      initialSelection: "IN",
                      showCountryCodes: true,
                    )),
              ),
            ),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              OTPScreen(phone, internationalnumber)));
                }),
          ]),
        ));
  }
}
