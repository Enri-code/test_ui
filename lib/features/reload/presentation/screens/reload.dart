import 'package:flutter/material.dart';
import 'package:test_ui/global/presentation/theme/text_styles.dart';

class ReloadScreen extends StatelessWidget {
  static const route = '/reload_screen';
  const ReloadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, border: Border()),
                  child: InkResponse(
                    child: const Center(child: Icon(Icons.arrow_back_ios)),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                ),
                Text('Reload',
                    style: TextStyles.subHeader2
                        .copyWith(fontWeight: FontWeight.bold)),
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, border: Border()),
                  child: const Center(child: Icon(Icons.more_horiz)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: SizedBox.square(
                dimension: 64,
                child: FittedBox(
                    child: Image(image: AssetImage('assets/images/'))),
              ),
            ),
            const SizedBox(height: 37),
          ],
        ),
      ),
    );
  }
}
