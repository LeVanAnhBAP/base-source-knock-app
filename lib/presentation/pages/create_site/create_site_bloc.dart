import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:uq_system_app/core/exceptions/exception.dart';
import 'package:uq_system_app/core/mapper/site_mapper.dart';
import 'package:uq_system_app/data/models/request/image_params.dart';
import 'package:uq_system_app/data/models/request/site_params.dart';
import 'package:uq_system_app/data/models/response/address_info_response.dart';
import 'package:uq_system_app/data/models/response/site_details_response.dart';
import 'package:uq_system_app/data/models/response/static_data_response.dart';
import 'package:uq_system_app/data/models/response/tax_rate_response.dart';
import 'package:uq_system_app/data/usecases/site/create_site_usecase.dart';
import 'package:uq_system_app/data/usecases/site/get_cities_usecase.dart';
import 'package:uq_system_app/data/usecases/site/get_members_usecase.dart';
import 'package:uq_system_app/data/usecases/site/get_prefectures_usecase.dart';
import 'package:uq_system_app/data/usecases/site/get_site_details_usecase.dart';
import 'package:uq_system_app/data/usecases/site/get_static_data_usecase.dart';
import 'package:uq_system_app/data/usecases/site/get_tax_rate_usecase.dart';
import 'package:uq_system_app/data/usecases/site/get_towns_usecase.dart';
import 'package:uq_system_app/data/usecases/site/upload_images_usecase.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_event.dart';
import 'package:uq_system_app/presentation/pages/create_site/create_site_state.dart';

import '../../../domain/entities/member.dart';

@injectable
class CreateSiteBloc extends Bloc<CreateSiteEvent, CreateSiteState> {
  final GetSiteDetailsUseCase _getSiteDetailsUseCase;
  final GetStaticDataUseCase _getStaticDataUseCase;
  final GetPrefecturesUseCase _getPrefecturesUseCase;
  final GetMembersUseCase _getMembersUseCase;
  final GetCitiesUseCase _getCitiesUseCase;
  final GetTownsUseCase _getTownsUseCase;
  final GetTaxRateUseCase _getTaxRateUseCase;
  final UploadImagesUseCase _uploadImagesUseCase;
  final CreateSiteUseCase _createSiteUseCase;

  CreateSiteBloc(
      this._getSiteDetailsUseCase,
      this._getMembersUseCase,
      this._getStaticDataUseCase,
      this._getPrefecturesUseCase,
      this._getCitiesUseCase,
      this._getTownsUseCase,
      this._getTaxRateUseCase,
      this._uploadImagesUseCase,
      this._createSiteUseCase)
      : super(const CreateSiteState()) {
    on<CreateSiteErrorOccurred>(_onErrorOccurred);
    on<CreateSiteLoadInfo>(_onLoadInfo);
    on<CreateSiteUpdateMembers>(_onUpdateMembers);
    on<CreateSiteRemoveMemeber>(_onRemoveMember);
    on<CreateSiteUpdateOccupation>(_onUpdateOccupation);
    on<CreateSiteUpdateParams>(_onUpdateParams);
    on<CreateSiteSelectPrefecture>(_onSelectPrefecture);
    on<CreateSiteSelectCity>(_onSelectCity);
    on<CreateSiteSelectTown>(_onSelectTown);
    on<CreateSiteUpdateOrders>(_onUpdateOrders);
    on<CreateSiteAddImages>(_onAddImages);
    on<CreateSiteRemoveImage>(_onRemoveImages);
    on<CreateSiteSubmit>(_onSubmit);
  }

  String getAddressPart(List<AddressInfoResponse> locations, int? id) {
    if (id != null) {
      return locations.firstWhere((element) => element.id == id).name;
    }
    return '';
  }

  FutureOr<void> _onSubmit(
      CreateSiteSubmit event, Emitter<CreateSiteState> emit) async {
    EasyLoading.show();
    var memberIds = state.members
        .where((element) => element.isSelected)
        .map((e) => e.id)
        .toList();
    var address = '';
    var factoryFloorAddress = state.siteParams.factoryFloorAddress;

    address += getAddressPart(state.prefecture, factoryFloorAddress.id);
    address += getAddressPart(state.cities, factoryFloorAddress.cityId);
    address += getAddressPart(state.towns, factoryFloorAddress.townId);
    address +=
        "${factoryFloorAddress.wards}${factoryFloorAddress.buildingNumber}";
    await _createSiteUseCase(state.siteParams.copyWith(
        members: memberIds,
        address: address.isNotEmpty ? address : null,
        isDraft: event.isDaft,
        occupations: state.occupation != null ? [state.occupation!.id] : null));
    EasyLoading.dismiss();
    emit(state.copyWith(status: CreateSiteStatus.submitSuccess));
  }

  FutureOr<void> _onRemoveImages(
      CreateSiteRemoveImage event, Emitter<CreateSiteState> emit) async {
    var updatedSiteParams = event.imageType == 1
        ? state.siteParams.copyWith(
            imageType1: List.from(state.siteParams.imageType1)
              ..removeAt(event.index))
        : state.siteParams.copyWith(
            imageType2: List.from(state.siteParams.imageType2)
              ..removeAt(event.index));
    emit(state.copyWith(
      status: CreateSiteStatus.updateSuccess,
      siteParams: updatedSiteParams,
    ));
  }

