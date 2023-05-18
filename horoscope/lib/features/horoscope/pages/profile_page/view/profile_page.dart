import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:horoscope/features/horoscope/pages/profile_page/widgets/widgets.dart';

class ProfilePage extends StatefulWidget {
  final snapshot;
  ProfilePage({super.key, this.snapshot});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool endSet = false;

  void setControllers() async {
    setState(() {
      endSet = false;
    });
    CollectionReference db = FirebaseFirestore.instance.collection('users');
    String email = widget.snapshot.data?.email;
    final docSnap = db.doc(email);
    Map<String, dynamic> data;
    docSnap.get().then((value) => {
          if (value.exists)
            {
              data = value.data() as Map<String, dynamic>,
              _nameController.text = data['name'],
              _genderController.text = data['gender'],
              _surnameController.text = data['surname'],
              _birthdayController.text = data['birthday'],
              _countryController.text = data['country'],
              _cityController.text = data['city'],
              _stateController.text = data['state'],
              _informationController.text = data['information'],
              print(data['name']),
              print(_genderController),
              setState(() {
                endSet = true;
              })
            }
          else
            {
              setState(() {
                endSet = true;
              }),
              updateDatabase()
            }
        });
  }

  final _nameController = TextEditingController();
  final _surnameController = TextEditingController();
  final _genderController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _countryController = TextEditingController(text: "Choose Country");
  final _stateController = TextEditingController(text: "Choose State");
  final _cityController = TextEditingController(text: "Choose City");
  final _informationController = TextEditingController();

  void updateDatabase() async {
    CollectionReference db = FirebaseFirestore.instance.collection('users');
    String email = widget.snapshot.data?.email;
    final docSnap = db.doc(email);
    docSnap
        .set({
          'name': _nameController.text,
          'surname': _surnameController.text,
          'gender': _genderController.text,
          'birthday': _birthdayController.text,
          'country': _countryController.text,
          'state': _stateController.text,
          'city': _cityController.text,
          'information': _informationController.text
        })
        .then((value) => print('added'))
        .catchError((error) => print('Add failed: $error'));
    // if (docSnap == null) {
    //   print('net elementa');
    // }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _surnameController.dispose();
    _genderController.dispose();
    _countryController.dispose();
    _stateController.dispose();
    _cityController.dispose();
    _informationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    setControllers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!endSet)
      return const Center(
        child: CircularProgressIndicator(),
      );
    else
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 300,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background:
                  Image.asset('assets/jpg/photo.jpg', fit: BoxFit.cover),
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
                        SaveExitContainer(
                          saveFunction: updateDatabase,
                        ),
                        const SizedBox(height: 30),
                        InputFio(
                          nameController: _nameController,
                          surnameController: _surnameController,
                        ),
                        const SizedBox(height: 30),
                        GenderRadios(
                          colorTitle: Colors.black,
                          controller: _genderController,
                        ),
                        const SizedBox(height: 30),
                        BasicDateField(
                          colorTitle: Colors.black,
                          controller: _birthdayController,
                        ),
                        const SizedBox(height: 60),
                        CcPlaceForm(
                          controllers: [
                            _countryController,
                            _stateController,
                            _cityController
                          ],
                        ),
                        const SizedBox(height: 80),
                        LifeStoryForm(controller: _informationController),
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
