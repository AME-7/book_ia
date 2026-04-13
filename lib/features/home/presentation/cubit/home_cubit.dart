import 'package:book_ia/core/di/service_locator.dart';
import 'package:book_ia/core/services/dio/failure.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/data.dart';
import 'package:book_ia/features/home/data/models/best_seller_book_response/product.dart';
import 'package:book_ia/features/home/data/models/slider_response/data.dart';
import 'package:book_ia/features/home/data/models/slider_response/slider.dart';
import 'package:book_ia/features/home/domain/usecases/get_best_sellers_usecase.dart';
import 'package:book_ia/features/home/domain/usecases/get_sliders_usecase.dart';
import 'package:book_ia/features/home/presentation/cubit/home_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(getIt) : super(HomeInitialState());

  List<Slider> sliders = [];
  List<Product> products = [];

  int yourActiveIndex = 0;

  Future<void> initLoadData() async {
    emit(HomeloadingState());

    // run apis in parallel (1 sec)
    var responses = await Future.wait([
      getIt<GetSlidersUseCase>().call(),
      getIt<GetBestSellersUseCase>().call(),
    ]);

    // check responses
    final slidersResult = responses[0] as Either<Failure, SliderResponse>;
    final bestSellerResult =
        responses[1] as Either<Failure, BestSellerBooksResponse>;

    slidersResult.fold((l) => emit(HomeErrorState()), (r) {
      sliders = r.sliders ?? [];
    });

    bestSellerResult.fold((l) => emit(HomeErrorState()), (r) {
      products = r.products ?? [];
    });

    if (state is! HomeErrorState) {
      emit(HomeSuccessState());
    }
  }

  void onChangeSlider(int index) {
    yourActiveIndex = index;
    emit(HomeSuccessState());
  }
}
