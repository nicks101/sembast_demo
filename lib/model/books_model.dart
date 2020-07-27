import 'package:flutter/rendering.dart';

class Author {
  String name;
  String last_name;

  Author({
    this.name,
    this.last_name,
  });

  static Author fromJson(Map<String, dynamic> json) {
    try {
      return Author(
        name: json["name"],
        last_name: json['last_name'],
      );
    } catch (e) {
      print(e);
      print(
          "Author: *********************************************************");
    }
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "last_name": last_name,
      };
}

class Book {
  int rollNo;
  String name;
  List<Author> authors;

  Book({
    this.rollNo,
    this.name,
    this.authors,
  });

  static Book fromJson(Map<String, dynamic> json) {
    try {
      List<Author> authors_temp = [];
      (json["authors"] as List).forEach((element) {
        authors_temp.add(Author.fromJson(element));
      });
      return Book(
        rollNo: json["rollNo"],
        name: json["name"],
        authors: authors_temp ?? [],
        // List<Author>.(json["authors"].map((x) => Author.fromJson(x))),
      );
    } catch (e) {
      print(e);
      print("Book: *********************************************************");
    }
  }

  Map<String, dynamic> toJson() {
    try {
      List<Map<String, dynamic>> authors_temp = [];
      this.authors.forEach((element) {
        authors_temp.add(element.toJson());
      });

      return {
        "rollNo": rollNo,
        "name": name,
        "authors": authors_temp,
        // List<Author>.from(authors.map((x) => x.toJson())),
      };
    } catch (e) {
      print(
          "Book toJson: *********************************************************");
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    return """
    id: $rollNo,
    name: $name
    ----------------------------------
    """;
  }
}

//Create a sample object
var nikki = Author(name: "nikki");
var ritwik = Author(name: "ritwik");
var sid = Author(name: "sid");

List<Author> authorList = [
  nikki,
  ritwik,
  sid,
];

var book = Book(name: "Test", rollNo: 97, authors: authorList);
