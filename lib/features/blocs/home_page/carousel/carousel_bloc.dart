import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'carousel_event.dart';
import 'carousel_state.dart';
import 'package:centralogic_assignment/features/model/carousel_item.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselState()) {
    on<FetchCarouselItems>(_onFetchCarouselItems);
  }

  Future<void> _onFetchCarouselItems(
      FetchCarouselItems event, Emitter<CarouselState> emit) async {
    emit(state.copyWith(isLoading: true, hasError: false));

    try {
      final String response = await rootBundle.loadString('assets/books.json');
      final List<dynamic> data = jsonDecode(response);

      // convert json to a list
      final items = data.map((item) => CarouselItem(
        id: item['id'],
        name: item['name'],
        description: item['description'],
        price: item['price'],
        rating: item['rating'],
        availability: item['availability'],
        vendor_image: item['vendor_image'],
        image: item['image'],
      )).toList();

      emit(state.copyWith(items: items, isLoading: false));
    } catch (_) {
      emit(state.copyWith(isLoading: false, hasError: true));
    }
  }
}
