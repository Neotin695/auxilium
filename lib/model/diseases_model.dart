class Disease{
  int  id;
  String title;
  String content;
Disease({
    required this.id,
  this.title="Disease's Name",
  this.content="Description",
});
Map<String , dynamic> toMap(){
  Map<String , dynamic> data = <String, dynamic>{};
  if(id!=null){
    data['id']=id;}
    data['title']=title;
    data['content']=content;
  return data;
}
@override
  toString (){
  return{
    'id':id,
    'title':title,
    'content':content,
  }.toString();
}
}
