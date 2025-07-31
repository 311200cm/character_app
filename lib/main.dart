import 'package:flutter/material.dart';
import 'package:omar_ahmed_flutter/App_router.dart';

import 'constants/strings.dart';

void main() {
  runApp( MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  AppRouter appRouter;

  MyApp({super.key,required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     onGenerateRoute: appRouter.generateRoute,
      initialRoute: CharacterScreenRoute,
      /*
      * انا هنا مش بنادى الداله انا بعرف material انى عملت داله اسمها generateRoute
      * استخدمها لما تحتاجها يعنى هو اللى هيناديها
      * طب هيناديها امتى؟ لما اكتب navgator .push واديله اسم من اسامى route
      * اللى عندى فهيروح material ينادى الداله دى فى الخلفيه ويبعتلها اسم route
      * اللى كتبه فى navigator ويروح للداله يعمل switch عليه
      * // أنت بتربط الدالة
      MaterialApp(
  onGenerateRoute: AppRouter().generateRoute,
    );
// لما تستخدم:
   Navigator.pushNamed(context, '/characters');
   // Flutter داخليًا:
    // AppRouter().generateRoute(RouteSettings(name: '/characters'));
      * */
    );
  }
}

