import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:horoscope/features/horoscope/pages/horoscope_page/widgets/widgets.dart';

class HoroscopesPage extends StatelessWidget {
  const HoroscopesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.brown,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/svg/aquarius.svg', height: 20),
                        Text('  Водолей',
                            style: Theme.of(context).textTheme.titleSmall)
                      ],
                    ),
                    const HeaderHoroscope()
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.blue,
                    height: 100,
                    child: Text('Grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ],
        ));
  }
}
