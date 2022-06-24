part of 'data_bloc.dart';

@immutable
abstract class DataEvent {
  const DataEvent();
}

class GetDataEvent extends DataEvent {}

