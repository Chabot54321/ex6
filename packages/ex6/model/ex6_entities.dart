part of ex6;

class Contact extends ConceptEntity<Contact> {

  String _nom;
  String email;
  String phone;
  
  
  String get nom => _nom;
  set nom(String nom) {
    _nom = nom;
    if (code == null) {
      code = nom;
    }
  }
   
  
  Contact newEntity() => new Contact();

  Contact copy() {
    var contact = super.copy();
    contact.nom = nom;
    contact.email = email;
    contact.phone = phone;
       return contact;
  }

  String toString() {
    return '  {\n '
           '    ${super.toString()}, \n '
           '    nom: ${nom}, \n '
           '    email: ${email}\n'
           '    phone: ${phone}\n'
           '  }';
  }

  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['nom'] = nom;
    entityMap['email'] = email;
    entityMap['phone'] = phone;
    return entityMap;
  }

  fromJson(Map<String, Object> entityMap) {
    super.fromJson(entityMap);
    nom = entityMap['nom'];
    email = entityMap['email'];
    phone = entityMap['phone'];
  }

 bool get onEmail =>
    email.contains('@') ? true : false;

  int compareTo(Contact other) {
    return nom.compareTo(other.nom);
  }

}

class Contacts extends ConceptEntities<Contact> {

  Contacts newEntities() => new Contacts();
  Contact newEntity() => new Contact();

}
