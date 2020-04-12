import 'package:meta/meta.dart';

@immutable
class User {
  final int id;
  final String username;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;


  User({ this.id, this.username, this.name, this.email, this.phoneNumber, this.address });

  User copyWith({
    int id,
    String username,
    String name,
    String email,
    String phoneNumber,
    String address
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
    );
  }

  static User fromMap(dynamic map) {
    return User(
      //TODO Michal: find a better way
      id: map['id'] as int,
      username: map['username'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      address: map['address'] as String,
    );
  }

  //TODO Michal: the below two may have to change
  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User && id == other.id;
}