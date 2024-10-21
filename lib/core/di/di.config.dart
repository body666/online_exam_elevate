// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/contracts/auth/offline_data_source.dart' as _i886;
import '../../data/contracts/auth/online_data_source.dart' as _i976;
import '../../data/datasourcses/auth/offline_data_source_impl.dart' as _i698;
import '../../data/datasourcses/auth/online_data_source_impl.dart' as _i341;
import '../../data/repos/auth/auth_repo_impl.dart' as _i291;
import '../../domain/repos/auth/auth_repo.dart' as _i876;
import '../../domain/usecases/auth/forget_password_usecase.dart' as _i612;
import '../../domain/usecases/auth/login_usecase.dart' as _i461;
import '../../domain/usecases/auth/register_usecase.dart' as _i659;
import '../../domain/usecases/auth/reset_password_usecase.dart' as _i658;
import '../../domain/usecases/auth/verify_reset_code_usecase.dart' as _i938;
import '../../presentation/auth/view_model/forget_pass/forget_pass_view_model.dart'
    as _i186;
import '../../presentation/auth/view_model/reset_pass/reset_pass_view_model.dart'
    as _i897;
import '../../presentation/auth/view_model/verify_code/verify_code_view_model.dart'
    as _i909;
import '../utils/services/api/api_manager.dart' as _i74;
import '../utils/services/cache_service.dart' as _i743;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i74.ApiManager>(() => _i74.ApiManager());
    gh.singleton<_i743.CacheService>(() => _i743.CacheService());
    gh.factory<_i886.AuthOfflineDataSource>(
        () => _i698.AuthOfflineDataSourceImpl());
    gh.factory<_i976.AuthOnlineDataSource>(
        () => _i341.AuthOnlineDataSourceImpl(gh<_i74.ApiManager>()));
    gh.factory<_i876.AuthRepo>(() => _i291.AuthRepoImpl(
          onlineDataSource: gh<_i976.AuthOnlineDataSource>(),
          offlineDataSource: gh<_i886.AuthOfflineDataSource>(),
        ));
    gh.factory<_i612.ForgetPasswordUseCase>(
        () => _i612.ForgetPasswordUseCase(gh<_i876.AuthRepo>()));
    gh.factory<_i461.LoginUseCase>(
        () => _i461.LoginUseCase(gh<_i876.AuthRepo>()));
    gh.factory<_i659.RegisterUseCase>(
        () => _i659.RegisterUseCase(gh<_i876.AuthRepo>()));
    gh.factory<_i658.ResetPasswordUseCase>(
        () => _i658.ResetPasswordUseCase(gh<_i876.AuthRepo>()));
    gh.factory<_i938.VerifyResetCodeUseCase>(
        () => _i938.VerifyResetCodeUseCase(gh<_i876.AuthRepo>()));
    gh.factory<_i186.ForgetPassViewModel>(
        () => _i186.ForgetPassViewModel(gh<_i612.ForgetPasswordUseCase>()));
    gh.factory<_i909.VerifyCodeViewModel>(() => _i909.VerifyCodeViewModel(
          gh<_i938.VerifyResetCodeUseCase>(),
          gh<_i612.ForgetPasswordUseCase>(),
        ));
    gh.factory<_i897.ResetPassViewModel>(
        () => _i897.ResetPassViewModel(gh<_i658.ResetPasswordUseCase>()));
    return this;
  }
}
