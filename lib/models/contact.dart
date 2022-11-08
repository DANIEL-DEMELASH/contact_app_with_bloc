class Contact {
  int? id;
  String? fullName;
  String? nickName;
  String? job;
  String? sex;
  String? phoneNumber;
  String? email;
  String? telegram;
  String? linkedIn;
  String? github;
  String? twitter;
  Address? address;
  String? error;

  Contact(
      {this.id,
      this.fullName,
      this.nickName,
      this.job,
      this.sex,
      this.phoneNumber,
      this.email,
      this.telegram,
      this.linkedIn,
      this.github,
      this.twitter,
      this.address,
      this.error});

  Contact.withError(this.error);

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    nickName = json['nick_name'];
    job = json['job'];
    sex = json['sex'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    telegram = json['telegram'];
    linkedIn = json['linked_in'];
    github = json['github'];
    twitter = json['twitter'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['nick_name'] = nickName;
    data['job'] = job;
    data['sex'] = sex;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['telegram'] = telegram;
    data['linked_in'] = linkedIn;
    data['github'] = github;
    data['twitter'] = twitter;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    return data;
  }
}

class Address {
  String? street;
  String? city;
  String? state;
  String? country;

  Address({this.street, this.city, this.state, this.country});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['Street'];
    city = json['City'];
    state = json['State'];
    country = json['Country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Street'] = street;
    data['City'] = city;
    data['State'] = state;
    data['Country'] = country;
    return data;
  }
}
