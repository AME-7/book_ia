import 'dart:async';
import 'package:book_ia/features/home/data/repository/home_repo.dart';
import 'package:book_ia/features/home/presentation/search/presentation/cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final HomeRepo repo;

  SearchCubit(this.repo) : super(SearchInitial());

  Timer? _debounce;

  void search(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        emit(SearchInitial());
        return;
      }

      emit(SearchLoading());

      try {
        final result = await repo.searchBooks(query);
        emit(SearchSuccess(result));
      } catch (e) {
        emit(SearchError(e.toString()));
      }
    });
  }
}
