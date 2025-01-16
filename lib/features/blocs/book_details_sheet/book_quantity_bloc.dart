import 'package:bloc/bloc.dart';
import 'package:centralogic_assignment/features/blocs/book_details_sheet/book_quantity_event.dart';
import 'package:centralogic_assignment/features/blocs/book_details_sheet/book_quantity_state.dart';

class BookQuantityBloc extends Bloc<BookQuantityEvent, BookQuantityState> {
  BookQuantityBloc() : super(const BookQuantityState(1)) {
    on<IncrementQuantity>((event, emit) {
      emit(BookQuantityState(state.quantity + 1));
    });

    on<DecrementQuantity>((event, emit) {
      if (state.quantity > 1) {
        emit(BookQuantityState(state.quantity - 1));
      }
    });
  }
}
