import 'package:weathernaut/import.dart';
import 'package:weathernaut/src/core/router/app_router.dart';
import 'package:weathernaut/src/features/app/app.dart';

void main() async {
  final router = AppRouter();
  runApp(App(router: router));
}
