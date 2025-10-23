import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solar_management_system/inverter/history_inverters/inverters_history_screen.dart';
import 'package:solar_management_system/inverter/inverter_screen.dart';
import 'package:solar_management_system/model/inverter_model.dart';
import 'package:solar_management_system/style/app_colors.dart';

class StationDetailScreen extends StatefulWidget {
  const StationDetailScreen({super.key});

  @override
  State<StationDetailScreen> createState() => _StationDetailScreenState();
}

class _StationDetailScreenState extends State<StationDetailScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<ParamInverter> paramInverter = [
    ParamInverter(
      nameStation: '',
      nameInverter: 'Inverter 0',
      status: false,
      pvPower: 0,
      gridPower: 0,
      outputPower: 0,
      outputFrequency: 0,
      presetFrequency: 39.1,
      pvVoltage: 528.9,
      outputVoltage: 0,
      outputCurrent: 0,
      pvInputCurrent: 0,
      p0_00: P0_00.gType,
      p0_01: P0_01.sensorless,
      p0_02: P0_02.terminalCmd,
      p0_08: 50,
      p0_09: P0_09.motorForward,
      p0_10: 50,
      p1_01: 500,
      p1_02: 400,
      p1_03: 11,
      p1_04: 50,
      p1_05: 500,
      pe00: PE_00.ved,
      pe16: 500,
      pe17: 490,
      pe18: 60,
      pe19: 50,
      pe20: 0,
      pe21: 0,
      pe22: 10,
      pe23: 20,
      pe24: 60,
      pe25: 11,
      pe26: 50,
      pe27: 60,
    ),
    ParamInverter(
      nameStation: '',
      nameInverter: 'Inverter 2',
      status: false,
      pvPower: 0,
      gridPower: 0,
      outputPower: 0,
      outputFrequency: 0,
      presetFrequency: 39.1,
      pvVoltage: 528.9,
      outputVoltage: 0,
      outputCurrent: 0,
      pvInputCurrent: 0,
      p0_00: P0_00.gType,
      p0_01: P0_01.sensorless,
      p0_02: P0_02.terminalCmd,
      p0_08: 50,
      p0_09: P0_09.motorForward,
      p0_10: 50,
      p1_01: 500,
      p1_02: 400,
      p1_03: 11,
      p1_04: 50,
      p1_05: 500,
      pe00: PE_00.ved,
      pe16: 500,
      pe17: 490,
      pe18: 60,
      pe19: 50,
      pe20: 0,
      pe21: 0,
      pe22: 10,
      pe23: 20,
      pe24: 60,
      pe25: 11,
      pe26: 50,
      pe27: 60,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/images/arrow_back.svg',
            height: 30.0,
            width: 30.0,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Kirrirom',
          style: TextStyle(fontSize: 18, color: AppColor.textPrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/notification.svg'),
          ),
          IconButton(
            onPressed: () {
              print('Inverter lenge == ${paramInverter.length}');
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (context) => InvertersHistoryScreen(
                          paramInverter: paramInverter[0],
                        )),
              );
            },
            icon: SvgPicture.asset('assets/images/history.svg'),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: 'ប្រព័ន្ធសូឡា',
            ),
            Tab(text: 'អាំងវែកទ័រ'),
            Tab(text: 'ទ្វាទឹក'),
          ],
          labelColor: AppColor.bluskyLight,
          unselectedLabelColor: AppColor.textSecondary,
          indicatorColor: AppColor.bluskyLight,
          // indicatorWeight: 100,
          indicatorSize: TabBarIndicatorSize.tab,
          // overlayColor: ,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Text('ប្រព័ន្ធសូឡា'),
          ),
          Center(
            child: InverterScreen(),
          ),
          Center(
            child: Text('ទ្វាទឹក'),
          ),
        ],
      ),
    );
  }
}
