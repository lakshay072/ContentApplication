import 'package:flutter/material.dart';
import 'package:flutter_project/ChargerPage.dart';
import 'package:flutter_project/globals.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

import 'charger_provider.dart';
import 'charger_provider.dart';
import 'charger_provider.dart';

class ChargerList extends StatefulWidget {
  const ChargerList({Key? key}) : super(key: key);

  @override
  State<ChargerList> createState() => _ChargerListState();
}

class _ChargerListState extends State<ChargerList> {
  @override
  void initState() {
    super.initState();
    chargerlist();
  }

  List<dynamic> listResponse = [];

  chargerlist() async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf',
    };
    http.Response response = await http.get(
        Uri.parse('http://dev.rimone.online:3000/api/chargers'),
        headers: headers);
    var mapResponse = json.decode(response.body);
    if (response.statusCode == 200) {
      print("THE RESPONSE BODY IS ${response.body}");
      print("THE MAP RESPONSE BODY IS ${mapResponse}");

      setState(() {
        listResponse = mapResponse;
      });
    }

/* if (listResponse != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChargerScreen(chargerID: 'id')),
      );
    } else {
      Text("Error");
    }*/
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Charger List Page"),
      ),
      body: Consumer<ChargerProvider>(
        builder:(context , ChargerListProviderModel, child ) => Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: Colors.black,
                                width: 2.0,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChargerScreen(
                                          chargerID: listResponse[index]['id'])),
                                );
/*                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ChargerInfo(chargerID: listResponse[index]['id'])),
                                  );*/
                              },
                              child: Text(
                                listResponse[index]["name"],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: Text("${ChargerListProviderModel.chargerList[index].id.toString()}"),
                        ),

                      ],
                    ),
                  );
                },
                itemCount: ChargerListProviderModel.chargerList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
/*
class ChargerList extends StatefulWidget {
  const ChargerList({Key? key}) : super(key: key);

  @override
  State<ChargerList> createState() => _ChargerListState();
}

class _ChargerListState extends State<ChargerList> {
  List chargers = []; // state variable to store list of chargers
  chargerlist() async{
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf',
    };
    final url = Uri.parse('http://dev.rimone.online:3000/api/chargers' );
    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        print(response.body);
        print(jsonResponse);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Request failed with error: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Text('Charger List'),
            ),
            TextButton(
              onPressed: () {
                chargerlist();
              },
              child: Text('To get charger List'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chargers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(chargers[index]['name']),
                    subtitle: Text(chargers[index]['address']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/


class ChargerList extends StatefulWidget {
  const ChargerList({Key? key}) : super(key: key);

  @override
  _ChargerListState createState() => _ChargerListState();
}

class _ChargerListState extends State<ChargerList> {
  List<dynamic> listResponse = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer c060263a-4c4c-3c3b-8475-e87f3b29e9cf',
    };

    final url = Uri.parse('http://dev.rimone.online:3000/api/chargers' );
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      setState(() {
        listResponse = json.decode(response.body);
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charger List'),
      ),
      body: listResponse.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: listResponse.length,
        itemBuilder: (context, index) {
          final charger = listResponse[index];
          return ListTile(
            title: Text(charger['name']),
            //subtitle: Text(charger['description']),
            // Add other relevant information from the response
          );
        },
      ),
    );
  }

}*/
