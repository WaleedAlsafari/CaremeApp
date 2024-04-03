@TestOn('vm')
library sqflite_common_ffi.test.sqflite_ffi_doc_test;

import 'package:Careme/pages/sign_up/sign_up_widget.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test/test.dart';

void main() async {
  // Init ffi loader if needed.
  sqfliteFfiInit();
  var factory = databaseFactoryFfi;
  var db = await factory.openDatabase(inMemoryDatabasePath,
      options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await db.execute('''
      CREATE TABLE users(
        nationalId INTEGER PRIMARY KEY AUTOINCREMENT,
        firstName TEXT,
        lastName TEXT,
        gender TEXT,
        phoneNo TEXT,
        email TEXT,
        pass TEXT
      )
    ''');
          }));
  test('Insert operation', () async {
    // Insert some data
    await db.insert('users', {
      'firstName': 'Waleed',
      'lastName': 'Alsafari',
      'gender': 'Male',
      'phoneNo': '541327080',
      'email': 'sop5055@gmail.com',
      'pass': 'Axaxax123'
    });

    // Check content
    expect(await db.query('users'), [
      {
        'nationalId': 1,
        'firstName': 'Waleed',
        'lastName': 'Alsafari',
        'gender': 'Male',
        'phoneNo': '541327080',
        'email': 'sop5055@gmail.com',
        'pass': 'Axaxax123'
      }
    ]);
  });

  test('Update operation', () async {
    await db.update('users', {
      'nationalId': 1,
      'firstName': 'Hassan',
      'lastName': 'Turkistani',
      'gender': 'Male',
      'phoneNo': '51234567891',
      'email': 'Hassan@gmail.com',
      'pass': 'Q1w2e3r4t5'
    });

    // Check content
    expect(await db.query('users'), [
      {
        'nationalId': 1,
        'firstName': 'Hassan',
        'lastName': 'Turkistani',
        'gender': 'Male',
        'phoneNo': '51234567891',
        'email': 'Hassan@gmail.com',
        'pass': 'Q1w2e3r4t5'
      }
    ]);
  });

  test('Delete operation', () async {
    await db.delete('users', where: 'nationalId = ?', whereArgs: [1]);

    expect(await db.query('users'), []);

    await db.close();
  });
}
