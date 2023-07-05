class Data {
  String sId;
  String pCode;
  String branchCode;
  String pBarLuckyNumber;
  String pBarGift;
  String pBarTypeGift;
  bool pBarIsSold;
  String lotCode;
  int isActive;
  String pBarData;
  int index;
  int statusPrint;
  String? packingDate;
  String? expirationDate;
  String? agent; // Type value unknown
  String? pBarData2; // Type value unknown
  String? mappingDate; // Type value unknown
  String? pExpirationDate;
  String? pPackingDate; 
  String? pSerial; // Type value unknown
  String pBrandName;
  String pMadeIn;
  String pManufacturer;
  String pUnit;
  String pDescription;
  String pPrice;
  String pRetails;
  String pQuantity;
  String pUserCreate;
  String pDateCreate;
  String pAvatar;
  String pName;
  String lotNumber;
  String effects;
  String use;
  String ingredient;
  List<dynamic> listAvatar; // Type value unknown
  int scanCount;
  String? agentInfo;
  List<dynamic> agentList; // Type value unknown


  Data(
      {required this.sId,
      required this.pCode,
      required this.branchCode,
      required this.pBarLuckyNumber,
      required this.pBarGift,
      required this.pBarTypeGift,
      required this.pBarIsSold,
      required this.lotCode,
      required this.isActive,
      required this.pBarData,
      required this.index,
      required this.statusPrint,
      required this.packingDate,
      required this.expirationDate,
      this.agent,
      this.pBarData2,
      this.mappingDate,
      required this.pExpirationDate,
      required this.pPackingDate,
      required this.pSerial,
      required this.pBrandName,
      required this.pMadeIn,
      required this.pManufacturer,
      required this.pUnit,
      required this.pDescription,
      required this.pPrice,
      required this.pRetails,
      required this.pQuantity,
      required this.pUserCreate,
      required this.pDateCreate,
      required this.pAvatar,
      required this.pName,
      required this.lotNumber,
      required this.effects,
      required this.use,
      required this.ingredient,
      required this.listAvatar,
      required this.scanCount,
      this.agentInfo,
      required this.agentList,
      });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        sId: json['_id'],
        pCode: json['PCode'],
        branchCode: json['BranchCode'],
        pBarLuckyNumber: json['PBarLuckyNumber'],
        pBarGift: json['PBarGift'],
        pBarTypeGift: json['PBarTypeGift'],
        pBarIsSold: json['PBarIsSold'],
        lotCode: json['LotCode'],
        isActive: json['IsActive'],
        pBarData: json['PBarData'],
        index: json['Index'],
        statusPrint: json['StatusPrint'],
        packingDate: json['PackingDate'],
        expirationDate: json['ExpirationDate'],
        agent: json['Agent'],
        pBarData2: json['PBarData2'],
        mappingDate: json['MappingDate'],
        pExpirationDate: json['PExpirationDate'],
        pPackingDate: json['PPackingDate'],
        pSerial: json['PSerial'],
        pBrandName: json['PBrandName'],
        pMadeIn: json['PMadeIn'],
        pManufacturer: json['PManufacturer'],
        pUnit: json['PUnit'],
        pDescription: json['PDescription'],
        pPrice: json['PPrice'],
        pRetails: json['PRetails'],
        pQuantity: json['PQuantity'],
        pUserCreate: json['PUserCreate'],
        pDateCreate: json['PDateCreate'],
        pAvatar: json['PAvatar'],
        pName: json['PName'],
        lotNumber: json['LotNumber'],
        effects: json['Effects'],
        use: json['Use'],
        ingredient: json['Ingredient'],
        listAvatar: json["ListAvatar"],
        scanCount: json['ScanCount'],
        agentInfo: json['AgentInfo'],
        agentList: json['AgentList'],
    );
  }
}
