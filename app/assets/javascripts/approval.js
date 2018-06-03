function test(path){
  var target = $('[id=approval_tcindex] option:selected').text();
  location.href=path+'/'+target;
}