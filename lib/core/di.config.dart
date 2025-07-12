// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api/api_client.dart' as _i217;
import '../data/api/data_source_contract/forget_password_data_source.dart'
    as _i905;
import '../data/api/data_source_contract/get_all_subjects_data_source.dart'
    as _i628;
import '../data/api/data_source_contract/get_exams_data_source.dart' as _i594;
import '../data/api/data_source_contract/log_in_data_source.dart' as _i344;
import '../data/api/data_source_contract/reset_password_data_source.dart'
    as _i755;
import '../data/api/data_source_contract/verification_data_source.dart'
    as _i578;
import '../data/data_source_impl/forget_password_data_source_impl.dart'
    as _i330;
import '../data/data_source_impl/get_all_subjects_data_source_impl.dart'
    as _i689;
import '../data/data_source_impl/get_exams_data_source_impl.dart' as _i401;
import '../data/data_source_impl/log_in_data_source_impl.dart' as _i512;
import '../data/data_source_impl/reset_password_data_source_impl.dart' as _i824;
import '../data/data_source_impl/verification_data_source_impl.dart' as _i446;
import '../data/repository_impl/forget_password_repository_impl.dart' as _i469;
import '../data/repository_impl/get_all_subjects_repository_impl.dart' as _i465;
import '../data/repository_impl/get_exams_repository_impl.dart' as _i618;
import '../data/repository_impl/log_in_repository_impl.dart' as _i42;
import '../data/repository_impl/reset_password_repository_impl.dart' as _i202;
import '../data/repository_impl/verification_repository_impl.dart' as _i705;
import '../domain/repository_contract/forget_password_repository.dart' as _i913;
import '../domain/repository_contract/get_all_subjects_repository.dart'
    as _i651;
import '../domain/repository_contract/get_exams_repository.dart' as _i231;
import '../domain/repository_contract/log_in_repository.dart' as _i987;
import '../domain/repository_contract/reset_password_repository.dart' as _i871;
import '../domain/repository_contract/verification_repository.dart' as _i31;
import '../domain/usecases/forget_password_usecase.dart' as _i392;
import '../domain/usecases/get_all_subjects_usecase.dart' as _i830;
import '../domain/usecases/get_exams_usecase.dart' as _i105;
import '../domain/usecases/log_in_usecase.dart' as _i588;
import '../domain/usecases/reset_password_usecase.dart' as _i544;
import '../domain/usecases/verification_usecase.dart' as _i1000;
import '../presentation/viewmodel/cubits/forget_password_cubit.dart' as _i954;
import '../presentation/viewmodel/cubits/get_all_subjects_cubit.dart' as _i734;
import '../presentation/viewmodel/cubits/get_exams_cubit.dart' as _i889;
import '../presentation/viewmodel/cubits/log_in_cubit.dart' as _i841;
import '../presentation/viewmodel/cubits/reset_password_cubit.dart' as _i309;
import 'dio_servies.dart' as _i927;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i361.Dio>(
      () => registerModule.provideDio(),
      preResolve: true,
    );
    gh.factory<_i217.ApiClient>(() => _i217.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i578.VerificationDataSource>(
        () => _i446.VreificationDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i31.VerificationRepository>(() =>
        _i705.VreificationRepositoryImpl(gh<_i578.VerificationDataSource>()));
    gh.factory<_i1000.GetVerificationUsecase>(
        () => _i1000.GetVerificationUsecase(gh<_i31.VerificationRepository>()));
    gh.factory<_i755.ResetPasswordDataSource>(
        () => _i824.ResetPasswordDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i871.ResetPasswordRepository>(() =>
        _i202.ResetPasswordRepositoryImpl(gh<_i755.ResetPasswordDataSource>()));
    gh.factory<_i905.ForgetPasswordDataSource>(
        () => _i330.ForgetPasswordDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i628.GetAllSubjectsDataSource>(
        () => _i689.GetAllSubjectsDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i651.GetAllSubjectsRepository>(() =>
        _i465.GetAllSubjectsRepositoryImpl(
            gh<_i628.GetAllSubjectsDataSource>()));
    gh.factory<_i594.GetExamsDataSource>(
        () => _i401.GetExamsDataSourceImpl(gh<_i217.ApiClient>()));
    gh.factory<_i344.LogInDataSource>(
        () => _i512.LogInDataSourceImpl(apiClient: gh<_i217.ApiClient>()));
    gh.factory<_i231.GetExamsRepository>(
        () => _i618.GetExamsRepositoryImpl(gh<_i594.GetExamsDataSource>()));
    gh.factory<_i544.GetResetPasswordUsecase>(() =>
        _i544.GetResetPasswordUsecase(gh<_i871.ResetPasswordRepository>()));
    gh.factory<_i105.GetExamsUsecase>(
        () => _i105.GetExamsUsecase(gh<_i231.GetExamsRepository>()));
    gh.factory<_i987.LogInRepository>(
        () => _i42.LogInRepositoryImpl(gh<_i344.LogInDataSource>()));
    gh.factory<_i309.ResetPasswordCubit>(
        () => _i309.ResetPasswordCubit(gh<_i544.GetResetPasswordUsecase>()));
    gh.factory<_i588.GetLogInUsecase>(
        () => _i588.GetLogInUsecase(gh<_i987.LogInRepository>()));
    gh.factory<_i841.LogInCubit>(
        () => _i841.LogInCubit(gh<_i588.GetLogInUsecase>()));
    gh.factory<_i913.ForgetPasswordRepository>(() =>
        _i469.ForgetPasswordRepositoryImpl(
            gh<_i905.ForgetPasswordDataSource>()));
    gh.factory<_i830.GetAllSubjectsUsecase>(() =>
        _i830.GetAllSubjectsUsecase(gh<_i651.GetAllSubjectsRepository>()));
    gh.factory<_i889.GetExamsCubit>(
        () => _i889.GetExamsCubit(gh<_i105.GetExamsUsecase>()));
    gh.factory<_i392.GetForgetPasswordUsecase>(() =>
        _i392.GetForgetPasswordUsecase(gh<_i913.ForgetPasswordRepository>()));
    gh.factory<_i954.ForgetPasswordCubit>(() => _i954.ForgetPasswordCubit(
          gh<_i392.GetForgetPasswordUsecase>(),
          gh<_i1000.GetVerificationUsecase>(),
        ));
    gh.factory<_i734.GetAllSubjectsCubit>(
        () => _i734.GetAllSubjectsCubit(gh<_i830.GetAllSubjectsUsecase>()));
    return this;
  }
}

class _$RegisterModule extends _i927.RegisterModule {}
