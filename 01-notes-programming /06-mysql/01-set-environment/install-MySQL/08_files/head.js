if (top.location != location) top.location.href = location.href;
function $(ob){	return document.getElementById(ob);}
function drop_mouseout(pos){
	var posSel=$(pos+"Sel").style.display;
	if(posSel=="block"){
		timer = setTimeout("drop_hide('"+pos+"')", 1000);
	}
}
function drop_hide(pos){
	$(pos+"Sel").style.display="none";
}
function drop_mouseover(pos){
	try{window.clearTimeout(timer);}catch(e){}
}
function search_show(pos,sType,href){
	var fm = document.Search_form;
	$('so').name="so";fm.target="_self";
	if(sType=='tech')fm.action="http://www.duote.com/searchTech.php";
	else if(sType=='ask'){fm.action="http://so.zhidao.duote.com/";$('so').name="key";fm.target="_blank";}
	else fm.action="http://www.duote.com/search.php";
    fm.searchType.value=sType;
    $(pos+"Sel").style.display="none";
    $(pos+"Slected").innerHTML=href.innerHTML;
    fm.so.focus();
	try{window.clearTimeout(timer);}catch(e){}
	return false;
}
function search_ckdt()
{
	var fm = document.Search_form;
	var sov = fm.so.value;
	sType = fm.searchType.value;
	if(sov=='') {alert("请输入搜索关键字");return false;}
	if(sov=='单机游戏' || sov=='单机游戏下载'){ fm.action="http://www.duote.com/game.html"; return true; }
	if(sType)return true;
	$('so').name="so";fm.target="_self";fm.action="http://www.duote.com/search.php";
	var zkey = ["怎么","怎样","如何","求助","哪里","什么","跪求","为何","多少","多大","谁","吗","多久","哪个","为啥"];
	for(var s in zkey)
	{
		if(sov.indexOf(zkey[s])!=-1)
		{
			fm.action="http://so.zhidao.duote.com/";$('so').name="key";fm.target="_blank";
			return true;
		}
	}
	return true;
}
function change_searchtyp(sType){
  var fm = document.Search_form;
  $('so').name="so";fm.target="_self";
  if(sType=='tech'){
	  fm.action="http://www.duote.com/searchTech.php";
	  $('_searchType').className="";
	  $('_searchTypetech').className="active";
	  $('_searchTypeask').className="";
	  
  }
  else if(sType=='ask'){
	  fm.action="http://so.zhidao.duote.com/";
	  $('so').name="key";
	  fm.target="_blank";
	  $('_searchType').className="";
	  $('_searchTypetech').className="";
	  $('_searchTypeask').className="active";
  }
  else{
	  fm.action="http://www.duote.com/search.php";
	  $('_searchType').className="active";
	  $('_searchTypetech').className="";
	  $('_searchTypeask').className="";
  }
  fm.searchType.value=sType;
  fm.so.focus();
  return false;
}