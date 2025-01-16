import 'package:equatable/equatable.dart';

class BookQuantityState extends Equatable {
  final int quantity;

  const BookQuantityState(this.quantity);

  @override
  List<Object> get props => [quantity];
}