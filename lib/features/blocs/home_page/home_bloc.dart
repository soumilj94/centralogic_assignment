import 'dart:convert';
import 'package:centralogic_assignment/features/model/book.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';

class DashboardBloc extends Bloc<HomeEvent, HomeState> {
  DashboardBloc() : super(HomeState()) {
    on<FetchBooks>(_onFetchBooks);
  }

  Future<void> _onFetchBooks(FetchBooks event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));

    try {
      final String response = await rootBundle.loadString('assets/books.json');
      final List<dynamic> data = json.decode(response);

      final List<Book> books = data.map((json) => Book.fromJson(json)).toList();

      emit(state.copyWith(books: books, isLoading: false));
    } catch (error) {
      emit(state.copyWith(hasError: true, isLoading: false));
    }
  }
}
