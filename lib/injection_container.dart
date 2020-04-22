import 'dart:io';

import 'package:get_it/get_it.dart';

import 'bloc/main_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(() => MainBloc());

}