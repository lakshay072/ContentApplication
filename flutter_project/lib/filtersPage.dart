import 'package:flutter/material.dart';
import 'package:flutter_project/chargerList.dart';
import 'package:flutter_project/chargerPage.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}
bool _toggleValue1 = false;
bool _toggleValue2 = false;
bool _toggleValue3 = false;
bool _toggleValue4 = false;

class _FilterState extends State<Filter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Filter'),
      ),

      body:
      Column(
        children: [
          SizedBox(height: 10),
        Row(
          children: [
            Text(
            'Chargers',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 19.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
      ),
          ],
        ),
        Row(
          children: <Widget>[
            SizedBox(height: 100),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.5,
                    style: BorderStyle.solid
                  ),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text('ALl Chargers',
                    style: TextStyle(
                        color: Colors.blueGrey,
                    ),),
                ),
              ),
            ),
            SizedBox(width: 5),
        Expanded(
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey,
                  width: 1.5,
                  style: BorderStyle.solid
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text('AC',
                style: TextStyle(
                    color: Colors.blueGrey
                ),),
            ),
          ),
        ),
            SizedBox(width: 5),
        Expanded(
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.grey,
                  width: 1.5,
                  style: BorderStyle.solid
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: Text('DC',
              style: TextStyle(
                color: Colors.blueGrey
              ),),
            ),
          ),
        ),
            SizedBox(width: 5),
            ],
        ),
          //Another Section
          Divider(
            height: 10,
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Connectors',
                style: TextStyle(fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          //Another Section
          Divider(
            height: 10,
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discounts Section',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Switch(
                value: _toggleValue1,
                onChanged: (value) {
                  setState(() {
                    _toggleValue1 = value;
                  });
                },
                activeColor: Colors.yellow,
                inactiveThumbColor: Colors.black12,
                inactiveTrackColor: Colors.black38,
                activeTrackColor: Colors.orangeAccent,
              )
            ],
          ),
          SizedBox(height: 10),
          //Another Section
          Divider(
            height: 10,
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Available Chargers',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Switch(
                value: _toggleValue2,
                onChanged: (value) {
                  setState(() {
                    _toggleValue2 = value;
                  });
                },
                activeColor: Colors.yellow,
                inactiveThumbColor: Colors.black12,
                inactiveTrackColor: Colors.black38,
                activeTrackColor: Colors.orangeAccent,
              )
            ],
          ),
          SizedBox(height: 10),
          //Another Section
          Divider(
            height: 10,
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Free Chargers',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Switch(
                value: _toggleValue3,
                onChanged: (value) {
                  setState(() {
                    _toggleValue3 = value;
                  });
                },
                activeColor: Colors.yellow,
                inactiveThumbColor: Colors.black12,
                inactiveTrackColor: Colors.black38,
                activeTrackColor: Colors.orangeAccent,
              )
            ],
          ),
          SizedBox(height: 10),
          //Another Section
          Divider(
            height: 10,
            color: Colors.grey,
            thickness: 1,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amenities',
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Switch(
                value: _toggleValue4,
                onChanged: (value) {
                  setState(() {
                    _toggleValue4 = value;
                  });
                },
                activeColor: Colors.yellow,
                inactiveThumbColor: Colors.black12,
                inactiveTrackColor: Colors.black38,
                activeTrackColor: Colors.orangeAccent,
              )
            ],
          ),
          SizedBox(height: 10),
        ],
      )
      ,
    );
  }
}
