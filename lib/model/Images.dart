class Images{
  final String icon;
  Images({required this.icon});

  factory Images.fromJson(Map<String, dynamic> json){
    if(json["icon"] != null){
      return Images(icon: json["icon"]);
    }
    return Images(icon: "https://fortnite-api.com/images/cosmetics/br/backpack_agentxkoi/icon.png");
  }
}