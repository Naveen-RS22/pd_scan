class Endpoints {
  static const String dev = 'gateway01.ithred.info';
  static const String uat = 'gateway01.ithred.in';
  static const String prod = 'gateway01.ithred.io';
  static const String qa = 'gateway01.ithred.net';

  static const String g3dev = 'gateway03.ithred.info';
  static const String g3uat = 'gateway03.ithred.in';
  static const String g3prod = 'gateway03.ithred.io';
  static const String g3qa = 'gateway03.ithred.net';

  static const String g3cdev = 'gateway03c.ithred.info';
  static const String g3cuat = 'gateway03c.ithred.in';
  static const String g3cprod = 'gateway03c.ithred.io';
  static const String g3cqa = 'gateway03c.ithred.net';

  static const String base = qa;

  static const String appCode = 'ENAPP004';
  static const String appCode3 = 'ENAPP003';

  static const String get = '/api/Apps/Get';
  static const String post = '/api/Apps/Post';
  static const String put = '/api/Apps/Put';

  //Login
  static const String login = '/api/Platform/Login';
  static const String forgotPassword = 'Platform/ForgotPassword';
  static const String changePassword = 'Platform/ChangePassword';
  static const String userApp = 'Platform/UserApps';

  static const String GetScoreCardAuditInfonew1 =
      'Scorecard/GetScoreCardAuditInfonew1';

//config
  static const String GetAllSewingLine = 'SewLineMaster/GetAllSewingLine';
  static const String GetAllSession = 'SessionMaster/GetAllSessionMasterNEW';
  static const String GetAllGarPart = 'GarPartsMaster/GetAllGarPartData';
  static const String GetAllGarOperation =
      'GarOperMaster/GetAllGarOperationMaster';
  static const String GetAllDefect = 'DefectMaster/GetAllDefectMaster';

  // static const String GetAuditStyle = 'AuditSchedule/GetAuditStyleData';
  static const String GetAuditInfonew = 'Scorecard/GetScoreCardAuditInfonew1';

  static const String postSaveLineQC = 'LineQc/SaveLineQC';

}
