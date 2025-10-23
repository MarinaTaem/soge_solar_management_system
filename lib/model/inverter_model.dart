class Inverter {
  String name;
  String station;
  bool status;
  double pv_v;
  double pv_a;
  double pv;
  double grid_a;
  double grid;
  double output_v;
  double output_a;
  double output;
  double output_hz;

  Inverter(
      {required this.name,
      required this.station,
      required this.status,
      required this.pv_v,
      required this.pv_a,
      required this.pv,
      required this.grid_a,
      required this.grid,
      required this.output_v,
      required this.output_a,
      required this.output,
      required this.output_hz});
}

class ParamInverter {
  late String nameStation;
  late String nameInverter;
  late bool status;
  late double pvPower;
  late double gridPower;
  late double outputPower;
  late double outputFrequency;
  late double presetFrequency;
  late double pvVoltage;
  late double outputVoltage;
  late double outputCurrent;
  late double pvInputCurrent;
  late P0_00 p0_00;
  late P0_01 p0_01;
  late P0_02 p0_02;
  late double p0_08;
  late P0_09 p0_09;
  late double p0_10;
  late double p1_01;
  late double p1_02;
  late double p1_03;
  late double p1_04;
  late double p1_05;
  late PE_00 pe00;
  late double pe16;
  late double pe17;
  late double pe18;
  late double pe19;
  late double pe20;
  late double pe21;
  late double pe22;
  late double pe23;
  late double pe24;
  late double pe25;
  late double pe26;
  late double pe27;

  ParamInverter({
    required this.nameStation,
    required this.nameInverter,
    required this.status,
    required this.pvPower,
    required this.gridPower,
    required this.outputPower,
    required this.outputFrequency,
    required this.presetFrequency,
    required this.pvVoltage,
    required this.outputVoltage,
    required this.outputCurrent,
    required this.pvInputCurrent,
    required this.p0_00,
    required this.p0_01,
    required this.p0_02,
    required this.p0_08,
    required this.p0_09,
    required this.p0_10,
    required this.p1_01,
    required this.p1_02,
    required this.p1_03,
    required this.p1_04,
    required this.p1_05,
    required this.pe00,
    required this.pe16,
    required this.pe17,
    required this.pe18,
    required this.pe19,
    required this.pe20,
    required this.pe21,
    required this.pe22,
    required this.pe23,
    required this.pe24,
    required this.pe25,
    required this.pe26,
    required this.pe27,
  });

  // from json
  factory ParamInverter.fromJson(Map<String, dynamic> json) {
    return ParamInverter(
      nameStation: json['name_station'] ?? '',
      nameInverter: json['name_inverter'] ?? '',
      status: json['status'] ?? false,
      pvPower: json['pv_power'] ?? 0,
      gridPower: json['grid_power'] ?? 0,
      outputPower: json['output_power'] ?? 0,
      outputFrequency: json['output_frequency'] ?? 0,
      presetFrequency: json['preset_frequency'] ?? 0,
      pvVoltage: json['pv_voltage'] ?? 0,
      outputVoltage: json['output_voltage'] ?? 0,
      outputCurrent: json['output_current'] ?? 0,
      pvInputCurrent: json['pv_input_current'] ?? 0,
      p0_00: P0_00Extenstion.fromValue(json['p0_00'] as int),
      p0_01: P0_01Extenstion.fromValue(json['p0_01'] as int),
      p0_02: P0_02Extenstion.fromValue(json['p0_02'] as int),
      p0_08: json['p0_08'] ?? 0,
      p0_09: P0_09Extenstion.fromValue(json['p0_09'] as int),
      p0_10: json['p0_10'] ?? 0,
      p1_01: json['p1_01'] ?? 0,
      p1_02: json['p1_02'] ?? 0,
      p1_03: json['p1_03'] ?? 0,
      p1_04: json['p1_04'] ?? 0,
      p1_05: json['p1_05'] ?? 0,
      pe00: PE_00Extenstion.fromValue(json['pe_00'] as int),
      pe16: json['pe_16'] ?? 0,
      pe17: json['pe_17'] ?? 0,
      pe18: json['pe_18'] ?? 0,
      pe19: json['pe_19'] ?? 0,
      pe20: json['pe_20'] ?? 0,
      pe21: json['pe_21'] ?? 0,
      pe22: json['pe_22'] ?? 0,
      pe23: json['pe_23'] ?? 0,
      pe24: json['pe_24'] ?? 0,
      pe25: json['pe_25'] ?? 0,
      pe26: json['pe_26'] ?? 0,
      pe27: json['pe_27'] ?? 0,
    );
  }
  // to Json
  Map<String, dynamic> toJson() {
    return {
      'name_inverter': nameInverter,
      'status': status,
      'output_fequency': outputFrequency,
      'preset_frequency': presetFrequency,
      'pv_voltage': pvVoltage,
      'output_voltage': outputVoltage,
      'output_current': outputCurrent,
      'output_power': outputPower,
      'pv_input_current': pvInputCurrent,
      'p0_00': p0_00.value,
      'p0_01': p0_01.value,
      'p0_02': p0_02.value,
      'p0_08': p0_08,
      'p0_09': p0_09.value,
      'p0_10': p0_10,
      'p1_01': p1_01,
      'p1_02': p1_02,
      'p1_03': p1_03,
      'p1_04': p1_04,
      'p1_05': p1_05,
      'pe00': pe00.value,
      'pe16': pe16,
      'pe17': pe17,
      'pe18': pe18,
      'pe19': pe19,
      'pe20': pe20,
      'pe21': pe21,
      'pe22': pe22,
      'pe23': pe23,
      'pe24': pe24,
      'pe25': pe25,
      'pe26': pe26,
      'pe27': pe27,
    };
  }
}

