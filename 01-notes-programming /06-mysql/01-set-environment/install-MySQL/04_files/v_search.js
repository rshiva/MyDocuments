function addCk(){
var so = document.getElementById('v_so').value;
var sid = getRadioValue('sid');
var type = getRadioValue('type');
var lang = getRadioValue('lang');
var fee = getRadioValue('fee');
var addTime = document.getElementById('addTime').value;
var minSize = document.getElementById('minSize').value;
var maxSize = document.getElementById('maxSize').value;
var ra = getRadioValue('ra');
var vtp = getRadioValue('vtp');
setVcookie('sea_v_so',so,1);
setVcookie('sea_sid',sid,1);
setVcookie('sea_type',type,1);
setVcookie('sea_lang',lang,1);
setVcookie('sea_fee',fee,1);
setVcookie('sea_addTime',addTime,1);
setVcookie('sea_minSize',minSize,1);
setVcookie('sea_maxSize',maxSize,1);
setVcookie('sea_ra',ra,1);
setVcookie('sea_vtp',vtp,1);
}
function setCk(){
  var so = getVcookie('sea_v_so');
  var sid = getVcookie('sea_sid');
  var type = getVcookie('sea_type');
  var lang = getVcookie('sea_lang');
  var fee = getVcookie('sea_fee');
  var addTime = getVcookie('sea_addTime');
  var minSize = getVcookie('sea_minSize');
  var maxSize = getVcookie('sea_maxSize');
  var ra = getVcookie('sea_ra');
  var vtp = getVcookie('sea_vtp');
  

  if(so){
   document.getElementById('v_so').value=so;
  }
  if(addTime){
   document.getElementById('addTime').value=addTime;
  }
  if(minSize){
   document.getElementById('minSize').value=minSize;
  }
  if(maxSize){
   document.getElementById('maxSize').value=maxSize;
  }
  addRadioVal('sid',sid);
  addRadioVal('type',type);
  addRadioVal('lang',lang);
  addRadioVal('fee',fee);
  addRadioVal('ra',ra);
  addRadioVal('vtp',vtp);
}
function addRadioVal(n,v){
  if(v!="undefined"){
	document.getElementById(n+v).checked=true;
  }
}
function getRadioValue(obj)
{
    var o=document.getElementsByName(obj);
    var len=o.length; 
    for (var i=0;i<len ;i++ )
    { 
	  if( o[i].checked==true )
      {
        return(o[i].value);
      }
    }
}


function setVcookie(c_name,value,expiredays)
{
var exdate=new Date()
exdate.setDate(exdate.getDate()+expiredays)
document.cookie=c_name+ "=" +escape(value)+((expiredays==null) ? "" : ";expires="+exdate.toGMTString())
}


function getVcookie(sName)
{
	var aCookie = document.cookie.split("; ");
	for (var i=0; i < aCookie.length; i++)
	{
		var aCrumb = aCookie[i].split("=");
		if (sName == aCrumb[0]){ if(aCrumb[1]){ var r = unescape(aCrumb[1]); return r; }}
	}
	return '';
}
function recordSoVal(){
  var so = document.getElementById('so').value;
  setVcookie('sea_v_so',so,1);
}
function recordXgSoVal(soVal){
  setVcookie('sea_v_so',soVal,1);
}