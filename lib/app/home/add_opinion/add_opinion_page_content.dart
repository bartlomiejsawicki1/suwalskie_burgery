import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantname = '';
  var burgername = '';
  var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę restauracji',
            ),
            onChanged: (newValule) {
              setState(() {
                restaurantname = newValule;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Podaj nazwę burgera',
            ),
            onChanged: (newValule) {
              setState(() {
                burgername = newValule;
              });
            },
          ),
          Slider(
            value: rating,
            onChanged: (newvalue) {
              setState(() {
                rating = newvalue;
              });
            },
            min: 1.0,
            max: 6.0,
            divisions: 10,
            label: rating.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('restaurants').add({
                'name': restaurantname,
                'burger': burgername,
                'rating': rating,
              });
            },
            child: const Text(
              'Dodaj ',
            ),
          ),
        ],
      ),
    );
  }
}
