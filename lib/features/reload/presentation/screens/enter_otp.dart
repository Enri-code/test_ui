import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:test_ui/features/reload/presentation/screens/reload.dart';
import 'package:test_ui/global/presentation/theme/text_styles.dart';

class OtpScreen extends StatefulWidget {
  static const route = '/otp_screen';
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() async {
    SmsAutoFill().listenForCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var email = 'example@email.com';
    return Scaffold(
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            const Text('Enter OTP', style: TextStyles.header1),
            RichText(
              text: TextSpan(
                text: 'We have just sent you 4 digit code via your email ',
                style: TextStyles.body2.copyWith(color: Colors.grey),
                children: [
                  TextSpan(
                    text: email,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            PinFieldAutoFill(
              autoFocus: true,
              decoration: const BoxLooseDecoration(
                gapSpace: 8,
                strokeWidth: 0,
                strokeColorBuilder: FixedColorBuilder(Color(0xffECF1F6)),
                bgColorBuilder: FixedColorBuilder(Color(0xffECF1F6)),
              ),
              onCodeSubmitted: (code) {
                Navigator.of(context).popAndPushNamed(ReloadScreen.route);
              },
            ),
            const Expanded(child: SizedBox()),
            RichText(
              text: TextSpan(
                text: "Didn't receive the code? ",
                style: TextStyles.body2.copyWith(color: Colors.grey),
                children: [
                  TextSpan(
                    text: 'Resend code',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
