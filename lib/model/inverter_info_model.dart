class InverterInfoModel {
  String nameInverter;
  String serialNumber;
  String model;
  double maxCapacity;
  double rateEfficiency;
  double currentEfficiency;
  double totalOutput;
  DateTime dateInstall;
  String stationName;
  bool status;

  InverterInfoModel({
    required this.nameInverter,
    required this.serialNumber,
    required this.model,
    required this.maxCapacity,
    required this.rateEfficiency,
    required this.currentEfficiency,
    required this.totalOutput,
    required this.dateInstall,
    required this.stationName,
    required this.status,
  });

  factory InverterInfoModel.fromJson(Map<String, dynamic> json) {
    return InverterInfoModel(
      nameInverter: json['name_inverter'] ?? '',
      serialNumber: json['serial_number'] ?? '',
      model: json['model'] ?? '',
      maxCapacity: json['max_capacity'] ?? '',
      rateEfficiency: json['rate_efficiency'] ?? '',
      currentEfficiency: json['current_efficiency'] ?? '',
      totalOutput: json['total_output'] ?? 0,
      dateInstall: json['date_install'] ?? '',
      stationName: json['station_name'] ?? '',
      status: json['status'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name_inverter': nameInverter,
      'serial_number': serialNumber,
      'model': model,
      'max_capacity': maxCapacity,
      'rate_efficiency': rateEfficiency,
      'current_efficiency': currentEfficiency,
      'total_output': totalOutput,
      'date_install': dateInstall,
      'station_name': stationName,
      'stutus': status,
    };
  }
}
