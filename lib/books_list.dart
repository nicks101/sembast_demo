import 'package:flutter/material.dart';
import 'package:sembast_demo/dao/books_dao.dart';
import 'package:sembast_demo/model/books_model.dart';

class BookList extends StatefulWidget {
  @override
  _BookListState createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  BookDao dau = BookDao();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("book List"),
      ),
      body: Container(
        child: FutureBuilder<List<Book>>(
          future: dau.getAllbook(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == null) {
              print("asdff ${snapshot.data}");
              return Container(color: Colors.red);
            } else if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Book student = snapshot.data[index];

                    return snapshot.data.length == null
                        ? CircularProgressIndicator()
                        : ListTile(
                            title: Text(student.name),
                            subtitle: Text(student.rollNo.toString()),
                            trailing: Text(student.authors.length.toString()),
                            onTap: () async {
                              var nikki = Author(
                                name: "nikki",
                                last_name: "goel",
                              );
                              var ritwik = Author(
                                name: "new value added",
                                last_name: "ghosh",
                              );
                              var sid = Author(
                                name: "sid",
                                last_name: "R",
                              );

                              List<Author> authorList = [
                                // nikki,
                                // ritwik,
                                sid,
                              ];

                              student.authors.addAll(authorList);

                              await dau.updatebook(student).then(
                                  (value) => value.authors.forEach((element) {
                                        print(
                                            "${element.name} ${element.last_name}");
                                      }));

                              // student.authors.forEach((element) {
                              //   print(element.name);
                              // });
                              // setState(() {
                              //   dau.delete(Book(rollNo: student.rollNo));
//                       snapshot.data.removeAt(index);
                              // });
                            },
                          );
                  });
            } else {
              return Text('no data');
            }
          },
        ),
      ),
    );
  }
}
