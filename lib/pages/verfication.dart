import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:ecommerce_app/pages/home.dart'; // Adjust the import path as needed

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  late String _verificationCode;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final keyboardVisible = mediaQuery.viewInsets.bottom > 0;
    final bottomPadding =
        keyboardVisible ? mediaQuery.viewInsets.bottom + 16.0 : 16.0;

    return Scaffold(
      appBar: AppBar(
        title: Text("Verification"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Verify Your Email",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "We’ve sent a verification code to your email. Please enter it below to verify your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  SizedBox(height: 32),
                  Form(
                    key: _formKey,
                    child: VerificationCode(
                      keyboardType: TextInputType.number,
                      length: 6,
                      onCompleted: (String value) {
                        setState(() {
                          _verificationCode = value;
                        });
                      },
                      onEditing: (bool isEditing) {
                        // Handle editing state if needed
                        print('Editing state: $isEditing');
                      },
                      underlineColor: Colors.grey,
                      underlineUnfocusedColor: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_verificationCode.length == 6) {
                        // Handle the verification logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Verification code submitted!'),
                          ),
                        );

                        // Navigate to the Home page
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      } else {
                        // Show an error if the code is invalid
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Please enter a valid verification code'),
                          ),
                        );
                      }
                    },
                    child: Text('Verify'),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      // Handle resending the code
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Verification code resent!'),
                        ),
                      );
                    },
                    child: Text('Resend Code'),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: Container(
                height: 1, // Dummy container to ensure padding is respected
              ),
            ),
          ),
        ],
      ),
    );
  }
}
