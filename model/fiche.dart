part of ex6;

class fiche {
 
  Person contact;
  final DateTime date_created;
  DateTime date_modified;
    

  // constructors:
  fiche(this.contact, nom):  date_created = new DateTime.now() {
   
    date_modified = date_created;
  }
  fiche.sameOwner(fiche acc): contact = acc.contact, date_created = new DateTime.now();
  fiche.sameOwnerInit(fiche acc): this(acc.contact, "nom");
 
  String toString() => 'La fiche de $contact';

  String toJson() {
    var acc = new Map<String, Object>();
        acc["contact"] = contact.toJson();
    
    acc["creation_date"] = date_created.toString();
    acc["modified_date"] = date_modified.toString();
    var accs = JSON.encode(acc); // use only once for the root object (here a bank account)
    return accs;
  }
}
