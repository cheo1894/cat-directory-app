import 'package:cat_directory_app/domain/presentation/bloc/list_breeds/list_breeds_state.dart';
import 'package:cat_directory_app/domain/usecases/list_breeds_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBreedCubit extends Cubit<ListBreedsState> {
  final ListBreedsUsecase _listBreedsUsecase;
  int _currentpage = 1;
  bool _isLoading = false;
  ListBreedCubit(this._listBreedsUsecase) : super(ListBreedsInitialState());

  void getBreeds() async {
    _currentpage = 1;
    _isLoading = false;
    try {
      emit(ListBreedsLoadingState());
      final breeds = await _listBreedsUsecase.call(page: _currentpage);
      if (breeds.isEmpty) {
        debugPrint('ListBreedCubit: lista vacía (no es excepción)');
        emit(ListBreedsErrorState('No breeds found'));
      } else {
        emit(ListBreedsSuccessState(breeds));
      }
    } catch (e, stackTrace) {
      // debugPrint('Error en el cubit (getBreeds): $e');
      // debugPrint('$stackTrace');
      emit(ListBreedsErrorState(e.toString()));
    }
  }

  void loadMoreBreeds() async {
    if (_isLoading) return;

    final currentState = state;

    if (currentState is! ListBreedsSuccessState) return;

    _isLoading = true;
    _currentpage++;
    print(_currentpage);

    try {
      final newbreeds = await _listBreedsUsecase.call(page: _currentpage);
      emit(ListBreedsSuccessState([...currentState.breeds, ...newbreeds]));
    } catch (e) {
      emit(ListBreedsErrorState(e.toString()));
    } finally {
      _isLoading = false;
    }
  }
}
