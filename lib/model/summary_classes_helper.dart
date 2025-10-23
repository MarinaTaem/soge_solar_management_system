class InverterDailySummary {
  final String name;
  final double pvKwh;
  final double gridKwh;
  final double outputKwh;
  final int samples; // number of snapshots

  InverterDailySummary({
    required this.name,
    required this.pvKwh,
    required this.gridKwh,
    required this.outputKwh,
    required this.samples,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'pv_kwh': pvKwh,
        'grid_kwh': gridKwh,
        'output_kwh': outputKwh,
        'samples': samples,
      };
}
