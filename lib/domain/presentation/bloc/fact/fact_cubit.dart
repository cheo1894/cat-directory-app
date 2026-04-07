import 'package:cat_directory_app/domain/presentation/bloc/fact/fact_state.dart';
import 'package:cat_directory_app/domain/usecases/fact_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactCubit extends Cubit<FactState> {
  final FactUsecase _factUsecase;

  FactCubit(this._factUsecase) : super(FactInitialState());

  void getFaqct() async {
    emit(FactLoadingState());
    try {
      final fact = await _factUsecase.getFact();
      if (!isClosed) emit(FactSuccessState(fact));
    } catch (e) {
      if (!isClosed) emit(FactErrorState(e.toString()));
    }
  }
}
