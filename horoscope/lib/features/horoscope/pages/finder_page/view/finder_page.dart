import 'package:flutter/material.dart';
import 'package:horoscope/features/horoscope/pages/finder_page/widgets/widgets.dart';

class FinderPage extends StatelessWidget {
  const FinderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
              color: Colors.indigo[800],
              child: Form(
                  child: Column(children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.white),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.white),
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    alignment: Alignment.topLeft,
                    child: const Text(
                        'Здесь вы можете искать подходящих вам по гороскопу людей, напишите кого вы желаете найти')),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 0, color: Colors.white),
                        color: Colors.white),
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Возраст',
                              style: Theme.of(context).textTheme.titleSmall),
                          const AgeForm(),
                          Text('Пол',
                              style: Theme.of(context).textTheme.titleSmall),
                          const GenderRadios(
                            colorTitle: Colors.black,
                          ),
                          Text('Создвездие',
                              style: Theme.of(context).textTheme.titleSmall),
                          const DropdownButtonConstellation(),
                          Text('Радиус поиска',
                              style: Theme.of(context).textTheme.titleSmall),
                          const ButtonsRadioForm(),
                        ])),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0, color: Colors.white),
                      color: Colors.white),
                  padding: const EdgeInsets.fromLTRB(40, 5, 40, 20),
                  child: const ButtonSearch(),
                )
              ]))),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(color: Colors.white),
        )
      ],
    );
  }
}
