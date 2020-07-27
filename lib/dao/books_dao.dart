import 'package:sembast/sembast.dart';
import 'package:sembast_demo/db/data_base.dart';
import 'package:sembast_demo/model/books_model.dart';

class BookDao {
  static const String folderName = "book";
  final _bookFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insertbook(Book book) async {
    await _bookFolder.add(await _db, book.toJson());
  }

  Future<Book> updatebook(Book book) async {
    final finder = Finder(filter: Filter.byKey(book.rollNo));
    // await _bookFolder.update(await _db, book.toJson(), finder: finder);
    var result =
        await _bookFolder.record(book.rollNo).put(await _db, book.toJson());
    print(result);
    print(book.authors.length);
    return book;
  }

  Future delete(Book book) async {
    final finder = Finder(filter: Filter.byKey(book.rollNo));
    await _bookFolder.delete(await _db, finder: finder);
  }

  Future<List<Book>> getAllbook() async {
    final recordSnapshot = await _bookFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final book = Book.fromJson(snapshot.value);
      return book;
    }).toList();
  }
}
