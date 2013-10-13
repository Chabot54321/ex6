library ex6;

import 'dart:html';
import 'dart:convert';

part '../model/fiche.dart';
part '../model/person.dart';

InputElement nom, email, phone;

ButtonElement btn_create;

void main() {
  // bind variables to DOM elements:
  nom = query('#nom');
  email = query('#email');
  phone = query('#phone');
  
  btn_create = query('#btn_create');

    
  btn_create.onClick.listen(storeData);
}

notEmpty(Event e) {
  InputElement inel = e.currentTarget as InputElement;
  var input = inel.value;
  if (input == null || input.isEmpty) {
    window.alert("You must fill in the field ${inel.id}!");
   inel.focus();
  }
}



storeData(Event e) {
  // creating the objects:
  Person p = new Person(nom.value, phone.value, email.value);
  fiche bac = new fiche(p,nom.value);
  // store data in local storage:
  try {
    window.localStorage["fiche:${bac.contact.nom}"] = bac.toJson();
    window.alert("Bank account data stored in the browser.");
  } on Exception catch (ex) {
    window.alert("Data not stored: Local storage has been deactivated!");
  }
}