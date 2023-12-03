class StorageModel {
  StorageModel(this.totalSpace, this.freeSpace, this.useSpace);
  double totalSpace;
  double freeSpace;
  double useSpace;

  factory StorageModel.fromJson(Map<String, dynamic> json) {
    return StorageModel(
        json["TotalSpace"], json["FreeSpace"], json["UsedSpace"]);
  }
}
