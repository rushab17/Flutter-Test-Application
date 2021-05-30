import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_selection.dart';

class OTPScreen extends StatefulWidget {
  final String phone, internationalnumber;
  OTPScreen(this.phone, this.internationalnumber);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  String pin;
  String verificationCode;
  String otp, authStatus = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color(0xff93D2F3),
  );

  Future<void> verifyPhoneNumber() async {
    await _auth.verifyPhoneNumber(
        phoneNumber: widget.internationalnumber,
        timeout: const Duration(seconds: 20),
        verificationCompleted: (AuthCredential authCredential) {},
        verificationFailed: (FirebaseAuthException authException) {
          setState(() {});
          _scaffoldKey.currentState
              .showSnackBar(SnackBar(content: Text(authException.message)));
        },
        codeSent: (String verificationId, [int forceCodeResent]) {
          verificationCode = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationCode = verificationId;
        });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.internationalnumber);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xff2F3037)),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 75),
            Text('Verify Phone',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 9),
            Text(
              'Code is sent to ${widget.phone}',
              style: TextStyle(
                  fontFamily: 'Roboto', fontSize: 15, color: Color(0xff6A6C7B)),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
              child: PinPut(
                fieldsCount: 6,
                textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                eachFieldWidth: 48.0,
                eachFieldHeight: 48.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
                onSubmit: (enteredpin) {
                  pin = enteredpin;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\u{2019}t received the code?',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 15,
                      color: Color(0xff6A6C7B)),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () async {
                    await _auth.verifyPhoneNumber(
                        phoneNumber: widget.internationalnumber,
                        timeout: const Duration(seconds: 20),
                        verificationCompleted: (AuthCredential authCredential) {
                          setState(() {
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text("Code Sent")));
                          });
                        },
                        verificationFailed:
                            (FirebaseAuthException authException) {
                          setState(() {});
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text(authException.message)));
                        },
                        codeSent: (String verificationId,
                            [int forceCodeResent]) {
                          verificationCode = verificationId;
                          setState(() {
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text("Code Sent Again")));
                          });
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {
                          verificationCode = verificationId;
                        });
                  },
                  child: Text(
                    " Request Again",
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Roboto',
                        color: Color(0xff2E3B62)),
                  ),
                )
              ],
            ),
            SizedBox(height: 25),
            FlatButton(
                height: 60,
                minWidth: 320,
                color: Color(0xff2E3B62),
                child: Text(
                  'VERIFY AND CONTINUE',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 17,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  await _auth
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Profile()),
                          (route) => false);
                    }
                  });
                })
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }
}
