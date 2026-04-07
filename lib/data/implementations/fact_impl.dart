import 'package:cat_directory_app/data/datasource/fact_datasource.dart';
import 'package:cat_directory_app/domain/contracts/fact_contract.dart';

class FactImpl implements FactContract {
  final FactDataSource _factDataSource;
  FactImpl(this._factDataSource);

  @override
  Future<String> getFact() async {
    return await _factDataSource.getFactDataSource();
  }
}
