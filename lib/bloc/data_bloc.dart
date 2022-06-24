import 'package:dio/dio.dart';
import 'package:flutter_application_cat_fact/models/cat.dart';
import 'package:flutter_application_cat_fact/models/fact.dart';
import 'package:flutter_application_cat_fact/repositories/cat_api.dart';
import 'package:flutter_application_cat_fact/repositories/fact_api.dart';
import 'package:flutter_application_cat_fact/utility/boxse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final CatClient _catClient;
  final FactClient _factClient;
  DataBloc(this._catClient, this._factClient) : super(DataInitial()) {
    on<DataEvent>((event, emit) {
      _catEventHandler(event, emit);
    });
    on<GetDataEvent>(_getData);
  }
  Future<void> _catEventHandler(DataEvent e, Emitter emit) async {
    emit(DataInitial());
  }

  Future<void> _getData(GetDataEvent e, Emitter emit) async {
    DioError dioError;
    try {
      Cat cat = await _catClient.getCat();
      emit(CatImageUrlState(imgUrl: cat.url ?? ""));
    } catch (e) {
       dioError = e as DioError;
      emit(ErrorImageState(errorMessage: dioError.message));
    }
    try {
      Fact fact = await _factClient.getFact();
      await _saveFact(fact);
      emit(UpdateTextState(
          text: fact.text ?? "",
          updatedAt: fact.updatedAt ?? DateTime.now().toString()));
    } catch (e) {
      DioError dioError = e as DioError;
      emit(ErrorFactState(errorMessage: dioError.message));
    }
  }

  Future<void> _saveFact(Fact fact) async {
    final box = Boxes.getFacts();
    box.add(fact);
  }
}
