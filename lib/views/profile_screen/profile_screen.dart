import 'package:demo_application/consts/consts.dart';
import 'package:demo_application/controllers/profile_controllers.dart';
import 'package:demo_application/services/store_services.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  var controller = Get.put(ProfileControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: profile.text.fontFamily(bold).make(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12.0),
            child: FutureBuilder(
              future: StoreServices.getUser(currentUser!.uid),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasData) {
                  var data = snapshot.data!.docs[0];
                  return Column(
                    children: [
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: btnColor,
                        child: Stack(
                          children: [
                            Image.asset(
                              ic_user,
                              color: Colors.white,
                            ),
                            const Positioned(
                              right: 0,
                              bottom: 20,
                              child: CircleAvatar(
                                backgroundColor: btnColor,
                                child: Icon(
                                  cameraIcon,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      20.heightBox,
                      const Divider(color: btnColor, height: 1,),
                      10.heightBox,
                      ListTile(
                        leading: const Icon(
                          personIcon,
                          color: Colors.white,
                        ),
                        title: TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            isDense: true,
                            label: "Name".text.make(),
                            labelStyle: const TextStyle(fontFamily: semibold, color: Colors.white),
                          ),
                        ),
                        subtitle: namesub.text.fontFamily(semibold).gray400.make(),
                      ),
                      ListTile(
                        leading: const Icon(Icons.info, color: Colors.white,),
                        title: TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            isDense: true,
                            label: "About".text.make(),
                            labelStyle: const TextStyle(fontFamily: semibold, color: Colors.white),
                          ),
                        ),
                      ),
                      ListTile(
                        leading: const Icon(Icons.phone, color: Colors.white,),
                        title: TextFormField(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          readOnly: true,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            isDense: true,
                            label: "Phone".text.make(),
                            labelStyle: const TextStyle(fontFamily: semibold, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  );
                }
              },
            )
          ),
        ],
      ),
    );
  }
}
