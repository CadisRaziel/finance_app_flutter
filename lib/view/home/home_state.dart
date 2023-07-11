abstract class HomeState {}

class HomeitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSucessState extends HomeState {}

class HomeErrorState extends HomeState {
  final String message;
  HomeErrorState(this.message);
}
