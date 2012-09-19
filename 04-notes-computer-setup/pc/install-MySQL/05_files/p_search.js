function readSoVal(ckname,idval){
  var cknameval = getVcookie(ckname);
  if(cknameval){
    document.getElementById(idval).value=cknameval;
   }
}
//readSoVal('sea_v_so','so');