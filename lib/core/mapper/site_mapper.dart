
import 'package:uq_system_app/data/models/price_order_detail_model.dart';
import 'package:uq_system_app/data/models/request/factory_floor_address_params.dart';
import 'package:uq_system_app/data/models/request/image_params.dart';
import 'package:uq_system_app/data/models/request/site_params.dart';
import 'package:uq_system_app/data/models/response/site_details_response.dart';


class SiteMapper{
  static SiteParams responseToRequest(SiteDetailsResponse response){
    return SiteParams(
      id: response.id,
      // members: response.members.map((e) => e.id).toList(),
      code: response.code,
      name: response.name,
      contentRequest: response.contentRequest,
      startDayRequest: DateTime.parse(response.startDayRequest),
      endDayRequest: DateTime.parse(response.endDayRequest),
      occupations: response.occupations.map((e) => e.id).toList(),
      address: response.address,
      isDraft: response.status == 0,
      status: response.status,
      factoryFloorAddress: FactoryFloorAddressParams(
        id: response.prefectureId,
        cityId: response.cityId,
        townId: response.townId,
        wards: response.wards,
        buildingNumber: response.buildingNumber
      ),
      priceOrderDetails: response.priceOrderDetails,
      totalAmount: response.totalAmount,
      imageType1: response.imageType1.map((e) => ImageParams(url: e.url, path: e.path)).toList(),
      imageType2: response.imageType2.map((e) => ImageParams(url: e.url, path: e.path)).toList(),
      remarks: response.remarks,
      expenses: response.expenses
    );
  }
}