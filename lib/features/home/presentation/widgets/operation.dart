import 'package:flutter/material.dart';
import 'package:test_ui/global/presentation/theme/text_styles.dart';

class OperationWidget extends StatelessWidget {
  const OperationWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.imageName,
    required this.onPressed,
  }) : super(key: key);

  final String title, subTitle, imageName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image(
                image: AssetImage('assets/images/$imageName.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                title,
                style: TextStyles.body1.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              subTitle,
              style: TextStyles.body3.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
