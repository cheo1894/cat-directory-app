import 'package:cat_directory_app/domain/entities/breed_entity.dart';

abstract class GetBreedsContract {
  Future<List<BreedEntity>> getBreeds({int limit = 10, int page = 1});
}
