import 'package:unittest/unittest.dart';
import 'package:dartlero/dartlero.dart';
import 'package:ex6/ex6.dart';

testContacts(Contacts contacts) {
  group("Testing Projects", () {
    setUp(() {
      var contactCount = 0;
      expect(contacts.length, equals(contactCount));
           
      var contact1 = new Contact();
      expect(contact1, isNotNull);
      contact1.nom = 'Joey Jojo';
      contact1.email = 'jojothegreat@gmail.com';
      contact1.phone = '418-911-9111';
      contacts.add(contact1);
      expect(contacts.length, equals(++contactCount));

      var contact2 = new Contact();
      expect(contact2, isNotNull);
      contact2.nom = 'Bob Parker';
      contact2.email = 'Bobparker@gmail.com';
      contact2.phone = '418-922-9222';
      contacts.add(contact2);
      expect(contacts.length, equals(++contactCount));

      var contact3 = new Contact();
      expect(contact3, isNotNull);
      contact3.nom = 'Julie Payette';
      contact3.email = 'nasa@gmail.com';
      contact3.phone = '418-933-3333';
      contacts.add(contact3);
      expect(contacts.length, equals(++contactCount));

      //projects.display('Projects');
    });
    tearDown(() {
      contacts.clear();
      expect(contacts.isEmpty, isTrue);
      
      
      
     
});
    test('Add Project', () {
      var contact = new Contact();
      expect(contact, isNotNull);
      contact.nom = 'Thomas Chabot';
      contact.email = 'monemail@gmail.com';
      contact.phone = "418-444-4444";
      
      var added = contacts.add(contact);
      expect(added, isTrue);
      contacts.display('Add Project');
    });
    test('Add Project Without Data', () {
      var projectCount = contacts.length;
      var project = new Contact();
      expect(project, isNotNull);
     var added = contacts.add(project);
      expect(added, isTrue);
      contacts.display('Add Project Without Data');
});
   
     
  test('Add Contact Not Unique', () {
    var contactCount = contacts.length;
    var contact = new Contact();
    expect(contact, isNotNull);
    contact.nom = 'Joey Jojo';   
    var added = contacts.add(contact);
    expect(added, isFalse);
    contacts.display('Add Contact Not Unique');
  });
  
    
    test('Find Project by Name', () {
      var searchName = 'Bob Parker';
      var contact = contacts.find(searchName);
      expect(contact, isNotNull);
      expect(contact.nom, equals(searchName));
      contact.display('Find Project by Name');
    });
    
    
    test('Select Contacts by Email', () {
    var emailscontacts = contacts.select((c) => c.onEmail);
    expect(emailscontacts.isEmpty, isFalse);
    expect(emailscontacts.length, equals(3));
    emailscontacts.display('Select Contacts by Email');
  });

//    
    
    test('Select Contacts by Email then Add', () {
      var emailscontacts = contacts.select((c) => c.onEmail);
      expect(emailscontacts.isEmpty, isFalse);

      var testemail = 'Joey Jojo2';
      var emailcontact = new Contact();
      emailcontact.nom = testemail;
      emailcontact.email = 'jojothegreat2@gmail.com';
      emailcontact.phone = '418-911-9112';
      
      var added = emailscontacts.add(emailcontact);
      expect(added, isTrue);
      emailscontacts.display('Select Contacts by Email then Add');

      var contact = contacts.find(testemail);
      expect(contact, isNull);
      contacts.display('Contacts');
    });   
    
    
    
    test('Select Contacts by email then Remove', () {
      var contactCount = contacts.length;
      contacts.display('Contacts Before Remove');
      var EmailContacts = contacts.select((c) => c.onEmail);
      expect(EmailContacts.isEmpty, isFalse);

      var searchName = 'Joey Jojo';
      var contact = EmailContacts.find(searchName);
      expect(contact, isNotNull);
      expect(contact.nom, equals(searchName));
      var EmailContactCount = EmailContacts.length;
      EmailContacts.remove(contact);
      expect(EmailContacts.length, equals(--EmailContactCount));
      expect(contacts.length, equals(contactCount));
    });  
    
    
    
    test('Order Contacts by Name', () {
      contacts.orderByFunction((m,n) => m.compareTo(n));
      contacts.display('Order Contacts by Name');
    });  
    
    
    test('New Contact', () {
      var projectCount = contacts.length;
      var contact4 = new Contact();
      expect(contact4, isNotNull);
     
      contact4.nom = 'Frank';
      contact4.email = 'Frankthetank@gmail.com';
      contact4.phone = '418-444-4445';
      
      var added = contacts.add(contact4);
      expect(added, isTrue);
      expect(contacts.length, equals(++projectCount));
      contacts.display('New Project');
    });
    
    
    
    
    test('Copy Contacts', () {
      Contacts copiedContacts = contacts.copy();
      expect(copiedContacts.isEmpty, isFalse);
      expect(copiedContacts.length, equals(contacts.length));
      expect(copiedContacts, isNot(same(contacts)));
      expect(copiedContacts, isNot(equals(contacts)));
      copiedContacts.forEach((cp) =>
          expect(cp, isNot(same(contacts.find(cp.nom)))));
      copiedContacts.display('Copied Contacts');
     //projects.display('Projects');
    });
    
    
    test('True for Every Contact', () {
      expect(contacts.every((p) => p.code != null), isTrue);
      expect(contacts.every((p) => p.nom != null), isTrue);
    });
//   
   
      test('From Projects to JSON', () {
      var json = contacts.toJson();
      expect(json, isNotNull);
      print(json);
    });

   
   
   
   
       test('From JSON to Project Model', () {
    List<Map<String, Object>> json = contacts.toJson();
      contacts.clear();
      expect(contacts.isEmpty, isTrue);
      contacts.fromJson(json);
      expect(contacts.isEmpty, isFalse);
      contacts.display('From JSON to Projects');
   });
});
}



initDisplayModel() {
  ContactModel contactModel = new ContactModel();
  contactModel.init();
  contactModel.display();
}

testModel() {
  ContactModel contactModel = new ContactModel();
  Contacts contacts = contactModel.contacts;
  testContacts(contacts);
}

main() {
  //initDisplayModel();
  testModel();
}
