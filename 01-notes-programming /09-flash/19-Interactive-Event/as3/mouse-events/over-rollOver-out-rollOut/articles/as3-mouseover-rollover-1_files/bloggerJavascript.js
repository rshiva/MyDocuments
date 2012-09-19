
// Show/Hide Content
function showHideContent(node) {
    var postBody = node.parentNode.parentNode.getElementsByTagName('div')[1];
    var spans = postBody.getElementsByTagName('span');
    for (var i = 0 ; i < spans.length ; ++i) {
        if (spans[i].className == 'fullpost') {
            if (spans[i].style.display != 'inline') {
            	spans[i].style.display = 'inline';
            } else {
            	spans[i].style.display = 'none';
            }
        }
    }
};

// float navbar
window.onscroll = function() {
    var navbar = document.getElementById('navbar');
    if (navbar)
        navbar.style.top = document.body.parentNode.scrollTop + 'px';
};

// Label Cloud User Variables
var cloudMin = 1;
var maxFontSize = 24;
var maxColor = [0,0,128];
var minFontSize = 7;
var minColor = [216,216,128];
var lcShowCount = false;

// Label Cloud
function s(a,b,i,x){
	if (a > b){
		var m=(a-b)/Math.log(x),v=a-Math.floor(Math.log(i)*m);
	} else{
		var m=(b-a)/Math.log(x),v=Math.floor(Math.log(i)*m+a);
	}
	return v;
}

function genLabelCloud(ts) {
	var c=[];
	var labelCount = new Array();
	
	for (t in ts) {
		if (!labelCount[ts[t]]) {
			labelCount[ts[t]] = new Array(ts[t]);
		}
	}
	var ta=cloudMin-1;
	tz = labelCount.length - cloudMin;
	ul = document.createElement('ul');
	ul.className = 'label-cloud'
	ul.innerHTML = '<br/>';
	for(var t in ts){
		if (ts[t] < cloudMin){
			continue;
		}
		for (var i=0 ;3 > i ; i++) {
			c[i]=s(minColor[i],maxColor[i],ts[t]-ta,tz);
		}
		var fs = s(minFontSize,maxFontSize,ts[t]-ta,tz);
		li = document.createElement('li');
		li.style.fontSize = fs+'px';
		//li.style.lineHeight = '1';
		
		tLab = t.replace(/-/g, ' ');
		
		a = document.createElement('a');
		a.title = ts[t]+' Posts in '+tLab;
		a.style.color = 'rgb('+c[0]+','+c[1]+','+c[2]+')';
		a.href = '/search/label/'+encodeURIComponent(t);
		
		if (lcShowCount){
			span = document.createElement('span');
			span.innerHTML = '('+ts[t]+') ';
			span.className = 'label-count';
			a.appendChild(document.createTextNode(tLab));
			li.appendChild(a);
			li.appendChild(span);
		} else {
			a.appendChild(document.createTextNode(tLab));
			li.appendChild(a);
		}
		
		ul.appendChild(li);
		abnk = document.createTextNode(' ');
		ul.appendChild(abnk);
	}
	lc2 = document.getElementById('labelCloud');
	if (lc2) lc2.appendChild(ul);
}