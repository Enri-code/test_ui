import 'package:flutter/material.dart';
import 'package:test_ui/features/card/domain/entities/card.dart';
import 'package:test_ui/features/card/presentation/paints/card_paint.dart';
import 'package:test_ui/global/presentation/theme/text_styles.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  final CardData data;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CardPainter(data.color),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: DefaultTextStyle(
            style: TextStyles.body3.copyWith(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image(image: data.provider),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Balance', style: TextStyles.body2),
                    Text(
                      data.balance,
                      style: TextStyles.subHeader1
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('**** ' + data.last4Digits, style: TextStyles.body1),
                    Text(
                      data.expirationDate,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
