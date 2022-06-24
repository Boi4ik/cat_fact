part of 'data_bloc.dart';

@immutable
abstract class DataState {
  const DataState();
}

class DataInitial extends DataState {}

class CatImageUrlState extends DataState {
  final String imgUrl;
  const CatImageUrlState({required this.imgUrl});
}

class UpdateTextState extends DataState {
  final String text;
  final String updatedAt;
  const UpdateTextState({required this.updatedAt, required this.text});
}

class ErrorImageState extends DataState {
  final String errorMessage;
  const ErrorImageState({required this.errorMessage});
}
class ErrorFactState extends DataState {
  final String errorMessage;
   const ErrorFactState({required this.errorMessage});
}
