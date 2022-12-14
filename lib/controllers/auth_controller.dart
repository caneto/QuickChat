import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_application/consts/consts.dart';
import 'package:demo_application/views/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //Text Controllers
  var usernameController = TextEditingController();
  var phoneController = TextEditingController();
  var otpController = List.generate(6, (index) => TextEditingController());

  //Variaveis
  var isOptSent = false.obs;
  var formKey = GlobalKey<FormState>();

  //auth variaveis
  late final PhoneVerificationCompleted phoneVerificationCompleted;
  late final PhoneVerificationFailed phoneVerificationFailed;
  late PhoneCodeSent phoneCodeSent;
  String verificationID = "";

  //sendOtp method
  sendOpt() async {
    print("+55");
    print(phoneController.text);

    phoneVerificationCompleted = (PhoneAuthCredential credential) async {
      await auth.signInWithCredential(credential);
    };
    phoneVerificationFailed = (FirebaseAuthException e) {
      if (e.code == 'invalid-phone-number') {
        print('The provided phone number is not valid.');
      }
    };
    phoneCodeSent = (String verificationId, int? resendToken) {
      verificationID = verificationId;
    };
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+55${phoneController.text}",
        verificationCompleted: phoneVerificationCompleted,
        verificationFailed: phoneVerificationFailed,
        codeSent: phoneCodeSent,
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      print(e.toString());
    }
  }

  //verify otp
  verifyOtp(context) async {
    String otp = '';
    //getting all textfields data
    for (var i = 0; i < otpController.length; i++) {
      otp += otpController[i].text;
    }

    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationID,
        smsCode: otp,
      );

      //getting user
      final User? user = (await auth.signInWithCredential(phoneAuthCredential)).user;

      if(user!=null) {
        //store user info database
        DocumentReference store = FirebaseFirestore.instance.collection(collectionUser).doc(user.uid);
        await store.set({
          'id':user.uid,
          'name': usernameController.text.toString(),
          'phone': phoneController.text.toString(),
        }, SetOptions(merge: true));

        VxToast.show(context, msg: loggedin);
        Get.offAll(() => HomeScreen(), transition: Transition.downToUp);
      }

    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
