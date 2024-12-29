
import 'endpoints.dart';

class QConstants {
  static const String token = 'token';
  static const String username = 'username';
  static const String lan = 'lan';
  static const String entityCode = 'entityCode';
  static const String unitCode = 'unitcode';
  static const String appCode = 'QAM';
  static const String cnfCode = 'cnfCode';
  static const String matStock = 'matStock';
  static const String masterSync = 'matStock';
  static const String styleSync = 'matSwtock';
  static const String lineQcSync = 'matStock';
  static const int splashDuration = 3;
  static const String appVersionDEV = 'v-0.1';
  static const String appVersionQA = 'v0.4.4-0+1';
  static const String appVersionUAT = 'v0.4.2-0+2';
  static const String appVersionPROD = 'v0.11.0-0+3';
  static const String appVersion = (Endpoints.base == Endpoints.qa)
      ? QConstants.appVersionQA
      : (Endpoints.base == Endpoints.prod)
      ? appVersionPROD
      : (Endpoints.base == Endpoints.dev)
      ? appVersionDEV
      : (Endpoints.base == Endpoints.uat)
      ? appVersionUAT
      : "Unknown Environment";
}
