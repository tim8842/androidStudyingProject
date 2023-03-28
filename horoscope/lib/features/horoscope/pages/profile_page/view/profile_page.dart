import 'package:flutter/material.dart';
import 'package:horoscope/features/horoscope/pages/profile_page/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          stretch: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.asset('assets/jpg/photo.jpg', fit: BoxFit.cover),
          ),
        ),
        SliverToBoxAdapter(
          child: Form(
            child: Container(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 40),
                width: 500,
                color: Colors.white,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SaveExitContainer(),
                      const SizedBox(height: 30),
                      const InputFio(),
                      const SizedBox(height: 30),
                      const GenderRadios(colorTitle: Colors.black),
                      const SizedBox(height: 30),
                      BasicDateField(
                        colorTitle: Colors.black,
                      ),
                      const SizedBox(height: 60),
                      const CcPlaceForm(),
                      const SizedBox(height: 80),
                      const LifeStoryForm(),
                      const SizedBox(height: 40),
                      const ButtonChangePhoto(),
                      const SizedBox(height: 90),
                      const ChangeLogPas()
                    ])),
          ),
        )
      ],
    );
  }
}
