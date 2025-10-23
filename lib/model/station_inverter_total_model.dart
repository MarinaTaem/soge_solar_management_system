class SmsaStationInverterTotalModel {
  int? id;
  String? key;
  int? orderNumber;
  double? totalPvEnergy;
  double? totalGridEnergy;
  double? totalOutEnergy;

  SmsaStationInverterTotalModel({
    this.id,
    this.key,
    this.orderNumber,
    this.totalPvEnergy,
    this.totalGridEnergy,
    this.totalOutEnergy,
  });

  factory SmsaStationInverterTotalModel.fromJson(json) {
    return SmsaStationInverterTotalModel(
      id: json['station_inverter__id'],
      key: json['station_inverter__key'],
      orderNumber: json['station_inverter__order_number'],
      totalPvEnergy: json['pv_energy'],
      totalGridEnergy: json['grid_energy'],
      totalOutEnergy: json['out_energy'],
    );
  }
  Map<String, dynamic> toJson() {
    var json = {"id": id};
    return json;
  }
}

// Daily inverer history
class SmsaStationInverterDailyModel {
  int? id;
  DateTime? dateTime;
  double? deviceVoltage;
  double? pvVoltage;
  double? pvCurrent;
  double? pvPower;
  double? pvEnergy;
  double? gridVoltage;
  double? gridCurrent;
  double? gridPower;
  double? gridEnergy;
  double? outVoltage;
  double? outCurrent;
  double? outPower;
  double? outEnergy;

  SmsaStationInverterDailyModel({
    this.id,
    this.dateTime,
    this.deviceVoltage,
    this.pvVoltage,
    this.pvCurrent,
    this.pvPower,
    this.pvEnergy,
    this.gridVoltage,
    this.gridCurrent,
    this.gridPower,
    this.gridEnergy,
    this.outVoltage,
    this.outCurrent,
    this.outPower,
    this.outEnergy,
  });

  factory SmsaStationInverterDailyModel.fromJson(json) {
    return SmsaStationInverterDailyModel(
      id: json['id'],
      dateTime: DateTime.parse(json['date_time']),
      // deviceVoltage: json['device_voltage'],
      // pvVoltage: json['pv_voltage'],
      // pvCurrent: json['pv_current'],
      // pvPower: json['pv_power'],
      pvEnergy: json['pv_energy'],
      // gridVoltage: json['grid_voltage'],
      // gridCurrent: json['grid_current'],
      // gridPower: json['grid_power'],
      gridEnergy: json['grid_energy'],
      // outVoltage: json['out_voltage'],
      // outCurrent: json['out_current'],
      // outPower: json['out_power'],
      outEnergy: json['out_energy'],
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
      "out_voltage": outVoltage,
      "out_current": outCurrent,
      "out_power": outPower,
    };
    return json;
  }
}

class SmsaStationInverterDailyTotalModel {
  int? id;
  DateTime? dateTime;
  double? totalPvEnergy;
  double? totalGridEnergy;
  double? totalOutEnergy;
  List<SmsaStationInverterDailyModel>? smsaStationInverterDailyModelList;
  List<SmsaStationInverterTotalModel>? smsaStationInverterTotalModelList;

  SmsaStationInverterDailyTotalModel({
    this.id,
    this.dateTime,
    this.totalPvEnergy,
    this.totalGridEnergy,
    this.totalOutEnergy,
    this.smsaStationInverterDailyModelList,
    this.smsaStationInverterTotalModelList,
  });

  factory SmsaStationInverterDailyTotalModel.fromJson(json) {
    //List of timely history
    List<SmsaStationInverterDailyModel> inverterTimelyList = [];
    if (json.containsKey('timely_energy_list')) {
      List inverterTimelyListJson = json['timely_energy_list'];
      for (var inverterTimely in inverterTimelyListJson) {
        inverterTimelyList.add(
          SmsaStationInverterDailyModel.fromJson(inverterTimely),
        );
      }
    }

    //List of inverter total history
    List<SmsaStationInverterTotalModel> inverterTotalList = [];
    if (json.containsKey('timely_inverter_energy_list')) {
      List inverterTotalListJson = json['timely_inverter_energy_list'];
      for (var inverterTotal in inverterTotalListJson) {
        inverterTotalList.add(
          SmsaStationInverterTotalModel.fromJson(inverterTotal),
        );
      }
    }

    return SmsaStationInverterDailyTotalModel(
      id: json['id'],
      dateTime: DateTime.parse(json['date_time']),
      totalPvEnergy: json['total_pv_energy'],
      totalGridEnergy: json['total_grid_energy'],
      totalOutEnergy: json['total_out_energy'],
      smsaStationInverterDailyModelList: inverterTimelyList,
      smsaStationInverterTotalModelList: inverterTotalList,
    );
  }
  Map<String, dynamic> toJson() {
    var json = {"id": id};
    return json;
  }
}

// Monthly inverter history
class SmsaStationInverterMonthlyModel {
  int? id;
  DateTime? dateTime;
  double? pvEnergy;
  double? gridEnergy;
  double? outEnergy;

  SmsaStationInverterMonthlyModel({
    this.id,
    this.dateTime,
    this.pvEnergy,
    this.gridEnergy,
    this.outEnergy,
  });