// P0_00
enum P0_00 {
  gType,
  pType,
}

// to get value type & description
// & convert int back to enum
extension P0_00Extenstion on P0_00 {
  int get value {
    switch (this) {
      case P0_00.gType:
        return 1;
      case P0_00.pType:
        return 2;
    }
  }

  String get description {
    switch (this) {
      case P0_00.gType:
        return 'G Type';
      case P0_00.pType:
        return 'P Type';
    }
  }

  static P0_00 fromValue(int value) {
    switch (value) {
      case 1:
        return P0_00.gType;
      case 2:
        return P0_00.pType;
      default:
        throw ArgumentError('Invalid P0_00 value: $value');
    }
  }
}

// P0_01
enum P0_01 {
  vfControl,
  sensorless,
  sensor,
  twoWires,
  threeWires,
}

// to get value type & description
// & convert int back to enum
extension P0_01Extenstion on P0_01 {
  int get value {
    switch (this) {
      case P0_01.vfControl:
        return 0;
      case P0_01.sensorless:
        return 1;
      case P0_01.sensor:
        return 2;
      case P0_01.twoWires:
        return 3;
      case P0_01.threeWires:
        return 4;
    }
  }

  String get description {
    switch (this) {
      case P0_01.vfControl:
        return 'VF control';
      case P0_01.sensorless:
        return 'Sensorless vector control';
      case P0_01.sensor:
        return 'Sensor vector control';
      case P0_01.twoWires:
        return '2 wires output control';
      case P0_01.threeWires:
        return '3 wires output control';
    }
  }

  static P0_01 fromValue(int value) {
    switch (value) {
      case 0:
        return P0_01.vfControl;
      case 1:
        return P0_01.sensorless;
      case 2:
        return P0_01.sensor;
      case 3:
        return P0_01.twoWires;
      case 4:
        return P0_01.threeWires;
      default:
        throw ArgumentError('Invalid P0_01 value: $value');
    }
  }
}

// P0_02
enum P0_02 {
  keypad,
  terminalCmd,
  rs485,
}

// to get value type & description
// & convert int back to enum
extension P0_02Extenstion on P0_02 {
  int get value {
    switch (this) {
      case P0_02.keypad:
        return 0;
      case P0_02.terminalCmd:
        return 1;
      case P0_02.rs485:
        return 2;
    }
  }

  String get description {
    switch (this) {
      case P0_02.keypad:
        return 'Keypad';
      case P0_02.terminalCmd:
        return 'Terminal command';
      case P0_02.rs485:
        return 'RS485';
    }
  }

  static P0_02 fromValue(int value) {
    switch (value) {
      case 0:
        return P0_02.keypad;
      case 1:
        return P0_02.terminalCmd;
      case 2:
        return P0_02.rs485;
      default:
        throw ArgumentError('Invalid P0_02 value: $value');
    }
  }
}

// P0_09
enum P0_09 {
  motorForward,
  motorReverse,
}

// to get value type & description
// & convert int back to enum
extension P0_09Extenstion on P0_09 {
  int get value {
    switch (this) {
      case P0_09.motorForward:
        return 0;
      case P0_09.motorReverse:
        return 1;
    }
  }

  String get description {
    switch (this) {
      case P0_09.motorForward:
        return 'Motor forward';
      case P0_09.motorReverse:
        return 'Motor reverse';
    }
  }

  static P0_09 fromValue(int value) {
    switch (value) {
      case 0:
        return P0_09.motorForward;
      case 1:
        return P0_09.motorReverse;
      default:
        throw ArgumentError('Invalid P0_09 value: $value');
    }
  }
}

// P0_09
enum PE_00 {
  ved,
  solarPump,
}

// to get value type & description
// & convert int back to enum
extension PE_00Extenstion on PE_00 {
  int get value {
    switch (this) {
      case PE_00.ved:
        return 0;
      case PE_00.solarPump:
        return 1;
    }
  }

  String get description {
    switch (this) {
      case PE_00.ved:
        return 'VED';
      case PE_00.solarPump:
        return 'Solar Pump';
    }
  }

  static PE_00 fromValue(int value) {
    switch (value) {
      case 0:
        return PE_00.ved;
      case 1:
        return PE_00.solarPump;
      default:
        throw ArgumentError('Invalide PE_00 value: $value');
    }
  }
}
