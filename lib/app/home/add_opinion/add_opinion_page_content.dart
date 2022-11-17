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
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('restaurants').add({
                'name': restaurantname,
                'burger': burgername,
                'rating': 3.0
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
