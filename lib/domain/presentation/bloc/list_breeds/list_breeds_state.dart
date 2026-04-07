import 'package:cat_directory_app/domain/entities/breed_entity.dart';

class ListBreedsState {
  final List<BreedEntity> breeds;
  final bool isLoading;
  final bool hasError;
  final String errorMessage;

  ListBreedsState({
    required this.breeds,
    required this.isLoading,
    required this.hasError,
    required this.errorMessage,
  });
}

class ListBreedsInitialState extends ListBreedsState {
  ListBreedsInitialState() : super(breeds: [], isLoading: false, hasError: false, errorMessage: '');
}

class ListBreedsLoadingState extends ListBreedsState {
  ListBreedsLoadingState() : super(breeds: [], isLoading: true, hasError: false, errorMessage: '');
}

class ListBreedsErrorState extends ListBreedsState {
  ListBreedsErrorState(String errorMessage)
    : super(breeds: [], isLoading: false, hasError: true, errorMessage: errorMessage);
}

class ListBreedsSuccessState extends ListBreedsState {
  ListBreedsSuccessState(List<BreedEntity> breeds)
    : super(breeds: breeds, isLoading: false, hasError: false, errorMessage: '');
}
