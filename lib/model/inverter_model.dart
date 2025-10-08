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
  String name;
  bool status;
  double output_frequency;
  double preset_frequency;
  double pv_voltage;
  double output_voltage;
  double output_current;
  double output_power;
  double pv_input_current;
  P0_00 p0_00;
  P0_01 p0_01;
  P0_02 p0_02;
  double p0_08;
  P0_09 p0_09;
  double p0_10;
  double p1_01;
  double p1_02;
  double p1_03;
  double p1_04;
  double p1_05;
  PE_00 pe00;
  double pe16;
  double pe17;
  double pe18;
  double pe19;
  double pe20;
  double pe21;
  double pe22;
  double pe23;
  double pe24;
  double pe25;
  double pe26;
  double pe27;

  ParamInverter({
    required this.name,
    required this.status,
    required this.output_frequency,
    required this.preset_frequency,
    required this.pv_voltage,
    required this.output_voltage,
    required this.output_current,
    required this.output_power,
    required this.pv_input_current,
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
}

// P0_00
enum P0_00 {
  gType,
  pType,
}

// to get value type & description
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
}

// P0_02
enum P0_02 {
  keypad,
  terminalCmd,
  rs485,
}

// to get value type & description
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
}

// P0_09
enum P0_09 {
  motorForward,
  motorReverse,
}

// to get value type & description
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
}

// P0_09
enum PE_00 {
  ved,
  solarPump,
}

// to get value type & description
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
}
