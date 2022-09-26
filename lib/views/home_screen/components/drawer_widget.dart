import 'package:demo_application/consts/consts.dart';
import 'package:demo_application/main.dart';
import 'package:demo_application/views/views.dart';
import 'package:get/get.dart';

Widget drawer() {
  return Drawer(

    backgroundColor: bgColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(right: Radius.circular(25)),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(
              backIcon,
              color: Colors.white,
            ).onTap(() {
              Get.back();
            }),
            title: settings.text.fontFamily(semibold).white.make(),
          ),
          20.heightBox,
          CircleAvatar(
            radius: 45,
            backgroundColor: btnColor,
            child: Image.asset(
              ic_user,
              color: Colors.white,
            ),
          ),
          10.heightBox,
          "Username".text.white.fontFamily(semibold).size(16).make(),
          20.heightBox,
          const Divider(color: btnColor, height: 1),
          10.heightBox,
          ListView(
            shrinkWrap: true,
            children: List.generate(
              drawerIconList.length,
              (index) => ListTile(
                onTap: () {
                  switch (index) {
                    case 0:
                      Get.to(() => const ProfileScreen());
                      break;
                    default:
                  }
                },
                leading: Icon(
                  drawerIconList[index],
                  color: Colors.white,
                ),
                title: "${drawerListTitles[index]}"
                    .text
                    .fontFamily(semibold)
                    .white
                    .make(),
                ),
            ),
          ),
          10.heightBox,
          const Divider(color: btnColor, height: 1),
          10.heightBox,
          ListTile(
            leading: const Icon(
              inviteIcon,
              color: Colors.white,
            ),
            title: invite.text.fontFamily(semibold).white.make(),
          ),
          const Spacer(),
          ListTile(
            onTap: () async {
              await auth.signOut();
              Get.offAll(() => const ChatApp());
            },
            leading: const Icon(
              logoutIcon,
              color: Colors.white,
            ),
            title: logout.text.fontFamily(semibold).white.make(),
          )
        ],
      ),
    ),
  );
}
