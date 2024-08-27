import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:project_assessment/data/data_sources/remote/grocery_remote_data_source.dart';
import 'package:project_assessment/data/data_sources/remote/grocery_remote_data_source_implementation.dart';
import 'package:project_assessment/domain/repository/grocery_repository.dart';
import 'package:project_assessment/data/repository/grocery_repository_implementation.dart';
import 'package:project_assessment/domain/usecase/get_groceries_usecase.dart';
import 'package:project_assessment/domain/usecase/get_grocery_by_id_usecase.dart';
import 'package:project_assessment/presentation/bloc/grocery_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton<GroceryRemoteDataSource>(()=> GroceryRemoteDataSourceImplementation(client: getIt(), 
    baseUrl: 'https://g5-flutter-learning-path-be.onrender.com/api/v1/groceries'));


  getIt.registerLazySingleton<GroceryRepository>(()=> GroceryRepositoryImpl(
    remoteDataSource: getIt()));

  getIt.registerLazySingleton<GetGroceriesUseCase>(() => GetGroceriesUseCase(getIt()));
  getIt.registerLazySingleton<GetGroceryByIdUseCase>(() => GetGroceryByIdUseCase(getIt()));
  

  getIt.registerFactory(() => GroceryBloc(getIt()));
}
