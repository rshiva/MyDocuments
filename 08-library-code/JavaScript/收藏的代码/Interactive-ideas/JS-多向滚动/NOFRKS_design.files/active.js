//klasa za postavljanje vremena
ourDate = new Date();

//uzima samo na sat
var time = ourDate.getHours();

//vrijeme za dan ako nije onda je noc
if (time > 7 && time < 19)
{
    document.write('<link href="http://www.nofrks.com/css/style1.css" rel="stylesheet" type="text/css" media="screen, projection"/>');
}
else
{
   document.write('<link href="http://www.nofrks.com/css/style.css" rel="stylesheet" type="text/css" media="screen, projection"/>'); 
} 
function home ()
{
    document.getElementById("linkPortfolio").className='';
    document.getElementById("linkContact").className='';
    document.getElementById("linkPack").className='';
    document.getElementById("linkHome").className='active';
}

function offers ()
{
    document.getElementById("linkHome").className='';
    document.getElementById("linkPortfolio").className='';
    document.getElementById("linkContact").className='';
    document.getElementById("linkPack").className='active';
}

function portfolio ()
{
    document.getElementById("linkHome").className='';
    document.getElementById("linkContact").className='';
    document.getElementById("linkPack").className='';
    document.getElementById("linkPortfolio").className='active';
}

