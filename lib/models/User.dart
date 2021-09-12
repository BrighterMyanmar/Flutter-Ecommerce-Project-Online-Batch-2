class User {
  String? id, name, email, phone, token;

  User({this.id, this.name, this.email, this.phone, this.token});

  factory User.fromJson(dynamic data) {
    return User(
        id: data["id"],
        name: data["name"],
        email: data["email"],
        phone: data["phone"],
        token: data["token"]);
  }
}

/*
{
    id:613de5eb4b7964449675741b,
    name:spiderman,
    email:spiderman@gmail.com,
    phone:08400400400,
    token:eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9
}
 */
