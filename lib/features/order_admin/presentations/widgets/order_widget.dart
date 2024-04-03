import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_admin/common/components/dialog/app_dialog.dart';
import 'package:web_admin/common/constants/app_color.dart';
import 'package:web_admin/common/constants/app_style.dart';
import 'package:web_admin/common/extensions/build_context_extension.dart';
import 'package:web_admin/entities/models/payment_model.dart';
import 'package:web_admin/features/order_admin/presentations/bloc/order_bloc.dart';
import 'package:web_admin/utils/format_text.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderBloc, OrderState>(
      listener: (context, state) {
        if (state.isLoading) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(20.0.h),
          margin: EdgeInsets.all(20.0.h),
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.0.h),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.greyColor),
                      borderRadius: BorderRadius.circular(10.0.r),
                    ),
                    child: ListView(
                      children: [
                        _buildOderItemList(context),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.payments.length,
                          separatorBuilder: (_, __) => const Divider(
                            indent: 0,
                            endIndent: 0,
                          ),
                          itemBuilder: (context, index) {
                            final data = state.payments[index];
                            return _buildOderItemList(context,
                                onTapShowDetailOrder: () => showDialog(
                                      context: context,
                                      builder: (_) {
                                        return _buildFormShowOder(context,
                                            payment: data);
                                      },
                                    ),
                                isHeader: false,
                                orderId: data.paymentId,
                                customerName: data.customerName,
                                paymentMethod: data.paymentMethod,
                                price: FormatText.formatUSD(
                                    data.totalPrice!.toDouble()),
                                orderDate:
                                    FormatText.formatDate(data.createdAt!),
                                status: data.paymentStatus ? 'Paid' : 'Unpaid');
                          },
                        ),
                      ],
                    )),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildFormShowOder(BuildContext context,
      {required PaymentModel payment}) {
    return BlocProvider.value(
      value: BlocProvider.of<OrderBloc>(context),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return Form(
              child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              height: MediaQuery.of(context).size.height * 0.8,
              padding: EdgeInsets.all(20.0.h),
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Stack(
                children: [
                  ListView(
                    children: [
                      Text('Order #${payment.paymentId}',
                          textAlign: TextAlign.center,
                          style: AppStyle.regular14
                              .copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: 20.0.h),
                      Row(
                        children: [
                          _buildCustomerInfoItem(
                            icon: Icons.shopping_cart_rounded,
                            title: 'Order created at',
                            subTitle: payment.createdAt.toString(),
                            backGroundColor: Colors.green.withOpacity(0.2),
                            foregroundcolor:
                                const Color.fromARGB(255, 0, 170, 43),
                          ),
                          const SizedBox(width: 20.0),
                          _buildCustomerInfoItem(
                            icon: Icons.person,
                            title: 'Name',
                            subTitle: payment.customerName!,
                            backGroundColor: Colors.red.withOpacity(0.2),
                            foregroundcolor:
                                const Color.fromARGB(255, 185, 0, 0),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          _buildCustomerInfoItem(
                            icon: Icons.email,
                            title: 'Email',
                            subTitle: payment.email!,
                            backGroundColor: Colors.yellow.withOpacity(0.2),
                            foregroundcolor:
                                const Color.fromARGB(255, 187, 174, 0),
                          ),
                          const SizedBox(width: 20.0),
                          _buildCustomerInfoItem(
                            icon: Icons.phone,
                            title: 'Phone number',
                            subTitle: payment.phoneNumber!,
                            backGroundColor: Colors.blueAccent.withOpacity(0.2),
                            foregroundcolor:
                                const Color.fromARGB(255, 0, 139, 231),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0.w),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.all(20.0.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.greyColor),
                          borderRadius: BorderRadius.circular(10.0.r),
                        ),
                        child: Column(
                          children: [
                            _buildListRightItem(
                              title: 'Total price:',
                              label: FormatText.formatUSD(payment.totalPrice!),
                            ),
                            _buildListRightItem(
                              title: 'Total product:',
                              label: payment.totalProduct.toString(),
                            ),
                            SizedBox(height: 10.0.h),
                            _buildListRightItem(
                                title: 'Address:', label: payment.address),
                            SizedBox(height: 10.0.h),
                            _buildListRightItem(
                                title: 'Note:', label: payment.note),
                            SizedBox(height: 10.0.h),
                            _buildListRightItem(
                                title: 'Payment method:',
                                label: payment.paymentMethod),
                            _buildListRightItem(
                                title: 'Payment status:',
                                label:
                                    payment.paymentStatus ? 'Paid' : 'Unpaid'),
                          ],
                        ),
                      )),
                      SizedBox(height: 20.0.h),
                      Container(
                        padding: EdgeInsets.all(20.0.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.greyColor),
                          borderRadius: BorderRadius.circular(10.0.r),
                        ),
                        child: Column(
                          children: [
                            ...List.generate(
                              payment.cartData.length,
                              (index) {
                                final product = payment.cartData[index];
                                return _buildOderItemDetailList(
                                    name: product.productName,
                                    pathImage: product.productImage,
                                    price: product.productPrice.toString(),
                                    size: product.size.toString(),
                                    quantity: product.quantity.toString());
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: () => context.getNavigator().pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }

  Widget _buildListRightItem({
    String? title,
    String? label,
  }) {
    return Row(
      children: [
        SizedBox(
          width: 120.w,
          child: Text(
            title ?? '',
            style: AppStyle.regular14.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Text(label ?? '',
            textAlign: TextAlign.center, style: AppStyle.regular14),
      ],
    );
  }

  Widget _buildCustomerInfoItem({
    required Color backGroundColor,
    required IconData icon,
    required String title,
    required String subTitle,
    required Color foregroundcolor,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10.0.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0.r),
            border: Border.all(color: foregroundcolor),
            color: backGroundColor),
        child: Row(
          children: [
            Container(
              width: 40.0.h,
              height: 40.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: foregroundcolor,
              ),
              child: Icon(icon, color: Colors.white),
            ),
            SizedBox(width: 10.0.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: foregroundcolor,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0.h),
                Text(
                  subTitle,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: foregroundcolor,
                    fontSize: 10.0.sp,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOderItemList(BuildContext context,
      {String? orderId = 'ORDER ID',
      String? customerName = 'CUSTOM NAME',
      String? paymentMethod = 'PAYMENT METHOD',
      String? price = 'PRICE',
      String? orderDate = "ORDER DATE",
      String? status = 'STATUS',
      void Function()? onTapShowDetailOrder,
      bool? isHeader = true}) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: onTapShowDetailOrder,
              child: Text(
                orderId ?? '',
                style: AppStyle.regular12.copyWith(
                    fontWeight: isHeader == true ? FontWeight.bold : null),
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Text(
                customerName ?? '',
                style: AppStyle.regular12.copyWith(
                    fontWeight: isHeader == true ? FontWeight.bold : null),
              )),
          Expanded(
            flex: 3,
            child: Text(
              paymentMethod ?? '',
              style: AppStyle.regular12.copyWith(
                  fontWeight: isHeader == true ? FontWeight.bold : null),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              price ?? '',
              style: AppStyle.regular12.copyWith(
                  fontWeight: isHeader == true ? FontWeight.bold : null),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              orderDate ?? '',
              style: AppStyle.regular12.copyWith(
                  fontWeight: isHeader == true ? FontWeight.bold : null),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              status ?? '',
              style: AppStyle.regular12.copyWith(
                  fontWeight: isHeader == true ? FontWeight.bold : null),
            ),
          ),
          Expanded(
            flex: 1,
            child: isHeader == true
                ? const SizedBox()
                : Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () => AppDiaLog.showAwesomeConfirmDialog(
                          context,
                          content: 'Do you want to cancel this order?',
                          btnOkOnPress: () => context
                              .getBloc<OrderBloc>()
                              .add(OnTapCancelOrderEvent(orderId!)),
                        ),
                        child: const Icon(Icons.remove_circle_outline,
                            color: Colors.red),
                      )),
                      SizedBox(width: 20.0.w),
                      const Expanded(
                          child: Icon(Icons.check_circle_outlined,
                              color: Colors.green)),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildOderItemDetailList({
    String? name,
    String? price,
    String? size,
    String? pathImage,
    String? quantity,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Container(
            height: 45.0.w,
            width: 45.0.w,
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12.0.r),
              image: DecorationImage(
                image: NetworkImage(pathImage ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.0.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name ?? '', style: AppStyle.regular14),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$ $price, Size: $size',
                        style: AppStyle.regular12
                            .copyWith(fontWeight: FontWeight.bold)),
                    Text('X $quantity',
                        style: AppStyle.regular12
                            .copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
