import 'package:get_it/get_it.dart';

import 'local_data.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  var prefInstance = await PrefService.getInstance();
  locator.registerSingleton<PrefService>(prefInstance);
}
