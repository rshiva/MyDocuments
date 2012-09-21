function naviURL(link_value)
{
	//뉴스
	if(link_value=="1"){window.open("../designmadi.com/bbs/zboard.php@id=news", "newwindow", "toolbar=no, status=yes, width=634, height=600,resizable=yes,scrollbars=yes") ;
	//게스트북
	}else if(link_value=="2"){window.open("../designmadi.com/bbs/zboard.php@id=guest", "newwindow", "toolbar=no, status=yes, width=634, height=600,resizable=yes,scrollbars=yes") ;
	}else{location.href=""; 	
    }
}
 