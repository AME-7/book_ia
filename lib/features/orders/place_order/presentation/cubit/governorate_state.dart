class PlaceOrderState {}

class PlaceOrderInitial extends PlaceOrderState {}

class GovernoratesLoadingState extends PlaceOrderState {}

class GovernoratesSuccessState extends PlaceOrderState {}

class GovernoratesErrorState extends PlaceOrderState {}

class PlaceOrderLoadingState extends PlaceOrderState {}

class PlaceOrderSuccessState extends PlaceOrderState {
  final int orderId;
  PlaceOrderSuccessState({required this.orderId});
}

class PlaceOrderErrorState extends PlaceOrderState {}
