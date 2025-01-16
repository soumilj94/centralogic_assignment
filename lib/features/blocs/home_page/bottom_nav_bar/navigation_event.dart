abstract class NavigationEvent {}

class SelectPage extends NavigationEvent {
  final int index;
  SelectPage(this.index);
}
