import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_admin/common/constants/app_color.dart';
import 'package:web_admin/common/constants/app_style.dart';
import 'package:web_admin/features/home_admin/presentations/bloc/home_bloc.dart';
import 'package:web_admin/utils/format_text.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0.h),
      margin: EdgeInsets.all(20.0.h),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.isLoading) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisExtent: 134.0.h,
                  ),
                  children: [
                    _buildHomeGridItem(
                        title: 'Customer',
                        subTitle: state.totalUser.toString(),
                        icon: Icons.people_sharp,
                        iconColor: Colors.orange[300]),
                    _buildHomeGridItem(
                        title: 'Order',
                        subTitle: state.totalOrder.toString(),
                        icon: Icons.shopping_cart,
                        iconColor: Colors.purple[300]),
                    _buildHomeGridItem(
                        title: 'Total Sale',
                        subTitle: FormatText.formatUSD(state.totalSale),
                        icon: Icons.calculate_rounded,
                        iconColor: Colors.blue[300]),
                    _buildHomeGridItem(
                      title: 'Total Product',
                      subTitle:state.totalProduct.toString(),
                      icon: Icons.roller_skating,
                      iconColor: Colors.green[300],
                    ),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildHomeGridItem(
      {String? title, String? subTitle, IconData? icon, Color? iconColor}) {
    return Container(
      padding: EdgeInsets.all(20.0.h),
      margin: EdgeInsets.all(20.0.h),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10.0.r),
        border: Border.all(color: AppColor.greyColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title ?? '',
                  style:
                      AppStyle.regular12.copyWith(fontWeight: FontWeight.bold)),
              Text(subTitle ?? '', style: AppStyle.regular12)
            ],
          ),
          Icon(
            icon,
            color: iconColor,
            size: 30.sp,
          )
        ],
      ),
    );
  }
}
