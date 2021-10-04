class Message {
  String? id, type, msg;
  MsgFrom? from;
  MsgTo? to;

  Message({this.id, this.type, this.msg, this.from, this.to});

  factory Message.fromJson(dynamic data) {
    MsgFrom msf = MsgFrom.fromJson(data["from"]);
    MsgTo mst = MsgTo.fromJson(data["to"]);
    return Message(
        id: data["_id"],
        type: data["type"],
        msg: data["msg"],
        from: msf,
        to: mst);
  }
}

class MsgFrom {
  String? id, name;

  MsgFrom({this.id, this.name});

  factory MsgFrom.fromJson(dynamic data) {
    return MsgFrom(id: data["_id"], name: data["name"]);
  }
}

class MsgTo {
  String? id, name;

  MsgTo({this.id, this.name});

  factory MsgTo.fromJson(dynamic data) {
    return MsgTo(id: data["_id"], name: data["name"]);
  }
}
