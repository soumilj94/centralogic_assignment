import 'package:equatable/equatable.dart';

abstract class BookQuantityEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class IncrementQuantity extends BookQuantityEvent {}

class DecrementQuantity extends BookQuantityEvent {}