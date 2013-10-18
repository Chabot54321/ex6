library ex6;

import 'dart:html';

import 'package:ex6/ex6.dart';
part '../model/fiche.dart';
part '../model/person.dart';

InputElement nom, email, phone;

ButtonElement bouton_add, bouton_save;
InputElement rd;
LabelElement label1;

ContactModel xx = new ContactModel();
Contacts contacts = xx.contacts;
String ligne;
List<Contacts> liste_de_contact = new List(); 
int cntIndex=3;

display(){
  String list='Liste de contacts:';
  

  for (var contact in contacts){ 
    var YYY = '''

    <tr>
    <td class="auto-style2"> ${contact.nom} </td>
    <td class="auto-style2"> ${contact.email}</td>
    <td class="auto-style2"> ${contact.phone}</td>
    <td>
    <button type="button" id="button${contact.code}" class="btns">Modifier</button>
    <button type="button" id="supp${contact.code}" class="btns">Supprimer</button>
    </td>
    </tr>
    ''';
    list = '$list ${YYY}';
  }

  document.query('#table').setInnerHtml(
      list,
      validator: new NodeValidatorBuilder()
      ..allowHtml5()

  );
}


void main() {
  
  // afficher les trois premiers contacts que nous avons déjà créés
  
  xx.init();
  display(); 
  bind_elements();
  attach_event_handlers();
}
 
bind_elements() {
  var i =1;
  nom = query('#name');
  email = query('#email');
  phone = query('#phone');
  bouton_add = query('#bouton_add');
  bouton_save = query('#bouton_save');
  
  
  //Bouton modifier, pour contact existent
  for (var contact in contacts){
    ButtonElement bt1 = query('#button${contact.code}');
    bt1.onClick.listen((e){
    ligne = bt1.id;
    nom.value = contact.nom;
    email.value = contact.email;
    phone.value = contact.phone;    
    });
  
  }
  
   //Pour supprimer un contact de la liste
   for (var contact in contacts){
      ButtonElement bt2 = query('#supp${contact.code}');
      bt2.onClick.listen((e){
        
      contacts.remove(contact);
      display(); 
      bind_elements();
    });

   }
   
  //pour sauvegarder les modifications des contacts
  bouton_save.onClick.listen((e){
  contacts.find(ligne.substring(6,7)).nom=nom.value;
  contacts.find(ligne.substring(6,7)).email=email.value;
  contacts.find(ligne.substring(6,7)).phone=phone.value;
  print(ligne.substring(6,7));
  display();
  bind_elements();
  attach_event_handlers();
  });

  }

attach_event_handlers() {

  bouton_add.onClick.listen(Add_contact);

}

notEmpty(Event e) {
  InputElement inel = e.currentTarget as InputElement;
  var input = inel.value;
  if (input == null || input.isEmpty) {
    window.alert("You must fill in the field ${inel.id}!"); 
   inel.focus();
  }
} 

Add_contact (Event e){
  cntIndex++;
  var added = new Contact();
  added.code = cntIndex.toString();
  added.nom = nom.value.toString();
  added.email =email.value.toString();  
  added.phone = phone.value.toString();
  contacts.add(added);
  display();
  bind_elements();
  attach_event_handlers();
}



  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  // Spiral 1
  
//  // bind variables to DOM elements:
//  nom = query('#nom');
//  email = query('#email');
//  phone = query('#phone');
//  bouton_add = query('#btn_create');
//  bouton_add.onClick.listen(storeData);
//}
//
//notEmpty(Event e) {
//  InputElement inel = e.currentTarget as InputElement;
//  var input = inel.value;
//  if (input == null || input.isEmpty) {
//    window.alert("You must fill in the field ${inel.id}!");
//   inel.focus();
//  }
//}
//
//
//
//storeData(Event e) {
//  // creating the objects:
//  Person p = new Person(nom.value, phone.value, email.value);
//  fiche bac = new fiche(p,nom.value);
//  // store data in local storage:
//  try {
//    window.localStorage["fiche:${bac.contact.nom}"] = bac.toJson();
//    window.alert("Bank account data stored in the browser.");
//  } on Exception catch (ex) {
//    window.alert("Data not stored: Local storage has been deactivated!");
//  }
//}