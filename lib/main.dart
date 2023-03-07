import 'package:flutter/material.dart';
import 'package:cron/cron.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:bonnou/controllers/rss_controller.dart';
import 'package:bonnou/database/database_helper.dart';
import 'package:bonnou/routes/routes.dart';
import 'package:bonnou/utils/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final cron = Cron();
  await DatabaseHelper.initDatabase();
  await GetStorage.init();
  DependencyInjection.init();
  final RssController _rssController = Get.put(RssController());
  cron.schedule(Schedule.parse('*/5 * * * *'), () async {
    await _rssController.getAllNews();
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bonnou',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyRoutes.getHomeRoute(),
      getPages: MyRoutes.routes,
    );
  }
}