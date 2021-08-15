import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
        accentColor: Colors.green,
      ),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List TODOS = [];
  String input = "";
  @override
  void initState() {
    super.initState();
    // TODOS.add("ITEM1");
    // TODOS.add("ITEM2");
    // TODOS.add("ITEM3");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Your TODO List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text("ADD TODO LIST"),
                  content: TextField(
                    decoration: new InputDecoration(
                        hintText: "Enter a String",
                        hintStyle: TextStyle(fontSize: 22.0)),
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          setState(() {
                            TODOS.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "ADD",
                          style: TextStyle(color: Colors.blueAccent),
                        ))
                  ],
                );
                // Navigator.of(context).pop();
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: TODOS.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(TODOS[index]),
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    title: Text(TODOS[index]),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            TODOS.removeAt(index);
                          });
                        }),
                  ),
                ));
          }),
    );
  }
}
