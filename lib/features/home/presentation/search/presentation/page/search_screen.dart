import 'package:book_ia/core/di/service_locator.dart';
import 'package:book_ia/features/home/domain/repository/home_repo.dart';
import 'package:book_ia/features/home/presentation/search/presentation/cubit/search_cubit.dart';
import 'package:book_ia/features/home/presentation/search/presentation/widgets/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  final HomeRepository repo;

  const SearchScreen({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(getIt()),
      child: const SearchView(),
    );
  }
}
