function OpenWindowAndSetValue(Url,Width,Height,WindowObj,SetObj)
{
var ReturnStr=showModalDialog(Url,WindowObj,'dialogWidth:'+Width+'pt;dialogHeight:'+Height+'pt;status:no;help:no;scroll:no;');
if (ReturnStr!='007007007007') SetObj.value=ReturnStr;
return ReturnStr;
}

function bookmarkSite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("加入收藏失败，有劳您手动添加。");
        }
    }
}

function checkss(so,n)
{
	var preSo = keywordjsx;
	if (n == 0 && so.value == preSo )
	{
		so.value="";
		return true;
	}
	if (n == 1)
	{
		if(so.value == preSo )
		{
			so.value="";
		}
		return true;
	}
	if (n == 2 && so.value == "")
	{
		so.value = preSo;
		return true;
	}
	if(n == 4 && (so.value == "" || so.value == preSo ))
	{
		alert("请填写要搜索的关键词..");
		so.focus();
		return true;
	}
	return true;
}
var keywordjsx="";


