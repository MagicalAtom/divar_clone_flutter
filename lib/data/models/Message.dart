class Message {
  String id;
  String profileId;
  String content;
  DateTime created_at;
  bool isMine;




  Message(
    {
      required this.id,
      required this.content,
      required this.created_at,
      required this.isMine,
      required this.profileId
    }
  );

factory Message.fromMap(Map<String,dynamic> map){
  return Message(id: map['id'], content: map['content'], created_at: DateTime.parse(map['created_at']), isMine: map['isMine'], profileId: map['profileId']);
}


}