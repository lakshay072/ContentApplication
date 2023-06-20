import 'package:flutter/material.dart';
import 'package:flutter_project/app_bar.dart';
import 'package:flutter_project/bottom_app_bar.dart';
import 'package:http/http.dart' as http;

class ConnectChargerScreen extends StatefulWidget {
  const ConnectChargerScreen({Key? key}) : super(key: key);

  @override
  State<ConnectChargerScreen> createState() => _ConnectChargerScreenState();
}

class _ConnectChargerScreenState extends State<ConnectChargerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green.shade100,
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              /************************** Charger Details **********************************/
              Center(
                child: Text(
                  'Plug the connector and Swipe to start',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.yellow.shade600,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 5, bottom: 2),
                              child: Text(
                                'Charger Name',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Regency1',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.yellow.shade600,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, top: 5, bottom: 2),
                              child: Text(
                                'Connector 1 - Type 2',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundImage: AssetImage(
                                          'assets/charger/DC_type2.png'),
                                      backgroundColor: Colors.transparent,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Available',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      height:MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.135,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.yellow.shade600,
                      ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text('AC',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text('7.4kw',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                            ),),
                        ),
                      ],
                    ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              /************************** Charging Cost **********************************/
              Center(
                child: Text(
                  'How would you like us to charge?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.yellow.shade600,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              /************************** Discount Offers **********************************/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Discount Offers',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.yellow.shade600,
                        //backgroundBlendMode: BlendMode.softLight,
                      ),
                      child: TextButton(
                        child: Text('View',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),),
                        onPressed: () {

                        },
                      ),
                    ),
                  )
                ],
              ),
              /************************** Estimated Charging Cost **********************************/
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Estimated Charging Cost',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( right: 10),
                    child: TextButton(
                        child: Text("Rs. '_est_XXX incl GST" ,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {

                        },
                      ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomAppBar(),
    );
  }
}
