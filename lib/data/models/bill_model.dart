class BillModel{
  String date;
  int id;
  String state;
  String amount;
  BillModel({required this.id,required this.state,required this.amount,required this.date});
}
List<BillModel> bills =[
  BillModel(date: '18/10/2022',id: 67250216,state: 'غير مدفوعة',amount: ' 200.000 د.ك'),
  BillModel(date: '18/10/2022',id: 67250216,state: 'غير مدفوعة',amount: ' 200.000 د.ك'),
  BillModel(date: '18/10/2022',id: 67250216,state: 'غير مدفوعة',amount: ' 200.000 د.ك'),
  BillModel(date: '18/10/2022',id: 67250216,state: 'غير مدفوعة',amount: ' 200.000 د.ك'),
];
List<BillModel> requests =[
  BillModel(date: '20/10/2022',id: 67250216,state: 'غير مدفوعة',amount: ' 200.000 د.ك'),
  BillModel(date: '20/10/2022',id: 67250216,state: 'غير مدفوعة',amount: ' 200.000 د.ك'),
  BillModel(date: '20/10/2022',id: 67250216,state: 'غير مدفوعة',amount: ' 200.000 د.ك'),
  BillModel(date: '20/10/2022',id: 67250216,state: 'غير مدفوعة',amount: ' 200.000 د.ك'),
];