import 'package:book_ia/features/home/data/models/best_seller_book_response/best_seller_book_response.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:book_ia/features/home/data/models/slider_response/slider.dart';
import 'package:book_ia/features/home/data/models/slider_response/slider_response.dart';
import 'package:book_ia/features/home/data/repository/home_repo.dart';
import 'package:book_ia/features/home/presentation/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<Slider> sliders = [];
  List<Product> products = [];

  Future<void> initLoadData() async {
    emit(HomeloadingState());

    var responses = await Future.value([
      await HomeRepo.getSliders(),
      await HomeRepo.getBestSellersBooks(),
    ]);

    var slidersResponse = responses[0] as SliderResponse?;
    var bestSellerRespose = responses[1] as BestSellerBookResponse?;

    if (slidersResponse != null || bestSellerRespose != null) {
      sliders = slidersResponse?.data?.sliders ?? [];
      products = bestSellerRespose?.data?.products ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }
}
