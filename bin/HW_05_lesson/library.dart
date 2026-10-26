import 'book.dart';

class Library {
  String name;
  List<Book> _books = [];

  Library(this.name);

  void addBook(Book book) {
    _books.add(book);
  }

  void showBooks() {
    print('Library: $name');
    print('Books list:');

    for (int i = 0; i < _books.length; i++) {
      print('${i + 1}. ${_books[i].title}');
    }
  }

  int get totalBooks => _books.length;
}
