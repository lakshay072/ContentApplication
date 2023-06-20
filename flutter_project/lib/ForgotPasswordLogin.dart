import 'package:flutter/material.dart';
import 'package:flutter_project/login.dart';

class ForgotPasswordLoginScreenLink extends StatefulWidget {
  const ForgotPasswordLoginScreenLink({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordLoginScreenLink> createState() =>
      _ForgotPasswordLoginScreenLinkState();
}

class _ForgotPasswordLoginScreenLinkState
    extends State<ForgotPasswordLoginScreenLink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        color: Colors.yellow.shade300,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/rwr-nobg.png'))),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  child: Text(
                    "Hey User,\nYour password has been changed successfully.\nPlease login to enjoy Rimone's services ",
                    style: TextStyle(
                      height: 1.3,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Padding(
                padding: const EdgeInsets.only(left: 80, right: 80),
                child: ElevatedButton(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login  ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.arrow_forward_rounded),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow.shade700,
                      side: BorderSide(color: Colors.black12, width: 6),
                      minimumSize: Size(150, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => Login()));
                    // Call backend service to verify OTP
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
