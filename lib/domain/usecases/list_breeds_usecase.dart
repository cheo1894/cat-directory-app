import 'package:cat_directory_app/domain/entities/breed_entity.dart';
import 'package:cat_directory_app/domain/contracts/get_breeds_contract.dart';

class ListBreedsUsecase {
  final GetBreedsContract _getbreedscontract;

  ListBreedsUsecase(this._getbreedscontract);

  Future<List<BreedEntity>> call({int limit = 10, int page = 1}) async {
    return await _getbreedscontract.getBreeds(limit: limit, page: page);
  }
}
