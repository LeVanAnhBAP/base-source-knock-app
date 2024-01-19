import 'dart:async';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/data/models/response/prefecture_response.dart';
import 'package:uq_system_app/data/models/response/static_data_response.dart';
import 'package:uq_system_app/data/usecases/site/get_members_usecase.dart';
import 'package:uq_system_app/data/usecases/site/get_prefectures_usecase.dart';
import 'package:uq_system_app/data/usecases/site/get_static_data_usecase.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_event.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_state.dart';

import '../../../domain/entities/member.dart';

@injectable
class CreateSiteBloc extends Bloc<CreateSiteEvent, CreateSiteState> {
  final GetStaticDataUseCase _getStaticDataUseCase;
  final GetPrefecturesUseCase _getPrefecturesUseCase;
  final GetMembersUseCase _getMembersUseCase;

  CreateSiteBloc(this._getMembersUseCase, this._getStaticDataUseCase,
      this._getPrefecturesUseCase)
      : super(const CreateSiteState()) {
    on<CreateSiteErrorOccurred>(_onErrorOccurred);
    on<CreateSiteLoadInfo>(_onLoadInfo);
    on<CreateSiteUpdateMembers>(_onUpdateMembers);
    on<CreateSiteRemoveMemeber>(_onRemoveMember);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (EasyLoading.isShow) EasyLoading.dismiss();
    add(CreateSiteErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }
  FutureOr<void> _onUpdateMembers(CreateSiteUpdateMembers event,Emitter<CreateSiteState> emit) async{
    emit(state.copyWith(status: CreateSiteStatus.success, members: event.newMembers));
  }
  FutureOr<void> _onRemoveMember(CreateSiteRemoveMemeber event,Emitter<CreateSiteState> emit) async{
    emit(state.copyWith(status: CreateSiteStatus.loading));
    var newMembers = state.members
        .map((e) => e.id == event.id ? e.copyWith(isSelected: false) : e)
        .toList();
    emit(state.copyWith(status: CreateSiteStatus.success, members: newMembers));
  }
  FutureOr<void> _onErrorOccurred(
    CreateSiteErrorOccurred event,
    Emitter<CreateSiteState> emit,
  ) {
    emit(state.copyWith(
      status: CreateSiteStatus.failure,
    ));
  }

  FutureOr<void> _onLoadInfo(
      CreateSiteLoadInfo event, Emitter<CreateSiteState> emit) async {
    EasyLoading.show();
    await Future.wait([
      _getStaticDataUseCase(),
      _getPrefecturesUseCase(),
      _getMembersUseCase()
    ]).then((results) {
      EasyLoading.dismiss();
      var members = (results[2] as List<Member>)
          .map((element) {
            if(element.role == 1 || element.id == event.userId) return element.copyWith(isSelected: true);
            return element;
      })
          .toList();
      emit(state.copyWith(
          status: CreateSiteStatus.success,
          staticData: (results[0] as StaticDataResponse),
          prefecture: (results[1] as List<PrefectureResponse>),
          members: members));
    });
  }




}
