// import 'package:web_socket_channel/io.dart';

class SmsaStationInverterRealtimeModel {
  int? id;
  DateTime? dateTime;
  double? deviceVoltage;
  double? pvVoltage;
  double? pvCurrent;
  double? pvPower;
  double? gridVoltage;
  double? gridCurrent;
  double? gridPower;
  double? outputVoltage;
  double? outputCurrent;
  double? outputPower;
  double? outputFrequency;
  double? duration;
  String? inverterKey;
  String? dataId;
  bool isOnline;

  SmsaStationInverterRealtimeModel({
    this.id,
    this.dateTime,
    this.deviceVoltage,
    this.pvVoltage,
    this.pvCurrent,
    this.pvPower,
    this.gridVoltage,
    this.gridCurrent,
    this.gridPower,
    this.outputVoltage,
    this.outputCurrent,
    this.outputPower,
    this.outputFrequency,
    this.duration,
    this.inverterKey,
    this.dataId,
    this.isOnline = false,
  });

  factory SmsaStationInverterRealtimeModel.fromJson(json) {
    return SmsaStationInverterRealtimeModel(
      id: json['id'],
      dateTime: DateTime.parse(json['date_time']),
      deviceVoltage: json['device_voltage'],
      pvVoltage: json['pv_voltage'],
      pvCurrent: json['pv_current'],
      pvPower: json['pv_power'],
      gridVoltage: json['grid_voltage'],
      gridCurrent: json['grid_current'],
      gridPower: json['grid_power'],
      outputVoltage: json['output_voltage'],
      outputCurrent: json['output_current'],
      outputPower: json['output_power'],
      outputFrequency: json['output_frequency'],
      duration: json['duration'],
      inverterKey: json['inverter_key'],
      dataId: json['data_id'],
      isOnline: json['is_online'],
    );
  }
  Map<String, dynamic> toJson() {
    var json = {
      "id": id,
      "date_time": dateTime,
      "device_voltage": deviceVoltage,
      "pv_voltage": pvVoltage,
      "pv_current": pvCurrent,
      "pv_power": pvPower,
      "grid_voltage": gridVoltage,
      "grid_current": gridCurrent,
      "grid_power": gridPower,
      "output_voltage": outputVoltage,
      "output_current": outputCurrent,
      "output_power": outputPower,
      "output_frequency": outputFrequency,
      "duration": duration,
      "inverter_key": inverterKey,
      "data_id": dataId,
      "is_online": isOnline,
    };
    return json;
  }
}

// class SmsaStationInverterModel {
//   int? id;
//   DateTime? createdAt;
//   String? name;
//   String? key;
//   String? connectCode;
//   int? orderNumber;
//   String? latitude;
//   String? longtitude;
//   bool? isPvBraker;
//   bool? isGridBraker;
//   bool? isInverterBraker;
//   String? remoteId;
//   SmsaStationInverterRealtimeModel? inverterRealtime;
//   IOWebSocketChannel? wsConnected;

//   SmsaStationInverterModel({
//     this.id,
//     this.createdAt,
//     this.name,
//     this.key,
//     this.connectCode,
//     this.orderNumber,
//     this.latitude,
//     this.longtitude,
//     this.isPvBraker,
//     this.isGridBraker,
//     this.isInverterBraker,
//     this.inverterRealtime,
//     this.remoteId,
//     this.wsConnected,
//   });

//   factory SmsaStationInverterModel.fromJson(json) {
//     SmsaStationInverterRealtimeModel realtime =
//         SmsaStationInverterRealtimeModel();
//     if (json.containsKey('inverter_realtime')) {
//       realtime = SmsaStationInverterRealtimeModel.fromJson(
//         json['inverter_realtime'],
//       );
//     }
//     return SmsaStationInverterModel(
//       id: json['id'],
//       createdAt: DateTime.parse(json['created_at']),
//       name: json['name'],
//       key: json['key'],
//       connectCode: json['connect_code'],
//       orderNumber: json['order_number'],
//       latitude: json['latitude'],
//       longtitude: json['longtitude'],
//       isPvBraker: json['is_pv_braker'],
//       isGridBraker: json['is_grid_braker'],
//       isInverterBraker: json['is_inverter_braker'],
//       remoteId: json['remote_id'],
//       inverterRealtime: realtime,
//     );
//   }
//   Map<String, dynamic> toJson() {
//     var json = {
//       "name": name,
//       "key": key,
//       "connect_code": connectCode,
//       "order_number": orderNumber,
//       "latitude": latitude,
//       "longtitude": longtitude,
//       "is_pv_braker": isPvBraker,
//       "is_grid_braker": isGridBraker,
//       "is_inverter_braker": isInverterBraker,
//       "ws_connected": wsConnected != null ? true : false,
//     };
//     return json;
//   }

//   Map<String, dynamic> toJsonRemote() {
//     var json = {
//       "key": key,
//       "is_pv_braker": isPvBraker,
//       "is_grid_braker": isGridBraker,
//       "is_inverter_braker": isInverterBraker,
//       "remote_id": remoteId,
//     };
//     return json;
//   }
// }
