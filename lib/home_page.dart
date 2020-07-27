import 'package:flutter/material.dart';
import 'package:sembast_demo/dao/books_dao.dart';
import 'package:sembast_demo/model/books_model.dart';
import 'package:sembast_demo/books_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController markController = TextEditingController();
  TextEditingController authorController = TextEditingController();

  BookDao dau = BookDao();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Books Entry Page"),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              textAlign: TextAlign.start,
              onFieldSubmitted: (val) {},
              style: TextStyle(),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Add Book Name",
                labelStyle: TextStyle(
                  fontSize: 17,
                ),
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: markController,
              textAlign: TextAlign.start,
              onFieldSubmitted: (val) {},
              keyboardType: TextInputType.numberWithOptions(),
              style: TextStyle(),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Add your roll number",
                labelStyle: TextStyle(
                  fontSize: 17,
                ),
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: authorController,
              textAlign: TextAlign.start,
              onFieldSubmitted: (val) {},
              style: TextStyle(),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Add Author",
                labelStyle: TextStyle(
                  fontSize: 17,
                ),
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.7),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 100,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  dau.insertbook(
                    Book(
                      name: nameController.text,
                      rollNo: int.parse(markController.text),
                      authors: [
                        Author(name: authorController.text),
                      ],
                    ),
                  );
                  nameController.clear();
                  markController.clear();
                  authorController.clear();
                },
                color: Colors.blue,
                child: Text(
                  "Submit",
                  style: TextStyle(color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 120,
              height: 50,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BookList()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                color: Colors.blue,
                child: Text(
                  "See the List",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