  factory SmsaStationInverterMonthlyModel.fromJson(json) {
    return SmsaStationInverterMonthlyModel(
      id: json['id'],
      dateTime: DateTime.parse(json['date']),
      pvEnergy: json['pv_energy'],
      gridEnergy: json['grid_energy'],
      outEnergy: json['out_energy'],
    );
  }
  Map<String, dynamic> toJson() {
    var json = {"id": id, "date_time": dateTime};
    return json;
  }
}

class SmsaStationInverterMonthlyTotalModel {
  int? id;
  DateTime? dateTime;
  double? totalPvEnergy;
  double? totalGridEnergy;
  double? totalOutEnergy;
  List<SmsaStationInverterMonthlyModel>? smsaStationInverterMonthlyModelList;
  List<SmsaStationInverterTotalModel>? smsaStationInverterTotalModelList;

  SmsaStationInverterMonthlyTotalModel({
    this.id,
    this.dateTime,
    this.totalPvEnergy,
    this.totalGridEnergy,
    this.totalOutEnergy,
    this.smsaStationInverterMonthlyModelList,
    this.smsaStationInverterTotalModelList,
  });

  factory SmsaStationInverterMonthlyTotalModel.fromJson(json) {
    //List of timely history
    List<SmsaStationInverterMonthlyModel> inverterMonthlyList = [];
    if (json.containsKey('monthly_energy_list')) {
      List inverterMonthlyListJson = json['monthly_energy_list'];
      for (var inverterMonthly in inverterMonthlyListJson) {
        inverterMonthlyList.add(
          SmsaStationInverterMonthlyModel.fromJson(inverterMonthly),
        );
      }
    }

    //List of inverter total history
    List<SmsaStationInverterTotalModel> inverterTotalList = [];
    if (json.containsKey('monthly_inverter_energy_list')) {
      List inverterTotalListJson = json['monthly_inverter_energy_list'];
      for (var inverterTotal in inverterTotalListJson) {
        inverterTotalList.add(
          SmsaStationInverterTotalModel.fromJson(inverterTotal),
        );
      }
    }

    return SmsaStationInverterMonthlyTotalModel(
      id: json['id'],
      dateTime: DateTime.parse(json['date_time']),
      totalPvEnergy: json['total_pv_energy'],
      totalGridEnergy: json['total_grid_energy'],
      totalOutEnergy: json['total_out_energy'],
      smsaStationInverterMonthlyModelList: inverterMonthlyList,
      smsaStationInverterTotalModelList: inverterTotalList,
    );
  }
  Map<String, dynamic> toJson() {
    var json = {"id": id};
    return json;
  }
}

// Yearly inverter history
class SmsaStationInverterYearlyModel {
  int? id;
  DateTime? dateTime;
  double? pvEnergy;
  double? gridEnergy;
  double? outEnergy;

  SmsaStationInverterYearlyModel({
    this.id,
    this.dateTime,
    this.pvEnergy,
    this.gridEnergy,
    this.outEnergy,
  });

  factory SmsaStationInverterYearlyModel.fromJson(json) {
    return SmsaStationInverterYearlyModel(
      id: json['id'],
      dateTime: DateTime.parse(json['date']),
      pvEnergy: json['pv_energy'],
      gridEnergy: json['grid_energy'],
      outEnergy: json['out_energy'],
    );
  }
  Map<String, dynamic> toJson() {
    var json = {"id": id, "date_time": dateTime};
    return json;
  }
}

class SmsaStationInverterYearlyTotalModel {
  int? id;
  DateTime? dateTime;
  double? totalPvEnergy;
  double? totalGridEnergy;
  double? totalOutEnergy;
  List<SmsaStationInverterYearlyModel>? smsaStationInverterYearlyModelList;
  List<SmsaStationInverterTotalModel>? smsaStationInverterTotalModelList;

  SmsaStationInverterYearlyTotalModel({
    this.id,
    this.dateTime,
    this.totalPvEnergy,
    this.totalGridEnergy,
    this.totalOutEnergy,
    this.smsaStationInverterYearlyModelList,
    this.smsaStationInverterTotalModelList,
  });

  factory SmsaStationInverterYearlyTotalModel.fromJson(json) {
    //List of timely history
    List<SmsaStationInverterYearlyModel> inverterYearlyList = [];
    if (json.containsKey('yearly_energy_list')) {
      List inverterYearlyListJson = json['yearly_energy_list'];
      for (var inverterYearly in inverterYearlyListJson) {
        inverterYearlyList.add(
          SmsaStationInverterYearlyModel.fromJson(inverterYearly),
        );
      }
    }

    //List of inverter total history
    List<SmsaStationInverterTotalModel> inverterTotalList = [];
    if (json.containsKey('yearly_inverter_energy_list')) {
      List inverterTotalListJson = json['yearly_inverter_energy_list'];
      for (var inverterTotal in inverterTotalListJson) {
        inverterTotalList.add(
          SmsaStationInverterTotalModel.fromJson(inverterTotal),
        );
      }
    }

    return SmsaStationInverterYearlyTotalModel(
      id: json['id'],
      dateTime: DateTime.parse(json['date_time']),
      totalPvEnergy: json['total_pv_energy'],
      totalGridEnergy: json['total_grid_energy'],
      totalOutEnergy: json['total_out_energy'],
      smsaStationInverterYearlyModelList: inverterYearlyList,
      smsaStationInverterTotalModelList: inverterTotalList,
    );
  }
  Map<String, dynamic> toJson() {
    var json = {"id": id};
    return json;
  }
}
