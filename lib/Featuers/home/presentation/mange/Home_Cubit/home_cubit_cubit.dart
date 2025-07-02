import 'package:bloc/bloc.dart';
import 'package:coffee_app/Featuers/home/data/product_model.dart';
import 'package:coffee_app/core/servers/api_servers.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());

  final ApiServers _apiServers = ApiServers();

  List<ProductModel> allProducts = []; // ← جميع المنتجات من السيرفر
  List<ProductModel> homeProducts = []; // ← أول 5 فقط
  List<ProductModel> searchResults = []; // ← نتائج البحث
  List<String> allCategories = [];

  int searchPage = 1;
  final int itemsPerPage = 10;
  String lastQuery = "";

  // ✅ جلب البيانات
  Future<void> getData() async {
    emit(HomeCubitLoading());
    try {
      final response = await _apiServers.getdata("product?select=*");
      final List<dynamic> data = response.data;
      allProducts = data.map((item) => ProductModel.fromJson(item)).toList();
      homeProducts = allProducts.take(5).toList();

      final Set<String> uniqueCategories = {};
      for (var product in allProducts) {
        uniqueCategories.addAll(product.catogerys ?? []);
      }
      allCategories = uniqueCategories.toList();

      emit(HomeCubitSuccess());
    } catch (e) {
      emit(HomeCubitError());
    }
  }

  // ✅ البحث مع أول 10 نتائج
  void searchProducts(String query) {
    searchPage = 1;
    lastQuery = query;

    final matches = _filter(query);
    searchResults = matches.take(itemsPerPage).toList();

    emit(HomeCubitSuccess());
  }

  // ✅ تحميل المزيد من نتائج البحث
  void loadMoreSearchResults() {
    searchPage++;
    final matches = _filter(lastQuery);
    searchResults = matches.take(searchPage * itemsPerPage).toList();
    emit(HomeCubitSuccess());
  }

  // ✅ فلترة المنتجات حسب التصنيف
  void filterByCategory(String category) {
    searchPage = 1;
    lastQuery = category;

    final matches = allProducts.where((product) {
      return product.catogerys?.contains(category) ?? false;
    }).toList();

    searchResults = matches.take(itemsPerPage).toList();
    emit(HomeCubitSuccess());
  }

  // 🔍 الفلترة العامة
  List<ProductModel> _filter(String query) {
    if (query.isEmpty) return allProducts;
    return allProducts.where((product) {
      final name = product.titele?.toLowerCase() ?? "";
      final categories = product.catogerys ?? [];
      return name.contains(query.toLowerCase()) ||
          categories.any((c) => c.toLowerCase().contains(query.toLowerCase()));
    }).toList();
  }
}

// class HomeCubitCubit extends Cubit<HomeCubitState> {
//   HomeCubitCubit() : super(HomeCubitInitial());

//   final ApiServers _apiServers = ApiServers();

//   // 🟢 المنتجات الأصلية (لـ HomeView)
//   List<ProductModel> products = [];

//   // 🟢 نتائج البحث (لـ SearchView)
//   List<ProductModel> searchResults = [];

//   // 🟢 كل التصنيفات
//   List<String> allCategories = [];

//   // ⛳ get data (يُستخدم في HomeView)
//   Future<void> getData() async {
//     emit(HomeCubitLoading());
//     try {
//       final response = await _apiServers.getdata("product?select=*");
//       final List<dynamic> data = response.data;

//       products = data.map((item) => ProductModel.fromJson(item)).toList();

//       // 🔄 استخراج كل التصنيفات من جميع المنتجات
//       final Set<String> uniqueCategories = {};
//       for (var product in products) {
//         uniqueCategories.addAll(product.catogerys ?? []);
//       }
//       allCategories = uniqueCategories.toList();

//       emit(HomeCubitSuccess());
//     } catch (e) {
//       emit(HomeCubitError());
//     }
//   }

//   // 🔍 البحث في المنتجات (يُستخدم في SearchView فقط)
//   void searchProducts(String query) {
//     if (query.isEmpty) {
//       searchResults = products;
//     } else {
//       searchResults = products.where((product) {
//         final name = product.titele?.toLowerCase() ?? "";
//         final catList = product.catogerys ?? [];
//         final matchCategory = catList.any(
//           (c) => c.toLowerCase().contains(query.toLowerCase()),
//         );
//         return name.contains(query.toLowerCase()) || matchCategory;
//       }).toList();
//     }
//     emit(HomeCubitSuccess());
//   }

//   // 🔄 فلترة حسب كاتيجوري معين
//   void filterByCategory(String category) {
//     searchResults = products.where((product) {
//       final catList = product.catogerys ?? [];
//       return catList.contains(category);
//     }).toList();
//     emit(HomeCubitSuccess());
//   }
// }
