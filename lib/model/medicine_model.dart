class MedicineModel
{
  String ?medicineName;
  String ?dosage;
  String ?frequency;
  MedicineModel({
    required this.dosage,
    required this.frequency,
    required this.medicineName,
});
  MedicineModel.fromJson(Map<String ,dynamic> json)
  {
    medicineName = json['Medicine Name'];
    dosage = json['dosage'];
    frequency = json['frequency'];
  }

}