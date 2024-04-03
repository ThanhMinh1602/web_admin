abstract class IHomeRepository {
  Future<double> totalSale();
  Future<int> totalUser();
  Future<int> totalProduct();
  Future<int> totalOrder();
}
