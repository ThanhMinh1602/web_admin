part of 'navigator.dart';

@freezed
class ScreenType with _$ScreenType {
  //web admin
  const factory ScreenType.adminDashBoard(bool isAdmin) = ScreenTypeAdDashBoard;
}

class ScreenTypeHelper {
  static Widget page(ScreenType screenType) {
    return screenType.when(
      adminDashBoard: (isAdmin) => AdminDashboardPage(
        isAdmin: isAdmin,
      ),
    );
  }
}
