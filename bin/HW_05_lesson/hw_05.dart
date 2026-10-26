//Hi sensei!

import 'book.dart';
import 'library.dart';

void main() {
  Book book1 = Book('Harry Potter', 'J.K. Rowling');
  
  Book book2 = Book.withRating('Sherlock Holmes', 'Arthur Conan Doyle', 9.5);
 
  Book book3 = Book('The Hobbit', 'J.R.R. Tolkein');
  book3.rating = 8.5;

  Library citylab = Library('City Library');
  
  citylab.addBook(book1);
  citylab.addBook(book2);
  citylab.addBook(book3);

  book2.displayInfo();

  print('');
  citylab.showBooks();

  print('Total books in library: ${citylab.totalBooks}');
}
