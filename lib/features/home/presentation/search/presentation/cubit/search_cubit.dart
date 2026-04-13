import 'dart:async';
import 'package:book_ia/features/home/domain/usecases/search_book_usecases.dart';
import 'package:book_ia/features/home/presentation/search/presentation/cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchBookUsecases searchBookUsecases;
  SearchCubit(this.searchBookUsecases) : super(SearchInitial());

  Timer? _debounce;

  void search(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 800), () async {
      if (query.isEmpty) {
        emit(SearchInitial());
        return;
      }

      emit(SearchLoading());
      final result = await searchBookUsecases(query);
      result.fold(
        (l) => emit(SearchError(l.message)),
        (r) => emit(SearchSuccess(r)),
      );
    });
  }
}
