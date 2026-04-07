import 'package:cat_directory_app/core/widgets/app_text_field.dart';
import 'package:cat_directory_app/core/widgets/app_tile.dart';
import 'package:cat_directory_app/core/widgets/data_tile.dart';
import 'package:cat_directory_app/data/datasource/list_breeds_datasource.dart';
import 'package:cat_directory_app/data/implementations/list_breeds_impl.dart';
import 'package:cat_directory_app/domain/entities/breed_entity.dart';
import 'package:cat_directory_app/domain/presentation/bloc/list_breeds/list_breed_cubit.dart';
import 'package:cat_directory_app/domain/presentation/bloc/list_breeds/list_breeds_state.dart';
import 'package:cat_directory_app/domain/presentation/pages/breed.dart';
import 'package:cat_directory_app/domain/presentation/widgets/list_breeds_skeleton.dart';
import 'package:cat_directory_app/domain/presentation/widgets/list_breeds_widget.dart';
import 'package:cat_directory_app/domain/usecases/list_breeds_usecase.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBreedsPage extends StatefulWidget {
  const ListBreedsPage({super.key});

  @override
  State<ListBreedsPage> createState() => _ListBreedsPageState();
}

class _ListBreedsPageState extends State<ListBreedsPage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _buildBody(
    ListBreedsState state,
    BuildContext context,
    TextEditingController searchController,
  ) {
    switch (state) {
      case ListBreedsInitialState():
        return ListBreedsSkeleton();
      case ListBreedsLoadingState():
        return ListBreedsSkeleton();
      case ListBreedsErrorState():
        return ListBreedsSkeleton();
      case ListBreedsSuccessState():
        return ValueListenableBuilder(
          valueListenable: _searchController,
          builder: (context, value, child) {
            final filteredBreeds = state.breeds
                .where(
                  (breed) =>
                      breed.breed.toLowerCase().contains(value.text.toLowerCase()) ||
                      breed.country.toLowerCase().contains(value.text.toLowerCase()) ||
                      breed.origin.toLowerCase().contains(value.text.toLowerCase()) ||
                      breed.coat.toLowerCase().contains(value.text.toLowerCase()) ||
                      breed.pattern.toLowerCase().contains(value.text.toLowerCase()),
                )
                .toList();

            return ListBreedsWidget(
              props: ListBreedsWidgetProps(
                scrollController: _scrollController,
                breeds: filteredBreeds,
                onTap: (breed) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BreedPage(),
                      settings: RouteSettings(arguments: breed),
                    ),
                  );
                },
                onRefresh: () async {
                  context.read<ListBreedCubit>().getBreeds();
                },
              ),
            );
          },
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ListBreedCubit(ListBreedsUsecase(ListBreedsImpl(ListBreedsDataSource())));
        cubit.getBreeds();

        _scrollController.addListener(() {
          if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.9) {
            cubit.loadMoreBreeds();
          }
        });
        return cubit;
      },
      child: BlocConsumer<ListBreedCubit, ListBreedsState>(
        listenWhen: (previous, current) =>
            current is ListBreedsErrorState && previous is! ListBreedsErrorState,
        listener: (context, state) {
          if (state is ListBreedsErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage), backgroundColor: Colors.red),
            );
          }
        },
        builder: (BuildContext context, ListBreedsState state) {
          return Scaffold(
            backgroundColor: Colors.white,

            body: Column(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.purple,
                  padding: EdgeInsets.only(bottom: 10, left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppTextField(
                        props: AppTextFieldProps(
                          hintText: 'Search',
                          hintColor: Colors.white,
                          suffixIcon: Icons.search,
                          controller: _searchController,
                        ),
                      ),
                    ],
                  ),
                ),
                _buildBody(state, context, _searchController),
              ],
            ),
          );
        },

        // child:
      ),
    );
  }
}
