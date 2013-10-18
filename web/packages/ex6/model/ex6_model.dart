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
    contact1.code ='1';
    contact1.nom = 'Joey Jojo';
    contact1.email = 'jojothegreat@gmail.com';
    contact1.phone = '418-911-9111';
   contacts.add(contact1);

    var contact2 = new Contact();
    contact2.code ='2';
    contact2.nom = 'Bob Parker';
    contact2.email = 'Bobparker@gmail.com';
    contact2.phone = '418-922-9222';
    contacts.add(contact2);

    var contact3 = new Contact();
    contact3.code ='3';
    contact3.nom = 'Julie Payette';
    contact3.email = 'nasa@gmail.com';
    contact3.phone = '418-933-3333';
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


