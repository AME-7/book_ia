import 'package:book_ia/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:book_ia/features/auth/data/data_source/auth_remote_data_source_impl.dart';
import 'package:book_ia/features/auth/data/repo/auth_repo_impl.dart';
import 'package:book_ia/features/auth/domain/repository/auth_repo.dart';
import 'package:book_ia/features/auth/domain/usecases/forget_password_usecases.dart';
import 'package:book_ia/features/auth/domain/usecases/login_usecases.dart';
import 'package:book_ia/features/auth/domain/usecases/new_password_usecases.dart';
import 'package:book_ia/features/auth/domain/usecases/register_usecuses.dart';
import 'package:book_ia/features/auth/domain/usecases/verif_otp_usecases.dart';
import 'package:book_ia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:book_ia/features/home/data/data_source/home_remote_data_source.dart';
import 'package:book_ia/features/home/data/data_source/home_remote_data_source_impl.dart';
import 'package:book_ia/features/home/data/repo/home_repo_impl.dart';
import 'package:book_ia/features/home/domain/repository/home_repo.dart';
import 'package:book_ia/features/home/domain/usecases/get_best_sellers_usecase.dart';
import 'package:book_ia/features/home/domain/usecases/get_sliders_usecase.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setupServiceLocator() {
  // data source
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );

  // repo
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );

  // usecase
  getIt.registerLazySingleton<LoginUsecases>(() => LoginUsecases(getIt()));
  getIt.registerLazySingleton<RegisterUsecuses>(
    () => RegisterUsecuses(getIt()),
  );
  getIt.registerLazySingleton<ForgetPasswordUsecases>(
    () => ForgetPasswordUsecases(getIt()),
  );
  getIt.registerLazySingleton<NewPasswordUsecases>(
    () => NewPasswordUsecases(getIt()),
  );
  getIt.registerLazySingleton<VerifOtpUsecases>(
    () => VerifOtpUsecases(getIt()),
  );
  getIt.registerLazySingleton<GetSlidersUseCase>(
    () => GetSlidersUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetBestSellersUseCase>(
    () => GetBestSellersUseCase(getIt()),
  );

  // cubit
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      loginUseCase: getIt(),
      registerUsecuses: getIt(),
      forgetPasswordUsecases: getIt(),
      verifOtpUsecases: getIt(),
      newPasswordUsecases: getIt(),
    ),
  );
  getIt.registerLazySingleton<GetSlidersUseCase>(
    () => GetSlidersUseCase(getIt()),
  );
  getIt.registerLazySingleton<GetBestSellersUseCase>(
    () => GetBestSellersUseCase(getIt()),
  );
}
