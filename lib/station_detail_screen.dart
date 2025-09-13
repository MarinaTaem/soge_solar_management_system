import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:solar_management_system/inverter/history_inverters/inverters_history_screen.dart';
import 'package:solar_management_system/inverter/inverter_screen.dart';
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
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                    builder: (context) => const InvertersHistoryScreen()),
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
