class UserModel {
  String? name;
  int? type; // patient = 0 - caregiver => 1
  String? email;
  String? chatID;
  String ? idDoc;

  UserModel({
    required this.name,
    required this.email,
    required this.type,
    required this.chatID,
    required this.idDoc
  });

  UserModel.fromMap(Map<String, dynamic> data) {
    if (data['name'] != null) {
      name = data['name'];
    }
    if (data['email'] != null) {
      email = data['email'];
    }
    if (data['type'] != null) {
      type = data['type'];
    }
    if (data['chatID'] != null) {
      chatID = data['chatID'];
    }
      idDoc = data['chatID'];


  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = {};

    if (name != null) {
      data['name'] = name;
    }
    if (type != null) {
      data['type'] = type;
    }
    if (email != null) {
      data['email'] = email;
    }
    if (chatID != null) {
      data['chatID'] = chatID;
    }
    if(idDoc !=null)
    {
      data['idDoc'] = idDoc;

    }

    return data;
  }
}
