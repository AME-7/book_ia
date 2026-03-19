class DetailsState {}

class DetailsInitial extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsSuccessState extends DetailsState {
  final String msg;
  DetailsSuccessState({required this.msg});
}

class DetailsErrorState extends DetailsState {}
