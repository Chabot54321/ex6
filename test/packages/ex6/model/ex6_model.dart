part of ex6;


class ContactModel extends ConceptModel {

  static final String contact = 'Contact';

  Map<String, ConceptEntities> newEntries() {
    var contacts = new Contacts();
    var map = new Map<String, ConceptEntities>();
    map[contact] = contacts;
    return map;
  }

  Contacts get contacts => getEntry(contact);

  init() {
    var contact1 = new Contact();
    contact1.nom = 'Joey Jojo';
    contact1.email = 'jojothegreat@gmail.com';
    contact1.phone = '418-911-9111';
   contacts.add(contact1);

    var contact2 = new Contact();
    contact1.nom = 'Bob Parker';
    contact1.email = 'Bobparker@gmail.com';
    contact1.phone = '418-922-9222';
    contacts.add(contact2);

    var contact3 = new Contact();
    contact1.nom = 'Julie Payette';
    contact1.email = 'nasa@gmail.com';
    contact1.phone = '418-933-3333';
    contacts.add(contact3);
  }

  display() {
    print('ex6');
    print('=============');
    contacts.display('Contacts');
    print(
      '============= ============= ============= '
      '============= ============= ============= '
    );
  }

}


