import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(selectedIndex: 0)) {
    on<SelectPage>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}
