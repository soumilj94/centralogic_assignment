import 'package:equatable/equatable.dart';
import 'package:centralogic_assignment/features/model/carousel_item.dart';

class CarouselState extends Equatable {
  final List<CarouselItem> items;
  final bool isLoading;
  final bool hasError;

  CarouselState({
    this.items = const [],
    this.isLoading = false,
    this.hasError = false,
  });

  CarouselState copyWith({
    List<CarouselItem>? items,
    bool? isLoading,
    bool? hasError,
  }) {
    return CarouselState(
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
    );
  }

  @override
  List<Object?> get props => [items, isLoading, hasError];
}