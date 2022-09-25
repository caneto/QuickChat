import 'package:demo_application/consts/consts.dart';
import 'package:demo_application/views/home_screen/home.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final scaffolkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: drawer(),
          key: scaffolkey,
          floatingActionButton: FloatingActionButton(
            backgroundColor: btnColor,
            onPressed: () {},
            child: Icon(Icons.edit),
          ),
          backgroundColor: bgColor,
          body: Column(children: [
            appbar(scaffolkey),
            Expanded(
              child: Row(
                children: [
                  tabbar(),
                  tabbarView()
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
