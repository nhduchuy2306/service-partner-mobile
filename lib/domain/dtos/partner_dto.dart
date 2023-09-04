class PartnerDto {
  PartnerDto({
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.photoURL,
    required this.providerId,
    required this.uid,
  });

  late final String displayName;
  late final String email;
  late final String phoneNumber;
  late final String photoURL;
  late final String providerId;
  late final String uid;

  PartnerDto.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    photoURL = json['photoURL'];
    providerId = json['providerId'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['photoURL'] = photoURL;
    data['providerId'] = providerId;
    data['uid'] = uid;
    return data;
  }
}
