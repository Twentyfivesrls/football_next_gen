import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/sport_field.dart';
import 'package:football_next_gen/repository/profile/sport_fields_service.dart';

class SportFieldsCubit extends Cubit<SportFieldsPageState> {

  SportFieldsCubit() : super(SportFieldsPageLoading());
  void fetchUserFields() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(SportFieldsPageLoading());

    // fetch data
    try{
      List<SportFieldEntity> entity = await SportFieldsService().fetchFields();
      emit(SportFieldsPageLoaded(fields: entity));
    }catch(e){
      emit(SportFieldsPageError(error: e));
    }
  }
}

@immutable
class SportFieldsPageState{}

class SportFieldsPageLoading extends SportFieldsPageState{}
class SportFieldsPageLoaded extends SportFieldsPageState{
  List<SportFieldEntity> fields;
  SportFieldsPageLoaded({required this.fields});
}
class SportFieldsPageError extends SportFieldsPageState{
  dynamic error;
  SportFieldsPageError({required this.error});
}

