import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_next_gen/models/extra_service.dart';
import 'package:football_next_gen/repository/profile/extra_services_service.dart';

class ExtraServicesCubit extends Cubit<ExtraServicesPageState> {

  ExtraServicesCubit() : super(ExtraServicesPageLoading());
  void fetchUserServices() async {
    // could be avoided:
    // 1) if there are no modification to this data
    // 2) TODO
    emit(ExtraServicesPageLoading());

    // fetch data
    try{
      List<ExtraServiceEntity> entity = await ExtraServicesService().fetchServices();
      emit(ExtraServicesPageLoaded(services: entity));
    }catch(e){
      emit(ExtraServicesPageError(error: e));
    }
  }
}

@immutable
class ExtraServicesPageState{}

class ExtraServicesPageLoading extends ExtraServicesPageState{}
class ExtraServicesPageLoaded extends ExtraServicesPageState{
  List<ExtraServiceEntity> services;
  ExtraServicesPageLoaded({required this.services});
}
class ExtraServicesPageError extends ExtraServicesPageState{
  dynamic error;
  ExtraServicesPageError({required this.error});
}

