import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';
import 'package:pragma_test/src/bloc/cat/repository/cat_repository.dart';

import '../../../global_locator.dart';
import 'model/model.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final _api = global<CatRepository>();
  final _logger = global<Logger>();
  List<CatsModel> cats = List.empty();
  List<NameIndexCat> catNames = [];
  CatBloc() : super(CatInitial()) {
    on<CatEvent>((event, emit) {});
    on<GetCatsEvent>(_getCatsToState);
  }

  Future _getCatsToState(GetCatsEvent event, Emitter<CatState> emit) async {
    try {
      final response = await _api.getCats();
      if (response['statusCode'] == 200) {
        cats = List<CatsModel>.from(
          response['data'].asMap().map((i, x) {
            CatsModel cat = CatsModel.fromJson(x);
            catNames.add(NameIndexCat(name: cat.name, index: i));
            return MapEntry(i, cat);
          }).values,
        );

        emit(CatLoadedState(cats: cats));
      } else {
        emit(CatErrorState(message: 'Error'));
      }
    } catch (e) {
      _logger.e(e);
      emit(
        CatErrorState(message: e.toString()),
      );
    }
  }
}