  FutureOr<void> _onAddImages(
      CreateSiteAddImages event, Emitter<CreateSiteState> emit) async {
    EasyLoading.show();
    var result = await _uploadImagesUseCase(event.images);
    var imagesParams = result.map((e) => ImageParams(url: e.url)).toList();
    var updatedSiteParams = event.imageType == 1
        ? state.siteParams.copyWith(
            imageType1: List.from(state.siteParams.imageType1)
              ..addAll(imagesParams))
        : state.siteParams.copyWith(
            imageType2: List.from(state.siteParams.imageType2)
              ..addAll(imagesParams));
    EasyLoading.dismiss();
    emit(state.copyWith(
        status: CreateSiteStatus.updateSuccess,
        siteParams: updatedSiteParams,
        isEdited: true));
  }

  FutureOr<void> _onUpdateOrders(
      CreateSiteUpdateOrders event, Emitter<CreateSiteState> emit) async {
    emit(state.copyWith(
        status: CreateSiteStatus.updateSuccess,
        siteParams: state.siteParams.copyWith(
            priceOrderDetails: event.priceOrders,
            totalAmount: event.totalAmount),
        isEdited: true));
  }

  FutureOr<void> _onSelectTown(
      CreateSiteSelectTown event, Emitter<CreateSiteState> emit) async {
    emit(state.copyWith(
        status: CreateSiteStatus.updateSuccess,
        siteParams: state.siteParams.copyWith(
            factoryFloorAddress: state.siteParams.factoryFloorAddress
                .copyWith(townId: event.townId))));
  }

  FutureOr<void> _onSelectCity(
      CreateSiteSelectCity event, Emitter<CreateSiteState> emit) async {
    emit(state.copyWith(
        status: CreateSiteStatus.updateSuccess,
        siteParams: state.siteParams.copyWith(
            factoryFloorAddress: state.siteParams.factoryFloorAddress
                .copyWith(cityId: event.cityId, townId: null))));
    var result = await _getTownsUseCase(event.cityId);
    emit(state.copyWith(status: CreateSiteStatus.updateSuccess, towns: result));
  }

  FutureOr<void> _onSelectPrefecture(
      CreateSiteSelectPrefecture event, Emitter<CreateSiteState> emit) async {
    var factoryFloorAddress = state.siteParams.factoryFloorAddress;
    emit(state.copyWith(
        status: CreateSiteStatus.updateSuccess,
        siteParams: state.siteParams.copyWith(
            factoryFloorAddress: factoryFloorAddress.copyWith(
                id: event.prefectureId, cityId: null, townId: null))));
    var result = await _getCitiesUseCase(event.prefectureId);
    emit(state.copyWith(
        status: CreateSiteStatus.updateSuccess,
        cities: result,
        isEdited: true));
  }

  FutureOr<void> _onUpdateOccupation(
      CreateSiteUpdateOccupation event, Emitter<CreateSiteState> emit) {
    emit(state.copyWith(
        status: CreateSiteStatus.updateSuccess,
        occupation: event.occupation,
        isEdited: true));
  }

  FutureOr<void> _onUpdateMembers(
      CreateSiteUpdateMembers event, Emitter<CreateSiteState> emit) async {
    emit(state.copyWith(
        status: CreateSiteStatus.success,
        members: event.newMembers,
        isEdited: true));
  }

  FutureOr<void> _onUpdateParams(
      CreateSiteUpdateParams event, Emitter<CreateSiteState> emit) async {
    emit(state.copyWith(
        status: CreateSiteStatus.updateSuccess,
        siteParams: event.siteParams,
        isEdited: true));
  }

  FutureOr<void> _onRemoveMember(
      CreateSiteRemoveMemeber event, Emitter<CreateSiteState> emit) async {
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
    SiteDetailsResponse? siteDetailsResult;
    List<AddressInfoResponse>? cities;
    List<AddressInfoResponse>? towns;
    await Future.wait([
      _getStaticDataUseCase(),
      _getPrefecturesUseCase(),
      _getMembersUseCase(),
      _getTaxRateUseCase('consumption'),
      if (event.siteId != null) ...[
        _getSiteDetailsUseCase(event.siteId!).then((value) {
          siteDetailsResult = value;
          if(siteDetailsResult?.cityId != null) {
            _getCitiesUseCase(siteDetailsResult!.cityId!).then((value){
            cities = value;
          });
          }
          if(siteDetailsResult?.townId != null) {
            _getTownsUseCase(siteDetailsResult!.townId!).then((value){
              towns = value;
          });
          }
        })
      ],
    ]).then((results) {
      EasyLoading.dismiss();
      var members = siteDetailsResult != null
          ? siteDetailsResult!.members
              .map((e) => e.mapToEntity().copyWith(isSelected: true))
              .toList()
          : (results[2] as List<Member>).map((element) {
              if (element.role == 1 || element.id == event.userId) {
                return element.copyWith(isSelected: true);
              }
              return element;
            }).toList();
      emit(state.copyWith(
          status: CreateSiteStatus.success,
          cities: cities ?? [],
          towns : towns ?? [],
          siteParams: siteDetailsResult != null
              ? SiteMapper.responseToRequest(siteDetailsResult!)
              : SiteParams(
                  startDayRequest: DateTime.now(),
                  endDayRequest: DateTime.now(),
                ),
          staticData: (results[0] as StaticDataResponse),
          prefecture: (results[1] as List<AddressInfoResponse>),
          members: members,
          taxRate: (results[3] as TaxRateResponse)));
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (EasyLoading.isShow) EasyLoading.dismiss();
    add(CreateSiteErrorOccurred(BaseException.from(error)));
    super.onError(error, stackTrace);
  }
}
