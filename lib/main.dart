import 'package:ClubHouseClone/app/global.dart';
import 'package:ClubHouseClone/app/locator.dart';
import 'package:ClubHouseClone/app/navigation_service.dart';
import 'package:ClubHouseClone/app/route_names.dart';
import 'package:ClubHouseClone/screen/home_view.dart';
import 'package:flutter/cupertino.dart';


void main() {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  Global.init().then((e) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            color: CupertinoColors.black,
            fontFamily: 'Nunito',
          ),
        ),
      ),
      home: HomeView(),
      onGenerateRoute: generateRoute,
    );
  }
}
