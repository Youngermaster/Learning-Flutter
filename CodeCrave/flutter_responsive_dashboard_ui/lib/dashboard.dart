import 'package:flutter/material.dart';
import 'package:flutter_responsive_dashboard_ui/component/appBarActionItems.dart';
import 'package:flutter_responsive_dashboard_ui/component/barChart.dart';
import 'package:flutter_responsive_dashboard_ui/component/header.dart';
import 'package:flutter_responsive_dashboard_ui/component/historyTable.dart';
import 'package:flutter_responsive_dashboard_ui/component/infoCard.dart';
import 'package:flutter_responsive_dashboard_ui/component/paymentDetailList.dart';
import 'package:flutter_responsive_dashboard_ui/component/sideMenu.dart';
import 'package:flutter_responsive_dashboard_ui/config/responsive.dart';
import 'package:flutter_responsive_dashboard_ui/config/size_config.dart';
import 'package:flutter_responsive_dashboard_ui/style/colors.dart';
import 'package:flutter_responsive_dashboard_ui/style/style.dart';

class Dashboard extends StatelessWidget {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      drawer: SizedBox(width: 100, child: SideMenu()),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.menu, color: AppColors.black)),
              actions: [
                AppBarActionItems(),
              ],
            )
          : PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 1,
                child: SideMenu(),
              ),
            Expanded(
                flex: 10,
                child: SafeArea(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Header(),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        SizedBox(
                          width: SizeConfig.screenWidth,
                          child: Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.spaceBetween,
                            children: [
                              InfoCard(
                                  icon: 'assets/credit-card.svg',
                                  label: 'Transafer via \nCard number',
                                  amount: '\$1200'),
                              InfoCard(
                                  icon: 'assets/transfer.svg',
                                  label: 'Transafer via \nOnline Banks',
                                  amount: '\$150'),
                              InfoCard(
                                  icon: 'assets/bank.svg',
                                  label: 'Transafer \nSame Bank',
                                  amount: '\$1500'),
                              InfoCard(
                                  icon: 'assets/invoice.svg',
                                  label: 'Transafer to \nOther Bank',
                                  amount: '\$1500'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryText(
                                  text: 'Balance',
                                  size: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.secondary,
                                ),
                                PrimaryText(
                                    text: '\$1500',
                                    size: 30,
                                    fontWeight: FontWeight.w800),
                              ],
                            ),
                            PrimaryText(
                              text: 'Past 30 DAYS',
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                        Container(
                          height: 180,
                          child: BarChartCopmponent(),
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                                text: 'History',
                                size: 30,
                                fontWeight: FontWeight.w800),
                            PrimaryText(
                              text: 'Transaction of lat 6 month',
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.secondary,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: SizeConfig.blockSizeVertical! * 3,
                        ),
                        HistoryTable(),
                        if (!Responsive.isDesktop(context)) PaymentDetailList()
                      ],
                    ),
                  ),
                )),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: SizeConfig.screenHeight,
                    decoration: BoxDecoration(color: AppColors.secondaryBg),
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: Column(
                        children: [
                          AppBarActionItems(),
                          PaymentDetailList(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
