class ContactModel{
  String? image;
  String name;
  bool isOnline;
  String lastSeenTime;

  ContactModel(this.name,this.isOnline,this.lastSeenTime,{this.image});
}