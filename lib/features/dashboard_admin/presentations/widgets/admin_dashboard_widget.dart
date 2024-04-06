import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_admin/common/constants/app_color.dart';
import 'package:web_admin/common/constants/app_style.dart';
import 'package:web_admin/common/extensions/build_context_extension.dart';
import 'package:web_admin/common/navigator/navigator.dart';
import 'package:web_admin/entities/models/page_model.dart';
import 'package:web_admin/features/category_admin/presentations/page/admin_category_page.dart';
import 'package:web_admin/features/dashboard_admin/presentations/bloc/admin_dashboard_bloc.dart';
import 'package:web_admin/features/home_admin/presentations/page/home_page.dart';
import 'package:web_admin/features/order_admin/presentations/page/order_page.dart';
import 'package:web_admin/features/product_admin/presentations/page/admin_product_page.dart';
import 'package:web_admin/features/staff_manager/presentations/page/staff_manager_page.dart';

// ignore: must_be_immutable
class AdminDashboardWidget extends StatelessWidget {
  final bool isAdmin;
  AdminDashboardWidget({super.key, required this.isAdmin});
  List<PageModel> pages = [
    PageModel(title: 'Home Page', page: const HomePage()),
    PageModel(title: 'Products', page: const AdminAddProductPage()),
    PageModel(title: 'Categories', page: const AdminCategoryPage()),
    PageModel(title: 'Orders', page: const OrderPage()),
  ];
  @override
  Widget build(BuildContext context) {
    if (isAdmin) {
      pages.add(
          PageModel(title: 'Staff manager', page: const StaffManagerPage()));
    }
    return Scaffold(
      backgroundColor: AppColor.adminBackgroundColor,
      body: BlocConsumer<AdminDashboardBloc, AdminDashboardState>(
        listener: (context, state) {
          if (state.isLoading) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
          }
        },
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: AppColor.adminTextColor,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'NIKE SHOE SHOP',
                            style: AppStyle.adminMedium16
                                .copyWith(color: AppColor.adminBackgroundColor),
                          ),
                        ),
                      ),
                      const Divider(height: 0),
                      Expanded(
                          flex: 10,
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: pages.length,
                                itemBuilder: (context, index) {
                                  return _buildSideBarItem(
                                    backgroundColor: state.pageIndex == index
                                        ? AppColor.adminBackgroundColor
                                        : AppColor.adminTextColor,
                                    textColor: state.pageIndex == index
                                        ? AppColor.adminTextColor
                                        : AppColor.adminBackgroundColor,
                                    label: pages[index].title,
                                    onTap: () => context
                                        .getBloc<AdminDashboardBloc>()
                                        .add(AdminDashBoardChangePageEvent(
                                            index)),
                                  );
                                },
                              ),
                              const Spacer(),
                              _buildSideBarItem(
                                label: 'Logout',
                                textColor: AppColor.adminBackgroundColor,
                                onTap: ()=> context.getNavigator().pushAndRemoveUntil(screen: const ScreenType.adminLogin()),
                              ), 
                              SizedBox(height: 50.0.h)
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(right: 50.0.w),
                        color: AppColor.whiteColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Thanh Minh',
                                  style: AppStyle.regular12
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5.0.h),
                                Text(
                                  isAdmin ? 'Admin' : 'Staff',
                                  style: AppStyle.regular12,
                                )
                              ],
                            ),
                            SizedBox(width: 10.0.w),
                            CircleAvatar(
                              radius: 20.0.w,
                              backgroundImage: const NetworkImage(
                                  'https://th.bing.com/th/id/OIP.YamThAfETQJZRHNHwcjeCAHaE7?rs=1&pid=ImgDetMain'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: IndexedStack(
                        index: state.pageIndex,
                        children: List.generate(
                          pages.length,
                          (_) => pages[state.pageIndex].page,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSideBarItem({
    required VoidCallback onTap,
    required String label,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.0.h),
        color: backgroundColor,
        child: Row(
          children: [
            Icon(Icons.dashboard_outlined, color: textColor, size: 18),
            const SizedBox(width: 5),
            Expanded(
              child: Text(
                label,
                style: AppStyle.adminMedium14.copyWith(color: textColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
