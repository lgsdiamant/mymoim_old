import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String _verificationId;
  bool _codeSent = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Authentication'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      hintText: 'Enter phone number',
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  _codeSent
                      ? TextField(
                          controller: _otpController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: 'Enter OTP',
                          ),
                        )
                      : Container(),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _codeSent ? _verifyOTP : _verifyPhone,
                    child: _codeSent ? const Text('Verify OTP') : const Text('Send OTP'),
                  ),
                ],
              ),
            ),
    );
  }

  void _verifyPhone() async {
    setState(() {
      _isLoading = true;
    });

    await _auth.verifyPhoneNumber(
      phoneNumber: '+91${_phoneNumberController.text}',
      verificationCompleted: (phoneAuthCredential) async {
        setState(() {
          _isLoading = false;
        });
        await _auth.signInWithCredential(phoneAuthCredential);
        Fluttertoast.showToast(
          msg: 'Phone number automatically verified and signed in.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
      verificationFailed: (verificationFailed) {
        setState(() {
          _isLoading = false;
        });
        Fluttertoast.showToast(
          msg: verificationFailed.message!,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
      codeSent: (verificationId, [forceResendingToken]) {
        setState(() {
          _isLoading = false;
          _codeSent = true;
          _verificationId = verificationId;
        });
        Fluttertoast.showToast(
          msg: 'OTP has been sent to your phone number.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
      codeAutoRetrievalTimeout: (verificationId) {
        setState(() {
          _isLoading = false;
          _verificationId = verificationId;
        });
        Fluttertoast.showToast(
          msg: 'OTP retrieval timeout.',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
      },
    );
  }

  void _verifyOTP() async {
    setState(() {
      _isLoading = true;
    });

    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
      verificationId: _verificationId,
      smsCode: _otpController.text,
    );

    await _auth.signInWithCredential(phoneAuthCredential).then((value) {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(
        msg: 'Phone number verified and signed in.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }).catchError((error) {
      setState(() {
        _isLoading = false;
      });
      Fluttertoast.showToast(
        msg: error.message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    });
  }
}
