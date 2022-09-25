import 'package:demo_application/consts/consts.dart';

Widget appbar(GlobalKey<ScaffoldState> key) {
  return Container(
    padding: const EdgeInsets.only(right: 12),
    height: 80,
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            key.currentState!.openDrawer();
          },
          child: Container(
            decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            height: 80,
            width: 90,
            child: const Icon(
              settingsIcon,
              color: Colors.white,
            ),
          ),
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "$appname\n",
                style: TextStyle(
                  fontFamily: bold,
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: "                  $connectingLives",
                style: TextStyle(
                    fontFamily: "lato",
                    fontSize: 14,
                    color: Vx.gray600,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: btnColor,
          radius: 25,
          child: Image.asset(
            ic_user,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
