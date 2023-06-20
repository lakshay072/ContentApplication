import 'package:flutter/material.dart';
import 'package:flutter_project/ProfileDrawer.dart';


class VehicleInfo extends StatefulWidget {
  const VehicleInfo({Key? key}) : super(key: key);

  @override
  State<VehicleInfo> createState() => _VehicleInfoState();

}


String dropdownValue = 'Option 1';


class _VehicleInfoState extends State<VehicleInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Vehicle Information'),
      ),
      body:
      SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(left:12.0, right:12.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Manufacturer/Make',
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left:12.0, right:12.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Model',
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left:12.0, right:12.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Registration Number',
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left:12.0, right:12.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Charger Type',
              ),
            ),
          ),
          SizedBox(height: 20),
      DropdownButton<String>(
        value: dropdownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),

          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  alignment: AlignmentDirectional.center,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )
                ),
                child: Text('Add')
            ),
          ),
          SizedBox(height: 50),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:20.0),
                child: Text('Added Vehicles:',
                style: TextStyle(
                  fontSize: 15,
                ),),
              ),
            ],
          )
        ],
      ),
      ),
      );
  }
}
