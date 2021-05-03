import 'package:sqflite/sqflite.dart';
import 'package:users_sql/User.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();
  static final int version = 1;
  static Database _database;
  static final String tableName = 'users';

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    path += 'users.db';
    return await openDatabase(
      path,
      version: version,
      onCreate: (db, version) async {
        await db.execute('''
          create table $tableName (
            id integer primary key autoincrement,
            username text unique not null,
            email integer unique not null,
            password text not null
          ) 
          ''');
        await db.rawInsert('''
        insert into $tableName (username,email,password) values ('admin','admin@gmail.com','admin123')
        ''');
      },
    );
  }





//insert a user

  Future<int> insertUser(User user)async {
    final db = await database;
    return db.insert(tableName, user.toMap());
  }
  //get all users
  Future<List<User>> get users async{
    final db = await database;
    List<Map> results = await db.query(tableName);
    List<User> _users = [];
    for(var value in results){
      _users.add(User.fromMap(value));
    }
    return _users;
  }
  //get a user
  Future<User> getUser(String userName, String password) async{
    final db = await database;
    List<Map> result = await db.query(tableName, where:'username=? and password=?',whereArgs: [userName, password]);
    return User.fromMap(result[0]);
  }
  //delete a user
  Future<int> deleteUser(int id) async{
    final db = await database;
    return await db.delete(tableName, where: 'id=?',whereArgs: [id]);
  }
  //update a user
  Future<int> updateUser(User user) async {
    final db = await database;
    user.password = '123456';
    return await db.update(tableName, user.toMap(), where: 'id=?', whereArgs: [user.id]);
  }


}