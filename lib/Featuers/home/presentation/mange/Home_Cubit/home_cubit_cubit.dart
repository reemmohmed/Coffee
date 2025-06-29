import 'package:bloc/bloc.dart';
import 'package:coffee_app/Featuers/home/data/product_model.dart';
import 'package:coffee_app/core/servers/api_servers.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'home_cubit_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());
  final ApiServers _apiServers = ApiServers();
  List<ProductModel> products = [];
  // get data
  Future<void> getData() async {
    emit(HomeCubitLoading());
    try {
      final response = await _apiServers.getdata("product?select=*&limit=10");

      final List<dynamic> data = response.data;

      products = data.map((item) => ProductModel.fromJson(item)).toList();
      emit(HomeCubitSuccess());
    } catch (e) {
      // If an error occurs, emit error state
      emit(HomeCubitError());
    }
  }

  // get data for search
}
