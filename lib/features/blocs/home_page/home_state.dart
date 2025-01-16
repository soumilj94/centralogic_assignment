import 'package:centralogic_assignment/features/model/book.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final List<Book> books;
  final bool isLoading;
  final bool hasError;

  const HomeState({
    this.books = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  HomeState copyWith({
    List<Book>? books,
    bool? isLoading,
    bool? hasError,
  }) {
    return HomeState(
      books: books ?? this.books,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [books, isLoading, hasError];
}
