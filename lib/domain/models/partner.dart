class Partner {
  Partner({
    required this.partnerId,
    required this.partnerName,
    required this.email,
    required this.location,
    required this.gender,
    required this.image,
    required this.phoneNumber,
    required this.status,
    required this.idNumber,
  });
  late final String partnerId;
  late final String partnerName;
  late final String email;
  late final String location;
  late final String gender;
  late final String image;
  late final String phoneNumber;
  late final String status;
  late final String idNumber;

  Partner.fromJson(Map<String, dynamic> json) {
    partnerId = json['partnerId'] ?? "";
    partnerName = json['partnerName'] ?? "";
    email = json['email'] ?? "";
    location = json['location'] ?? "";
    gender = json['gender'] ?? "";
    image = json['image'] ?? "";
    phoneNumber = json['phoneNumber'] ?? "";
    status = json['status'] ?? "";
    idNumber = json['idNumber'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['partnerId'] = partnerId;
    data['partnerName'] = partnerName;
    data['email'] = email;
    data['location'] = location;
    data['gender'] = gender;
    data['image'] = image;
    data['phoneNumber'] = phoneNumber;
    data['status'] = status;
    data['idNumber'] = idNumber;
    return data;
  }
}
