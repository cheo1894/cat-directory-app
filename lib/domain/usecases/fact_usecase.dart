import 'package:cat_directory_app/domain/contracts/fact_contract.dart';

class FactUsecase {
  final FactContract _factContract;
  FactUsecase(this._factContract);

  Future<String> getFact() async {
    return await _factContract.getFact();
  }
}
