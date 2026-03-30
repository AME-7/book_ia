import 'package:book_ia/features/home/presentation/search/presentation/cubit/search_cubit.dart';
import 'package:book_ia/features/home/presentation/search/presentation/cubit/search_states.dart';
import 'package:book_ia/features/home/presentation/widget/book_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              onChanged: (value) {
                context.read<SearchCubit>().search(value);
              },
              decoration: InputDecoration(
                hintText: 'Search books...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SearchSuccess) {
                    return GridView.builder(
                      itemCount: state.books.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 11,
                            crossAxisSpacing: 11,
                            childAspectRatio: .6,
                          ),
                      itemBuilder: (context, index) {
                        return BookCard(product: state.books[index]);
                      },
                    );
                  } else if (state is SearchError) {
                    return Center(child: Text(state.message));
                  }

                  return const Center(child: Text('Search for books'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
