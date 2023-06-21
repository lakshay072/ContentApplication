/*
import 'package:flutter/material.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  int _currentIndex = 0;

  void _verifyOtp() {
    // Call backend service to verify OTP
    // For the purpose of this example, we'll just go back to the login screen
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              for (int i = 0; i < 4; i++)
                SizedBox(
                  width: 50.0,
                  child: TextFormField(
                    controller: _controllers[i],
                    autofocus: i == 0,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          _currentIndex = i;
                        });
                        if (i < 3) {
                          FocusScope.of(context).nextFocus();
                        }
                      }
                    },
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      */
/*   if (value.isEmpty) {
                        return 'Please enter a digit';
                      }*/ /*

                      return null;
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // if (_formKey.currentState.validate()) {
          //   _verifyOtp();
          // }
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
*/



import 'package:flutter/material.dart';
import 'package:flutter_project/dashboard.dart';
import 'package:flutter_project/OtpLogin.dart';
import 'package:flutter_project/StartupScreen.dart';
import 'package:flutter_project/homepage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class OtpVerificationPage extends StatefulWidget {
  final int gen_OTP;
  final UserPhone;

  OtpVerificationPage(
      {Key? key, required this.gen_OTP, required this.UserPhone})
      : super(key: key);

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  @override
  void initState() {
    super.initState();
    otp_verification(widget.gen_OTP, widget.UserPhone);
  }

  void otp_verification(gen_OTP, UserPhone) async {
    print("********The OTP is: $gen_OTP");
    print("********The Phone Number is: $UserPhone");
  }

  //Defining Controller for OTP
  TextEditingController otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Otp Verification'),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 1,
            //color: Colors.black,
            child: Text(
              ' Please Enter OTP ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 1,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 20, bottom: 20, right: 80, left: 80),
              child: TextField(
                  controller: otp,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.yellow,
                    )),
                    labelText: 'OTP',
                  )),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String userOTP = otp.text.trim();
              if (userOTP.isEmpty) {
                // Show an error message if the OTP field is empty
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Please enter the OTP')),
                );
              } else if (int.tryParse(userOTP) != widget.gen_OTP) {
                // Show an error message if the entered OTP doesn't match the generated OTP
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Incorrect OTP')),
                );
              } else {
               /* if (widget.userID != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DashboardScreen(userID: widget.userID)),
                  )
                }
                  else {*/
                  // Navigate to the desired page if the OTP matches
                  registeruser(widget.UserPhone, context, DashboardScreen);
               // }
              }
            },
            child: Text('Verify OTP'),
          ),
        ],
      ),
    );
  }
}

void registeruser(UserPhone, context, DashboardScreen) async {
  /*
      final dio = Dio(); // create a Dio instance

      // set headers
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer your_access_token_here",
      };

      // create request data
      Map<String, dynamic> data = {
        "name": name.text,
        "email": email.text,
        "phone": phone.text,
        "password": password.text,
      };

      try {
        // send POST request with headers
        final response = await dio.post(
          'http://3.229.255.54:3000/api/users',
          data: data,
          options: Options(headers: headers),
        );

        // handle response
        print(response.data);
      } catch (e) {
        // handle error
        print(e.toString());
      }
    }*/

  final url = 'http://dev.rimone.online:3000/api/users';
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf'
  };
  final body = jsonEncode({
    //"guid": '256',
    "phone": UserPhone,
    //"name": 'Guest1',
    //"email": 'guest@gmail.com',
    //"password": 'guesthello',
  });

  http.post(Uri.parse(url), headers: headers, body: body).then((response) {
    if (response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      if ('id' != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DashboardScreen(userID: jsonResponse['id'])),
        );
      } else {
        print('Authentication failed.');
        // Show error message on screen
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Invalid Username or Password. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  });
}
