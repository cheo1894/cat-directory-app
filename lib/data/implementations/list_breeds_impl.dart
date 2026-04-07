import 'package:cat_directory_app/data/datasource/list_breeds_datasource.dart';
import 'package:cat_directory_app/domain/entities/breed_entity.dart';
import 'package:cat_directory_app/domain/contracts/get_breeds_contract.dart';

//Implementamos el contrato.
//Nosotros no sabemos como se implementa la fuente de datos, solo sabemos que debe implementar el contrato.
class ListBreedsImpl implements GetBreedsContract {
  final ListBreedsDataSource _listBreedsDataSource;
  ListBreedsImpl(this._listBreedsDataSource);

  @override
  Future<List<BreedEntity>> getBreeds({int limit = 10, int page = 1}) async {
    final models = await _listBreedsDataSource.getBreedsDataSource(limit: limit, page: page);

    return models.map((model) => model.toEntity()).toList();
  }
}
