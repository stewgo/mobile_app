import 'package:meta/meta.dart';

@immutable
class User {
  final int id;
  final String username;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String pickupInfo;


  User({ this.id, this.username, this.name, this.email, this.phoneNumber, this.address, this.pickupInfo });

  User copyWith({
    int id,
    String username,
    String name,
    String email,
    String phoneNumber,
    String address,
    String pickupInfo
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      pickupInfo: pickupInfo ?? this.pickupInfo
    );
  }

  static User fromMap(dynamic map) {
    return User(
      //TODO Michal: find a better way
        id: map['id'] as int,
        username: map['attributes']['username'] as String,
        name: map['attributes']['name'] as String,
        email: map['attributes']['email'] as String,
        phoneNumber: map['attributes']['phoneNumber'] as String,
        address: map['attributes']['address'] as String,
        pickupInfo: map['attributes']['pickupInfo'] as String
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