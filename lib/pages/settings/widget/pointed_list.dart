import 'package:flutter/material.dart';
import 'package:football_next_gen/pages/settings/widget/pointed_element.dart';

class PointedList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: PointedElement(text: 'Lunghezza minima di almeno 8 caratteri'),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10),
          child: PointedElement(text: 'Deve contenere almeno una lettera maiuscola e una lettera minuscola'),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10),
          child: PointedElement(text: 'Deve includere almeno un numero'),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10),
          child: PointedElement(text: 'Può contenere caratteri speciali come ! @ # \$ %'),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10),
          child: PointedElement(text: 'Evita l\'uso di informazioni personali, come il nome utente o la data di nascita'),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10),
          child: PointedElement(text: 'Evita sequenze di caratteri comuni o facilmente indovinabili'),
        ),

        Padding(
          padding: EdgeInsets.only(top: 10),
          child: PointedElement(text: 'La password deve essere unica e non deve essere stata utilizzata in precedenza'),
        ),
      ],
    );
  }

}