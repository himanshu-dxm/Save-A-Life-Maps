import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:save_a_life_maps/screens/home.dart';
import 'package:save_a_life_maps/widgets/common_styles.dart';

class OTPScreen extends StatefulWidget {

  final String phoneNumber;

  OTPScreen({required this.phoneNumber});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _otpTextEditingController = TextEditingController();
  // final FocusNode _pinOTPCodeFocus = FocusNode();

  String? _verificationCode;

  void authenticateUser() async {
    try {
      FirebaseAuth auth=FirebaseAuth.instance;
      // await auth.verifyPhoneNumber(
      //     phoneNumber: "+919934161540",
      //     verificationCompleted: (PhoneAuthCredential credential) async {
      //       await auth.signInWithCredential(credential);
      //     },
      //     verificationFailed: (FirebaseAuthException e) {
      //       if(e.code == 'invalid-phone-number') {
      //         print('The provided phone number is not valid');
      //       } else {
      //         print(e.message);
      //       }
      //     },
      //     codeSent: (String verificationId, int? resendToken) async {
      //       String smsCode = _otpTextEditingController.text;
      //       PhoneAuthCredential credential = PhoneAuthProvider.credential(
      //           verificationId: verificationId,
      //           smsCode: smsCode
      //       );
      //
      //       await auth.signInWithCredential(credential);
      //     },
      //     codeAutoRetrievalTimeout: (String verificationId) {},
      // );

      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
          verificationId: _verificationCode!,
          smsCode: _otpTextEditingController.text))
          .then((value) {
            if(value.user != null) {
              print("Logged In Success");
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
            }
      });


    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(CommonStyles.snackBar(context, "Invalid OTP"));
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Verifying ${widget.phoneNumber}',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            child: TextFormField(
              decoration: CommonStyles.textFieldStyle("Enter OTP"),
              controller: _otpTextEditingController,
            ),
          ),
          SizedBox(height: 8,),
          GestureDetector(
            onTap: () async{
              authenticateUser();
            },
            child: CommonStyles.roundButton(context, "Submit"),
          )
        ],
      ),
    );
  }
}
