import 'package:flutter/material.dart';
import 'package:flutter_project/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*class Dashboard extends StatefulWidget {
  final userId;

  Dashboard({this.userId});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final response = await http.get(Uri.parse('https://your-api-url.com/users/${widget.userId}'));

    if (response.statusCode == 200) {
      setState(() {
        userData = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: userData != null
          ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome ${userData['name']}',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 16),
          Text(
            'Your email is ${userData['email']}',
            style: TextStyle(fontSize: 18),
          ),
        ],
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}*/
/*
class Dashboard extends StatefulWidget {
  final String userId;

  Dashboard({required this.userId});

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Map<String, dynamic> userData = {};

  @override
  void initState() {
    super.initState();
    getUserData(widget.userId).then((data) {
      setState(() {
        userData = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: userData.isNotEmpty
            ? Text('Welcome, ${userData['name']}')
            : CircularProgressIndicator(),
      ),
    );
  }
}

*/
/*
class Dashboard extends StatefulWidget {
  final String userId;

  const Dashboard({Key? key, this.userId}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Data> _dataList;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    final url = 'http://3.229.255.54:3000/api/users/{id}';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      setState(() {
        _dataList = List<Data>.from(jsonData.map((x) => Data.fromJson(x)));
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: _dataList == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: _dataList.length,
        itemBuilder: (BuildContext context, int index) {
          final data = _dataList[index];
          return ListTile(
            title: Text(data.title),
            subtitle: Text(data.description),
          );
        },
      ),
    );
  }
}
*/
/*class Dashboard extends StatefulWidget {
  final dynamic data;

  Dashboard({Key? key, required this.data}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the dashboard!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your data:',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            // Display the data on the screen
            Text(
              widget.data.toString(),
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required userID}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<SamplePosts> samplePosts = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context, snapshot) {
        if(snapshot.hasData)
          {
            return ListView.builder(
                itemCount: samplePosts.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    color: Colors.amber,
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ID: ${samplePosts[index].id}', style: TextStyle(fontSize: 20),),
                        Text('GUID: ${samplePosts[index].guid}', style: TextStyle(fontSize: 20),),
                        Text('Name: ${samplePosts[index].name}', style: TextStyle(fontSize: 20),),
                        Text('Email: ${samplePosts[index].email}', style: TextStyle(fontSize: 20),),
                        Text('Phone: ${samplePosts[index].phone}', style: TextStyle(fontSize: 20),),
                        Text('Username: ${samplePosts[index].password}',maxLines: 1, style: TextStyle(fontSize: 20),),
                      ],
                    ),
                  );
                });
          }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
  Future<List<SamplePosts>> getData() async {
    //print("MyUser ID is#####: ${userID}");
    final response = await http.get(Uri.parse('http://dev.rimone.online:3000/api/users'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      for(Map<String, dynamic> index in data){
        samplePosts.add(SamplePosts.fromJson(index));
      }
      return samplePosts;
    }
    else
      {
        return samplePosts;
      }
  }
}



/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataModel {
  final int id;
  final String name;
  final String email;

  DataModel({required this.id, required this.name, required this.email});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

class Dashboard extends StatefulWidget {
  final int id;

  const Dashboard({Key? key, required this.id}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<DataModel> _data;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse('http://3.229.255.54:3000/api/users'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _data = (jsonData as List)
          .map((jsonObject) => DataModel.fromJson(jsonObject))
          .where((data) => data.id == widget.id)
          .toList();
      setState(() {});
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Screen'),
      ),
      body: _data != null
          ? ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final data = _data[index];
          return Card(
            child: ListTile(
              title: Text(data.name),
              subtitle: Text(data.email),
            ),
          );
        },
      )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
*//*



*/
/*
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  *//*

*/
/*final String name;
  final String email;
  final String phone;

  PersonalDetailsPage({this.name, this.email, this.phone});
*//*
*/
/*

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Email:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'Phone:',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
*/


