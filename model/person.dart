part of ex6;

class Person {
  // Person properties:
  String _nom, _email, _phone;
  DateTime now;

  String get nom => _nom;
  set nom (value) {
    if (value != null && !value.isEmpty) _nom = value;
  }

  String get email => _email;
  set email(value) {
    if (value != null && !value.isEmpty) _email = value;
  }

  String get phone => _phone;
  set phone(value) {
    if (value != null && !value.isEmpty) _nom = value;
  }

  // constructors:
  Person(nom, email, phone) {
    this.nom = nom;
    this.email = email;
    this.phone = phone;
      }

  Person.fromJson(Map json) {
    this.nom = json["name"];
  
    this.email = json["email"];
    this.phone = json["phone"];
    
   }

   // methods:
  String toString() => 'Person: $nom, $phone';

  Map<String, Object> toJson() {
    Map<String, Object> per = new Map<String, Object>();
    per["nom"] = nom;
    per["email"] = email;
    per["phone"] = phone;
        return per;
  }
}

