import 'package:demo_application/consts/consts.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Icon(
            Icons.more_vert_rounded,
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                      child: RichText(
                    text: const TextSpan(children: [
                      TextSpan(
                        text: "Username\n",
                        style: TextStyle(
                          fontFamily: semibold,
                          fontSize: 16,
                          color: txtColor,
                        ),
                      ),
                      TextSpan(
                        text: "Last seen",
                        style: TextStyle(
                          fontFamily: semibold,
                          fontSize: 16,
                          color: greyColor,
                        ),
                      ),
                    ]),
                  )),
                  const CircleAvatar(
                    backgroundColor: btnColor,
                    child: Icon(
                      Icons.video_call_rounded,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                  10.widthBox,
                  const CircleAvatar(
                    backgroundColor: btnColor,
                    child: Icon(
                      Icons.call,
                      size: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            30.heightBox,
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Directionality(
                    textDirection:
                        index.isEven ? TextDirection.rtl : TextDirection.ltr,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: index.isEven ? bgColor : btnColor,
                            child: Image.asset(
                              ic_user,
                              color: Colors.white,
                            ),
                          ),
                          20.widthBox,
                          Expanded(
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: index.isEven ? bgColor : btnColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: "Hello, this is a dummy message here.."
                                    .text
                                    .fontFamily(semibold)
                                    .white
                                    .make(),
                              ),
                            ),
                          ),
                          10.widthBox,
                          Directionality(
                              textDirection: TextDirection.ltr,
                              child: "11:00 AM"
                                  .text
                                  .color(greyColor)
                                  .size(12)
                                  .make()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            10.heightBox,
            SizedBox(
              height: 56,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFormField(
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        cursorColor: Colors.white,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.emoji_emotions_rounded,
                            color: greyColor,
                          ),
                          suffixIcon: Icon(
                            Icons.attachment_rounded,
                            color: greyColor,
                          ),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12,
                            fontFamily: semibold,
                            color: Colors.white,
                          ),
                          hintText: "Type your message...",
                        ),
                      ),
                    ),
                  ),
                  20.widthBox,
                  const CircleAvatar(
                    backgroundColor: btnColor,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
