import 'package:flutter/material.dart';
import 'package:test_ui/features/card/domain/entities/card.dart';
import 'package:test_ui/features/home/presentation/widgets/bottom_navigation.dart';
import 'package:test_ui/features/home/presentation/widgets/card_section.dart';
import 'package:test_ui/features/home/presentation/widgets/operation.dart';
import 'package:test_ui/global/presentation/theme/text_styles.dart';

class HomeScreen extends StatelessWidget {
  static const route = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(
                height: 48,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Image(
                        image: AssetImage('assets/images/profile_pic.dart')),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Welcome back',
                            style:
                                TextStyles.subHeader2.copyWith(color: Colors.grey),
                          ),
                          Text(
                            'Carla Calzoni',
                            style:
                                TextStyles.subHeader2.copyWith(color: Colors.grey),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image:
                                  AssetImage('assets/images/profile_pic.dart'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CardPageView(
                cards: [
                  CardData(
                    name: 'X-Card',
                    provider: const AssetImage('assets/images/visa.png'),
                    balance: r'$4,664.63',
                    last4Digits: '2468',
                    expirationDate: '12/24',
                    color: Theme.of(context).primaryColor,
                  ),
                  CardData(
                    name: 'M-Card',
                    provider: const AssetImage('assets/images/visa.png'),
                    balance: r'$2,564.63',
                    last4Digits: '7897',
                    expirationDate: '06/25',
                    color: const Color(0xffFF7438),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 4 / 3,
                children: [
                  OperationWidget(
                    title: 'Send money',
                    subTitle: 'Take acc to acc',
                    imageName: 'send',
                    onPressed: () {},
                  ),
                  OperationWidget(
                    title: 'Pay the bill',
                    subTitle: 'Lorem ipsum',
                    imageName: 'pay_bill',
                    onPressed: () {},
                  ),
                  OperationWidget(
                    title: 'Request',
                    subTitle: 'Lorem ipsum',
                    imageName: 'request',
                    onPressed: () {},
                  ),
                  OperationWidget(
                    title: 'Contact',
                    subTitle: 'Lorem ipsum',
                    imageName: 'contact',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onMiddleButtonPresed: () => showModalBottomSheet(
          context: context,
          builder: (context) => Container(),
        ),
        onNavButtonsPressed: (i) {},
      ),
    );
  }
}
