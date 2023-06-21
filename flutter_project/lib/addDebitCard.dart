import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Card'),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, right: 20, left: 20, bottom: 1,),
              child: Container(
                alignment: AlignmentDirectional.topStart,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('Enter Your Card Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 1, right: 20, left: 20, bottom: 5,),
              child: Center(
                child: Container(
                  height: 220,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4, right: 20, left: 20, bottom: 5,),
                    child: Column(
                      children: [
                        TextField(
                      style: TextStyle(
                        backgroundColor: Colors.white,
                      ),
                    ),
                        TextField(
                          style: TextStyle(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        TextField(
                          style: TextStyle(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        TextField(
                          style: TextStyle(
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {},
                            child: Text('Add')),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
      ),
    );
  }
}
