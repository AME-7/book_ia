import 'package:book_ia/features/home/data/models/slider_response/slider.dart';
import 'package:book_ia/features/home/data/repository/home_repo.dart';
import 'package:book_ia/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo repo;

  HomeCubit(this.repo) : super(HomeInitialState());

  List<Slider> sliders = [];

  Future<void> initLoadData() async {
    emit(HomeloadingState());

    try {
      final sliderResponse = await repo.getSliders();
      final books = await repo.getBestSellersBooks();

      sliders = sliderResponse.data?.sliders ?? [];

      emit(HomeSuccessState(books));
    } catch (e) {
      emit(HomeErrorState());
    }
  }
}
