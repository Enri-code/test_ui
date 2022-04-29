import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_ui/features/card/domain/entities/card.dart';
import 'package:test_ui/features/card/presentation/widgets/card.dart';

class CardPageView extends StatelessWidget {
  CardPageView({Key? key, required this.cards}) : super(key: key);

  final List<CardData> cards;
  final controller = PageController(viewportFraction: 0.5);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: controller,
            clipBehavior: Clip.none,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((_, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: AnimatedBuilder(
                  animation: controller,
                  builder: (_, child) {
                    var animVal = (i - controller.page!).abs().clamp(0.0, 1.0);
                    return Transform.scale(
                      scale: 1.1 - animVal * 0.1,
                      child: child!,
                    );
                  },
                  child: CardWidget(data: cards[i]),
                ),
              );
            }),
          ),
        ),
        if (cards.length > 1)
          SmoothPageIndicator(
            controller: controller,
            count: 6,
            effect: const ExpandingDotsEffect(),
            onDotClicked: (index) {
              controller.animateToPage(index,
                  duration: kTabScrollDuration, curve: Curves.easeOut);
            },
          )
        else
          const SizedBox(height: 32),
      ],
    );
  }
}
