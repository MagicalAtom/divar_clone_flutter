class Profile {
  Profile({
    required this.id,
    required this.username,
    required this.createdAt,
  });

  final String id;

  final String username;
  
  final DateTime createdAt;

  factory Profile.fromMap(Map<String, dynamic> map)
      {
        return Profile(
          id : map['id'],
        username : map['username'],
        createdAt : DateTime.parse(map['created_at']),
        );
      }
}
