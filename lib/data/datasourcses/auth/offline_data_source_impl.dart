import 'package:injectable/injectable.dart';

import '../../contracts/auth/offline_data_source.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {}
