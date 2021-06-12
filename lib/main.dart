import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Task 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "Task2";
  String msg = "Task 2 ready";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
            semanticLabel: title,
            child: Column(
              children: [
                DrawerHeader(
                  child: Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Go For It!!',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      height: 100,
                      color: Colors.black),
                ),
                ListTile(
                  title: Text("Profile"),
                  leading: Icon(Icons.person_off_outlined),
                ),
                ListTile(
                  title: Text("Add card"),
                  leading: Icon(Icons.atm),
                  onTap: () {
                    print("Card added");
                  },
                ),
                ListTile(
                  title: Text("Add to Cart"),
                  leading: Icon(Icons.add_shopping_cart),
                  onTap: () {
                    print("Added to Cart");
                  },
                ),
                ListTile(
                  title: Text("Updates"),
                  leading: Icon(Icons.ac_unit),
                  onTap: () {
                    print("Updated");
                  },
                ),
                ListTile(
                  title: Text("Photo"),
                  leading: Icon(Icons.add_a_photo),
                  onTap: () {
                    print("Photo added");
                  },
                ),
                ListTile(
                  title: Text("Log out"),
                  leading: Icon(Icons.logout),
                ),
              ],
            )),
        appBar: AppBar(
          title: Text(title, style: TextStyle(color: Colors.white)),
          actions: [
            InkWell(
              child:
                  Icon(Icons.add_task_rounded, size: 50, color: Colors.white),
              onTap: () {
                setState(() {
                  title = "Welcome to Task2";
                });
              },
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    Image.network(
                        "https://cdn0.iconfinder.com/data/icons/teamwork-9/64/x-18-512.png",
                        width: 100,
                        height: 100,
                        fit: BoxFit.fill),
                    SizedBox(
                      width: 70,
                    ),
                    Image.asset("images/first_img.png",
                        width: 100, height: 100, fit: BoxFit.fill),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  msg,
                  style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                ),
                RaisedButton(
                  child: Text(
                    "Click Here",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: changeText,
                  color: Colors.red,
                  textColor: Colors.yellow,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.grey,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your name',
                    ),
                  ),
                ),
                FlatButton(
                  child: Text('Done'),
                  color: Colors.lightGreen,
                  onPressed: () => showToast(context),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Icon(Icons.whatshot, size: 60),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(Icons.camera_front, size: 60),
                    SizedBox(
                      width: 50,
                    ),
                    Icon(Icons.share, size: 60),
                    SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Oh! Thats a pretty good name'),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }

  changeText() {
    setState(() {
      if (msg.startsWith('T')) {
        msg = 'Lets Go';
      } else {
        msg = 'Task 2 is ready';
      }
    });
  }
}