function contact ()
{
    document.getElementById("linkPack").className='';
    document.getElementById("linkHome").className='';
    document.getElementById("linkPortfolio").className='';
    document.getElementById("linkContact").className='active';
}
// Billboard
function billboardintro ()
{
    document.getElementById("billboardpack1").className='';
    document.getElementById("billboardpack2").className='';
    document.getElementById("billboardpack3").className='';
    document.getElementById("billboardpack4").className='';
    document.getElementById("billboardintro").className='active';
}
function billboardpack1 ()
{
    document.getElementById("billboardpack2").className='';
    document.getElementById("billboardpack3").className='';
    document.getElementById("billboardpack4").className='';
    document.getElementById("billboardintro").className='';
    document.getElementById("billboardpack1").className='active';
}
function billboardpack2 ()
{
    document.getElementById("billboardpack3").className='';
    document.getElementById("billboardpack4").className='';
    document.getElementById("billboardintro").className='';
    document.getElementById("billboardpack1").className='';
    document.getElementById("billboardpack2").className='active';
}
function billboardpack3 ()
{
    document.getElementById("billboardpack4").className='';
    document.getElementById("billboardintro").className='';
    document.getElementById("billboardpack1").className='';
    document.getElementById("billboardpack2").className='';
    document.getElementById("billboardpack3").className='active';
}
function billboardpack4 ()
{
    document.getElementById("billboardintro").className='';
    document.getElementById("billboardpack1").className='';
    document.getElementById("billboardpack2").className='';
    document.getElementById("billboardpack3").className='';
    document.getElementById("billboardpack4").className='active';
}
// Portfolio
function afro ()
{
    document.getElementById("koledzjanjos").className='';
    document.getElementById("avondale").className='';
    document.getElementById("fastingconnection").className='';
    document.getElementById("earthwisewater").className='';
    document.getElementById("automotozone").className='';
    document.getElementById("akcijaonline").className='';
    document.getElementById("loghomes").className='';
    document.getElementById("golavoda").className='';
    document.getElementById("argo").className='';
	document.getElementById("winslow").className='';
	document.getElementById("benzaker").className='';
    document.getElementById("afro").className='active';
}
function fastingconnection ()
{
	document.getElementById("koledzjanjos").className='';
    document.getElementById("avondale").className='';
    document.getElementById("earthwisewater").className='';
    document.getElementById("automotozone").className='';
    document.getElementById("akcijaonline").className='';
    document.getElementById("loghomes").className='';
    document.getElementById("golavoda").className='';
    document.getElementById("argo").className='';
    document.getElementById("afro").className='';
	document.getElementById("winslow").className='';
	document.getElementById("benzaker").className='';
    document.getElementById("fastingconnection").className='active';
}
function earthwisewater ()
{
	document.getElementById("koledzjanjos").className='';
    document.getElementById("avondale").className='';
    document.getElementById("automotozone").className='';
    document.getElementById("akcijaonline").className='';
    document.getElementById("loghomes").className='';
    document.getElementById("golavoda").className='';
    document.getElementById("argo").className='';
    document.getElementById("afro").className='';
    document.getElementById("fastingconnection").className='';
	document.getElementById("winslow").className='';
	document.getElementById("benzaker").className='';
    document.getElementById("earthwisewater").className='active';
}
function automotozone ()
{
	document.getElementById("koledzjanjos").className='';
    document.getElementById("avondale").className='';
    document.getElementById("akcijaonline").className='';
    document.getElementById("loghomes").className='';
    document.getElementById("golavoda").className='';
    document.getElementById("argo").className='';
    document.getElementById("afro").className='';
    document.getElementById("fastingconnection").className='';
    document.getElementById("earthwisewater").className='';
	document.getElementById("winslow").className='';
	document.getElementById("benzaker").className='';
    document.getElementById("automotozone").className='active';
}
function akcijaonline ()
{
	document.getElementById("koledzjanjos").className='';
    document.getElementById("avondale").className='';
    document.getElementById("loghomes").className='';
    document.getElementById("golavoda").className='';
    document.getElementById("argo").className='';
    document.getElementById("afro").className='';
    document.getElementById("fastingconnection").className='';
    document.getElementById("earthwisewater").className='';
    document.getElementById("automotozone").className='';
	document.getElementById("winslow").className='';
	document.getElementById("benzaker").className='';
    document.getElementById("akcijaonline").className='active';
}
function loghomes ()
{
	document.getElementById("koledzjanjos").className='';
    document.getElementById("avondale").className='';
    document.getElementById("golavoda").className='';
    document.getElementById("argo").className='';
    document.getElementById("afro").className='';
    document.getElementById("fastingconnection").className='';
    document.getElementById("earthwisewater").className='';
    document.getElementById("automotozone").className='';
    document.getElementById("akcijaonline").className='';
	document.getElementById("winslow").className='';
	document.getElementById("benzaker").className='';
    document.getElementById("loghomes").className='active';
}
function golavoda ()
{
	document.getElementById("koledzjanjos").className='';
    document.getElementById("avondale").className='';
    document.getElementById("argo").className='';
    document.getElementById("afro").className='';
    document.getElementById("fastingconnection").className='';
    document.getElementById("earthwisewater").className='';
    document.getElementById("automotozone").className='';
    document.getElementById("akcijaonline").className='';
    document.getElementById("loghomes").className='';
	document.getElementById("winslow").className='';
	document.getElementById("benzaker").className='';
    document.getElementById("golavoda").className='active';
}
function argo ()
{
	document.getElementById("koledzjanjos").className='';
    document.getElementById("avondale").className='';
    document.getElementById("afro").className='';
    document.getElementById("fastingconnection").className='';
    document.getElementById("earthwisewater").className='';
    document.getElementById("automotozone").className='';
    document.getElementById("akcijaonline").className='';
    document.getElementById("loghomes").className='';
    document.getElementById("golavoda").className='';
	document.getElementById("winslow").className='';
	document.getElementById("benzaker").className='';
    document.getElementById("argo").className='active';
}
function koledzjanjos ()
{
    document.getElementById("avondale").className='';
    document.getElementById("afro").className='';
    document.getElementById("fastingconnection").className='';
    document.getElementById("earthwisewater").className='';
    document.getElementById("automotozone").className='';
    document.getElementById("akcijaonline").className='';
    document.getElementById("loghomes").className='';
    document.getElementById("golavoda").className='';
    document.getElementById("argo").className='';
	document.getElementById("winslow").className='';
	document.getElementById("benzaker").className='';
    document.getElementById("koledzjanjos").className='active';
}
function avondale ()
{
    document.getElementById("afro").className='';
    document.getElementById("fastingconnection").className='';
    document.getElementById("earthwisewater").className='';
    document.getElementById("automotozone").className='';
    document.getElementById("akcijaonline").className='';
    document.getElementById("loghomes").className='';
    document.getElementById("golavoda").className='';
    document.getElementById("argo").className='';
    document.getElementById("koledzjanjos").className='';
	document.getElementById("winslow").className='';
	document.getElementById("benzaker").className='';
    document.getElementById("avondale").className='active';
}
function winslow ()
{
    document.getElementById("afro").className='';
    document.getElementById("fastingconnection").className='';
    document.getElementById("earthwisewater").className='';
    document.getElementById("automotozone").className='';
    document.getElementById("akcijaonline").className='';
    document.getElementById("loghomes").className='';
    document.getElementById("golavoda").className='';
    document.getElementById("argo").className='';
    document.getElementById("koledzjanjos").className='';
	document.getElementById("benzaker").className='';
    document.getElementById("avondale").className='';
	document.getElementById("winslow").className='active';
}
function benzaker ()
{
    document.getElementById("afro").className='';
    document.getElementById("fastingconnection").className='';
    document.getElementById("earthwisewater").className='';
    document.getElementById("automotozone").className='';
    document.getElementById("akcijaonline").className='';
    document.getElementById("loghomes").className='';
    document.getElementById("golavoda").className='';
    document.getElementById("argo").className='';
    document.getElementById("koledzjanjos").className='';
	document.getElementById("winslow").className='';
    document.getElementById("avondale").className='';
	document.getElementById("benzaker").className='active';
}