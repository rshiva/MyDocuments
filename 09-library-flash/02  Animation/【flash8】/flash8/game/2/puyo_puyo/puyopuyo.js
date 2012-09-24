// Puyo Puyo Flash by tkc productions, May 1999
//=============================================

// FS COMMAND HOOK FOR INTERNET EXPLORER
// -------------------------------------
  text  = '<SCRIPT LANGUAGE=VBScript\> \n';
  text += 'on error resume next \n';
  text += 'Sub puyopuyo_FSCommand(ByVal command, ByVal args)\n';
  text += '  call puyopuyo_DoFSCommand(command, args)\n';
  text += 'end sub\n';
  text += '</SCRIPT\> \n';
  document.write(text);


// FS COMMAND HOOK FOR NETSCAPE
// ----------------------------
var InternetExplorer = navigator.appName.indexOf("Microsoft") != -1;

// GlOBALS
var nextyear = new Date();

var topcolor, nexttopcolor;
var bottomcolor, nextbottomcolor;
var nextp1color, nextp2color;
var nextnextp1color, nextnextp2color;

var topposx, topposy;
var botposx, botposy;
var prevtopposx, prevtopposy;
var prevbotposx, prevbotposy;

var PoofSetArray = new Array();     // this is used to keep track of all the puyos that are to
                                    // be 'poofed'
var PreDropArray = new Array();     // this is used to keep track of the locations of the puyos
                                    // prior to them falling; technically, this will be used to
                                    // remove elements from the PoofSetArray
var DropDownArray = new Array();    // this is used to keep track of the puyos that have been
                                    // dropped down due to a poof
var UpdateFlashArray = new Array(); // this is used to capture all the locations of the current
				    // the flash puyo

// orientation variable will define how the top and bottom puyos are configured to each
// other, where T=top and B=bottom:
//   1 - T     2 - BT     3 - B       4 - TB
//       B                    T
//  (default)
//
var orientation;
var desiredorientation;

// use flags to set puyo states for enabling user interactivity with move buttons
var canmove = false;
var movingdown = false; // this is set to true when the puyos are currently being shifted down
var movingleft = false; // this is set to true when the puyos are currently being shifted left
var movingright = false; // this is set to true when the puyos are currently being shifted right
var rotatecw = false; // this is set to true when the puyos are rotating clockwise
var rotateccw = false; // this is set to true when the puyos are rotating counterclockwise
var godownnow = false; // this is set to true when the puyos are to be dropped down immediately
var plopping = false; // this is set to true when the puyos are being drawn in
var poofed = false;  // this is set to true when there are puyos that have been poofed
var flashed = false;  // this is set to true when there are puyos that have been flashed
var greyflashed = false // this is set to true when a row of grey puyos has disappeared
var showpoofs = false; // this is set to true when the poofs need to be shown
var toplevel = false;  // this is set to true when the poofs have reached the top level of the board
var playedmaxdrop = false;  // this is set to true when the maxdrop animation has been played
var playedmaxmeter = false;  // this is set to true when the maxmeter animation has been played

// these are variables to control game penalties and bonuses
var bottomlevel = 13;
var poofchains = 0;
var donerising = false;
var chunklevel = 13;
var score = 0;
var highscore = 0;
var tempscore;
var scoreperpuyo = 25;
var scorebonus = 10;
var maxnumofturns = 30;  // this controls when the dropspeeds and meterspeeds will be updated

// these are options set by the user on the main screen
var dropspeed = 'med';   // can be 'min', 'med', or 'max'
var meterspeed = 'med';  // can be 'min', 'med', or 'max'
var flashonoff = 'on';   // can be 'on', or 'off'
var music = 'off';       // can be 'techno', 'jazzy', 'orchestral', 'happypop', or 'off'
var preset = 'puyoprofessional'  // can be 'puyopuyomaniac', 'puyoprofessional', 'puyopeddler', or 'custom'

// these are variables that coincide with the options set by the user:
// the number of times the timeline loops before something happens is initially set by the
// user and gradually changes as the number of turns go by

// these are treated like constants:
var cookiepath = "/puyopuyoflash";
var cookiedomain = "www.cruddog.com";
var maxdropspeed = 1;
var meddropspeed = 6;
var mindropspeed = 12;
var maxmeterspeed = 5;
var medmeterspeed = 3;
var minmeterspeed = 1;

var turncount = 0;                           // a counter for the number of turns that have happened

// for the dropspeed option
var dropspeedtimerloopcount = meddropspeed;  // the number of times the timer loops before dropping a set of puyos
                                             // 1 = max (1/12 of a sec), 6 = med (6/12 of a sec), 12 = min (1 sec)
var dropspeedcounter = 0;                    // the counter for the number of times the timer has looped

// for the meterspeed option
var currentmeterspeed = medmeterspeed;           // the current speed of the rise of the meter
var currentriser = "riser" + currentmeterspeed;  // to define the current riser being used

// to keep track of the biggest combo count
var combocount = 0;

// *******************************************************************************************************

// this checks for input from the keyboard
document.onkeydown = keyDown;



function LevelUp () {
// this function checks to see whether or not to speed up the drop and if so, then speeds it up
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  
  // increment the turn counter
  turncount++;
  // if hit the max number of turns then raise the speed up
  if (turncount == maxnumofturns) {
    //reset the turn counter
    turncount = 0;
    // check to make sure speed isn't already at max; if not then increment it
    if (dropspeedtimerloopcount != maxdropspeed || currentmeterspeed != maxmeterspeed) {
      if (dropspeedtimerloopcount != maxdropspeed) dropspeedtimerloopcount--;
      
      // stop the meter from moving
      puyopuyoObj.TStopPlay("_level0/riserfills/riser");
      
      if (currentmeterspeed != maxmeterspeed) {
      	currentmeterspeed++;
        currentriser = "riser" + currentmeterspeed;
      }
      if (dropspeedtimerloopcount == maxdropspeed && playedmaxdrop == false) {
      	playedmaxdrop = true;
        puyopuyoObj.TPlay("_level0/levelup/maxsplash");
      }
      if (currentmeterspeed == maxmeterspeed && playedmaxmeter == false) {
      	playedmaxmeter = true;
      	puyopuyoObj.TPlay("_level0/levelup/maxsplash2");
      }
      puyopuyoObj.TPlay("_level0/speedup");
      puyopuyoObj.TPlay("_level0/levelup");
    }
    else {
      puyopuyoObj.TGotoLabel ("_level0", "begin");
      puyopuyoObj.TPlay("_level0");	
    }
  }
  else {
    puyopuyoObj.TGotoLabel ("_level0", "begin");
    puyopuyoObj.TPlay("_level0");
  }
}

function FinishLevelUp () {
// this function is the 2nd half of the LevelUp function
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  
  // update the display of the meter value on the game board
  Define2Digits (currentmeterspeed, 'metersettings');
    
  // turn on the rising of the meter again
  puyopuyoObj.TGotoLabel("_level0/riserfills", currentriser);
  puyopuyoObj.TGotoLabel("_level0/riserfills/riser", "rise");
  puyopuyoObj.TPlay("_level0/riserfills/riser");

  // update the display of the dropspeed value on the game board
  Define2Digits (Math.abs(dropspeedtimerloopcount - (mindropspeed + 1)), 'dropsettings');

  puyopuyoObj.TGotoLabel ("_level0", "begin");
  puyopuyoObj.TPlay("_level0");
}

function LoadOptions () {
// this function loads the options into the options screen when the user goes into the options screen
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  //set dropspeed
  puyopuyoObj.TGotoLabel("_level0/dropspeed", dropspeed);
  //set meterspeed
  puyopuyoObj.TGotoLabel("_level0/meterspeed", meterspeed);
  //set flashonoff
  puyopuyoObj.TGotoLabel("_level0/flashpuyo", flashonoff);
  //set music
  puyopuyoObj.TGotoLabel("_level0/musicopt", music);
  AdjustPreset();

  // retrieve the high score from the cookie
  
  highscore = 0;
  var allcookies = document.cookie;
  var hspos = allcookies.indexOf("highscore=");
  
  if (hspos != -1) {
    var hsstart = hspos + 10;
    var hsend = allcookies.indexOf(";", hsstart);
    if (hsend == -1) hsend = allcookies.length;
    var hsvalue = allcookies.substring(hsstart, hsend);
    hsvalue = unescape(hsvalue);
    highscore = hsvalue;  
  }
  
  // enable high score reset button if high score is not zero
  if (highscore != 0) puyopuyoObj.TGotoLabel("_level0/hsreset", "on");

}

function Define2Digits (setvalue, setting) {
// this function sets the value of either the dropspeed or the meterspeed as given by the 'setting'
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var setvaluestring, stringdigit, dnum, i;
  var levelused;

  if (setvalue < 10) setvaluestring = "0" + setvalue;
  else setvaluestring = "" + setvalue;

  switch (setting + "") {
    case "dropsettings":
      levelused = "_level1/"
      break;
    case "metersettings":
      levelused = "_level1/"
      break;
    default:
      levelused = "_level0/"
      break;
  }

  dnum = 1;
  for (i = setvaluestring.length; i > 0; i--) {
    stringdigit = setvaluestring.substr((i-1), 1) - 0;
    puyopuyoObj.TGotoFrame (levelused + setting + "/d" + dnum, stringdigit);
    dnum++;
  }
}

function ShowSettings () {
// this function sets all the variables that show the user settings on the bottom of the screen
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;

  ResetOptions();

  // set the dropspeed display
  Define2Digits (Math.abs(dropspeedtimerloopcount - (mindropspeed + 1)), 'dropsettings');

  // set the meterspeed display
  Define2Digits (currentmeterspeed, 'metersettings');

  // set the flash puyo display
  puyopuyoObj.TGotoLabel ('_level1/fponoff', flashonoff); 

  // set the music display
  puyopuyoObj.TGotoLabel ('_level1/musicstyle', music);
}

function ResetOptions() {
// this function converts some of the options to a format legible to this program
  // reset dropspeed
  switch (dropspeed + '') {
    case 'min':
      dropspeedtimerloopcount = mindropspeed;
    break;
    case 'med':
      dropspeedtimerloopcount = meddropspeed;
    break;
    case 'max':
      dropspeedtimerloopcount = maxdropspeed;
    break;
  }
  
  // reset meterspeed
  switch (meterspeed + '') {
    case 'min':
      currentmeterspeed = minmeterspeed;
    break;
    case 'med':
      currentmeterspeed = medmeterspeed;
    break;
    case 'max':
      currentmeterspeed = maxmeterspeed;
    break;
  }
  currentriser = "riser" + currentmeterspeed;
}

function LeaveOptions() {
// this function saves the options from the options screen that the user has set
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;

  //get dropspeed
  dropspeed = puyopuyoObj.TCurrentLabel("_level0/dropspeed");
  //get meterspeed
  meterspeed = puyopuyoObj.TCurrentLabel("_level0/meterspeed");
  //get flashonoff
  flashonoff = puyopuyoObj.TCurrentLabel("_level0/flashpuyo");
  //get music
  music = puyopuyoObj.TCurrentLabel("_level0/musicopt");
  //get preset
  switch (puyopuyoObj.TCurrentLabel("_level0/presetarrows")) {
    case "pmaniac":
      preset = "puyopuyomaniac";
    break;
    case "ppro":
      preset = "puyoprofessional";
    break;
    case "ppeddler":
      preset = "puyopeddler";
    break;
    case "custom":
      preset = "custom";
    break;
  }

  // turn off music
  // PlayMusic ("off");
  
  // load the puyo theme music again
  // puyopuyoObj.TStopPlay("_level2");
  // puyopuyoObj.TGotoLabel("_level2", "playmusic");
  // puyopuyoObj.TPlay("_level2");
  
  //continue with exiting the game options screen
  puyopuyoObj.TPlay("_level0");
}

function PlayMusic (onoff) {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;

  if (music != "off") {
    if ((onoff + "") == "on") {
      puyopuyoObj.TGotoLabel("_level3", "playmusic");
      puyopuyoObj.TPlay("_level3");
    }
    else puyopuyoObj.TGotoLabel("_level3", "stopmusic");
  }
}

function SetPuyoScore (addedvalue) {
// this function updates the scoreboard
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var scorestring;
  var i, dnum;
  var stringdigit;

  score = score + (addedvalue - 0);

  // restrict the score
  if (score > 999999999) score = 999999999;
  if (score == 0) scorestring = "000000000";
  else scorestring = "" + score;
  dnum = 1;
  for (i = scorestring.length; i > 0; i--) {
    stringdigit = scorestring.substr((i-1), 1) - 0;
    puyopuyoObj.TGotoFrame ("_level0/score/d" + dnum, stringdigit);
    dnum++;
  }
  SetHighScore();
}

function LoadHighScore() {
// this function loads the high score according to a cookie then calls the function
// SetHighScore to write it to the screen
  var allcookies = document.cookie;
  var hspos = allcookies.indexOf("highscore=");
  
  if (hspos != -1) {
    var hsstart = hspos + 10;
    var hsend = allcookies.indexOf(";", hsstart);
    if (hsend == -1) hsend = allcookies.length;
    var hsvalue = allcookies.substring(hsstart, hsend);
    hsvalue = unescape(hsvalue);
    highscore = hsvalue;
    SetHighScore();
  }
}

function ResetHighScore() {
// this function immediately expires the cookie and sets the highscore to be zero
  var today = new Date();
  var expireddate = new Date(today.getTime() - 1);
  document.cookie = "highscore=" + 0 + "; expires=" + expireddate.toGMTString() + "; path=" + cookiepath + "; domain= " + cookiedomain;
  highscore = 0;
}

// *****************************************************************************************
// initialize the gameboard
// the variable color can be any of the following: 'red', 'orange', 'green', 'blue', 
// 'purple', 'poof', or 'blank'
function FillGameboard (color) {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var row;
  var column;

  for (row = 13; row > 0; row--) {
    for (column = 1; column < 7; column++) {
      // blank out the puyos
      puyopuyoObj.TGotoLabel("_level0/p" + row + column, color);
      // blank out the row links
      if (column != 6) {
        puyopuyoObj.TGotoLabel("_level0/r" + row + column + (column + 1), color);
      }
      // blank out the column links
      if (row != 0) {
        puyopuyoObj.TGotoLabel("_level0/c" + column + (row - 1) + row, color);
      }    
    }
  }
}

function FillRow (color, row) {
// use this function to fill up one entire row with a given color
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var i;

  for (i = 1; i < 7; i++) {
    puyopuyoObj.TGotoLabel("_level0/p" + row + i, color);
  }
}


function PushUp (row) {
// this function pushes everything up one row
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var rowindex, colindex, arrayindex;
  var TmpPuyoNewLocations = new Array();
  var currentpuyo, nextpuyo;
  var currentcolor, nextcolor;
  var boardempty = true;
  var x, y, PoofSetElement;

  row = row - 0;
  for (colindex = 1; colindex < 7; colindex++) {
    newcolumnloop:
    for (rowindex = row; rowindex > 1; rowindex--) {
      // for each puyo in the current column, copy the puyo in the destination location to a temp variable, 
      // and then move the bottom puyo up one
      currentpuyo = "p" + rowindex + colindex;
      if (rowindex == row) {
        currentcolor = puyopuyoObj.TCurrentLabel ("_level0/" + currentpuyo);
      }
      // if the current puyo is blank then obviously there is no other puyos above it so do not continue,
      // otherwise continue to move puyos up one
      if (currentcolor != 'blank') {
        nextpuyo = "p" + (rowindex - 1) + colindex;
        nextcolor = puyopuyoObj.TCurrentLabel ("_level0/" + nextpuyo);
        puyopuyoObj.TGotoLabel ("_level0/" + nextpuyo, currentcolor);
        // clear any left links connected to it
        if (colindex != 1) {
          puyopuyoObj.TGotoLabel ("_level0/r" + rowindex + (colindex - 1) + colindex, "blank");
        }
        // clear any right links connected to it
        if (colindex != 6) {
          puyopuyoObj.TGotoLabel ("_level0/r" + rowindex + colindex + (colindex + 1), "blank");
        }
        // clear any bottom links connected to it
        if (rowindex != 13) {
          puyopuyoObj.TGotoLabel ("_level0/c" + colindex + rowindex + (rowindex + 1), "blank");
        }
        currentcolor = nextcolor;
        // set a flag to indicate the board is not empty
        boardempty = false;
        // update the array that stores the puyos in the new locations
        if ((rowindex - 1) != 1) {
          TmpPuyoNewLocations[TmpPuyoNewLocations.length] = nextpuyo;
        }
      }
      // this exits the for loop because we don't want to be checking the rest of the rows if there is no
      // more puyos above the current puyo to move
      else break newcolumnloop;
    }
  }
  // now fill in the row specified by 'row' with chunks
  FillRow ("chunk", row);
  puyopuyoObj.TPlay("_level0/greyup");
  // if the board wasn't empty, it means there was some movement, so now we have to redo the PoofSetArray
  // with all the puyos that have been moved i.e. empty the PoofSetArray and do it over again using the
  // contents of the array that stored the puyos in the new locations
  if (!boardempty) {
    // now empty the array that keeps track of the old poof sets
    PoofSetArray.length = 0;
    // next re-sort the set of puyos before connecting them
    TmpPuyoNewLocations.sort(PuyoSort);
    // now reconnect all moved puyos
    for (arrayindex = 0; arrayindex < TmpPuyoNewLocations.length; arrayindex++) {
      PoofSetElement = TmpPuyoNewLocations[arrayindex];
      x = PoofSetElement.substr(1, PoofSetElement.length - 2) - 0;
      y = PoofSetElement.charAt(PoofSetElement.length - 1) - 0;
      nextcolor = puyopuyoObj.TCurrentLabel("_level0/" + PoofSetElement);
      ConnectPuyo(x, y, nextcolor);
    }
  }
}

function AdjustPreset () {
// this function adjusts the presets to match the options
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var tempdropspeed, tempmeterspeed, tempflashonoff;
  var presetvalue;

  //get dropspeed
  tempdropspeed = puyopuyoObj.TCurrentLabel("_level0/dropspeed");
  //get meterspeed
  tempmeterspeed = puyopuyoObj.TCurrentLabel("_level0/meterspeed");
  //get flashonoff
  tempflashonoff = puyopuyoObj.TCurrentLabel("_level0/flashpuyo");

  if (tempdropspeed == 'max' && tempmeterspeed == 'max' && tempflashonoff == 'off') {
    puyopuyoObj.TGotoLabel("_level0/presetarrows", "pmaniac");
  }
  else if (tempdropspeed == 'med' && tempmeterspeed == 'med' && tempflashonoff == 'on') {
    puyopuyoObj.TGotoLabel("_level0/presetarrows", "ppro");
  }
  else if (tempdropspeed == 'min' && tempmeterspeed == 'min' && tempflashonoff == 'on') {
    puyopuyoObj.TGotoLabel("_level0/presetarrows", "ppeddler");
  }
  else puyopuyoObj.TGotoLabel("_level0/presetarrows", "custom");
}

function AdjustOptions(args) {
// this function sets the options to match the presets
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  
  //set dropspeed
  switch ((args + "").charAt(0)) {
    case "1":
      dropspeed = "min"
    break;
    case "2":
      dropspeed = "med"
    break;
    case "3":
      dropspeed = "max"
    break;
  }
  switch ((args + "").charAt(1)) {
    case "1":
      meterspeed = "min"
    break;
    case "2":
      meterspeed = "med"
    break;
    case "3":
      meterspeed = "max"
    break;
  }
  switch ((args + "").charAt(2)) {
    case "1":
      flashonoff = "on"
    break;
    case "2":
      flashonoff = "off"
    break;
  }

  puyopuyoObj.TGotoLabel("_level0/dropspeed", dropspeed);
  puyopuyoObj.TGotoLabel("_level0/meterspeed", meterspeed);
  puyopuyoObj.TGotoLabel("_level0/flashpuyo", flashonoff);
  AdjustPreset();
}

// Handle all the the FSCommand messages in a FutureSplash movie
function puyopuyo_DoFSCommand(command, args) {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;


  if (command == 'adjustpreset') {
    AdjustPreset();
  }
  if (command == 'loadsettings') {
    ShowSettings ();
  }
  if (command == 'adjustoptions') {
    AdjustOptions(args);
  }
  if (command == 'getgamepiece') {
    GetGamePiece();
  }
  if (command == 'play') {
    puyopuyoObj.TPlay("_level0/startsound")
    puyopuyoObj.TPlay("_level0");
  }
  if (command == 'playmusic') {
    PlayMusic (args);
  }
  if (command == 'initgame') {
    InitGame();
  }
  if (command == 'dropstart') {
    NewDrop();
  }
  if (command == 'chkcount') {
    CheckDropCount();
  }
  if (command == 'movedown') {
    MoveDown();
  }
  if (command == 'moveleft') {
    MoveLeft();
  }
  if (command == 'moveright') {
    MoveRight();
  }
  if (command == 'rotateclockwise') {
    RotateClockWise();
  }
  if (command == 'rotatecounterclockwise') {
    RotateCounterClockWise();
  }
  if (command == 'downnow') {
    DownNow();
  }
  if (command == 'donepoofs') {
    PreNewGamePiece2();
  }
  if (command == 'donerise') {
    puyopuyoObj.TStopPlay("_level0/riserfills/riser");
    donerising = true;
    puyopuyoObj.TPlay("_level0/meterfullsound");
  }
  if (command == 'updatehighscore') {
    SetHighScore();
  }
  if (command == 'loadoptions') {
    LoadOptions();
  }
  if (command == 'leaveoptions') {
    LeaveOptions();
  }
  if (command == 'finishlevelup') {
    FinishLevelUp();
  }
  if (command == 'resethighscore') {
    ResetHighScore();
  }
}


function CheckDropCount() {
// this function checks to see if the current set of puyos should drop down a notch according to the
// speed of the drop as determined by the user from the options screen
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  
  if (!movingdown) {
    // increment the counter
    if (dropspeedcounter != dropspeedtimerloopcount) dropspeedcounter++;
    // see if the counter has reached the current limit of the loop counts
    // if yes, then reinit the counter and make the puyos move down one
    if (dropspeedcounter == dropspeedtimerloopcount) {
      // reinit the counter
      dropspeedcounter = 0;
      // move the puyos down     
      MoveDown();
    }
  }
}

function keyDown(e) {
  // this controls the keyboard control of the puyos
  var keycode = InternetExplorer ? window.event.keyCode : e.which;
  var realkey = InternetExplorer ? String.fromCharCode(window.event.keyCode) : String.fromCharCode(e.which);
  
  // the following code converts the number pad keystrokes to numbers; this code is only needed for IE
  // because IE interprets the number pad as different keycodes than numbers
  if (InternetExplorer) {
    switch (keycode) {
      case 100: // numpad 4
        realkey = '4'
      break;
      case 102: // numpad 6
        realkey = '6'
      break;
      case 101: // numpad 5
        realkey = '5'
      break;
      case 104: // numpad 8
        realkey = '8'
      break;
      case 96:  // numpad 0
        realkey = '0'
      break;
    }
  }
  if (canmove) {
    switch (realkey.toUpperCase()) {
      // for the leftys
      case 'A': // 'left'
        MoveLeft();
        break;
      case 'D': // 'right'
        MoveRight();
        break;
      case 'W': // 'rotate'
        RotateCounterClockWise();
        break;
      case 'S': // 'rotate'
        RotateClockWise();
        break;
      case ' ': // 'fall down'
        DownNow();
        break;
      // for the rightys
      case '4': // 'left'
        MoveLeft();
        break;
      case '6': // 'right'
        MoveRight();
        break;
      case '8': // 'rotate'
        RotateCounterClockWise();
        break;
      case '5': // 'rotate'
        RotateClockWise();
        break;
      case '0': // 'fall down'
        DownNow();
        break;
    }
  }
}


function SetHighScore() {
  // this function updates the high score
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var scorestring;
  var i, dnum;
  var stringdigit;

  // set the new high score if there is one
  if (score > highscore) highscore = score;

  // fix the scorestring to be all 0's if the highscore is 0
  if (highscore == 0) scorestring = "000000000";
  else scorestring = "" + highscore;
  
  dnum = 1;
  for (i = scorestring.length; i > 0; i--) {
    stringdigit = scorestring.substr((i-1), 1) - 0;
    puyopuyoObj.TGotoFrame ("_level0/highscore/d" + dnum, stringdigit);
    dnum++;
  }   
}

function DoneRise() {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  PushUp (chunklevel);
  chunklevel--;
}

function InitGame() {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;

  FillGameboard ('blank');
  score = 0;
  turncount = 0; 
  SetPuyoScore (score);
  // the following function loads the high score from a cookie
  LoadHighScore();
  ShowSettings ();
  puyopuyoObj.TGotoLabel("_level0/preset", preset);
  donerising = false;  
  puyopuyoObj.TGotoLabel("_level0/riserfills", currentriser);
  puyopuyoObj.TGotoLabel("_level0/riserfills/riser", "rise");
  chunklevel = 13;
  bottomlevel = 13;
  poofchains = 0;
  combocount = 0;
  Define2Digits (combocount, "combocount");
  toplevel = false;
  PoofSetArray.length = 0; 
  PreDropArray.length = 0;
  DropDownArray.length = 0;
  UpdateFlashArray.length = 0;
  canmove = false;
  movingdown = false; // this is set to true when the puyos are currently being shifted down
  movingleft = false; // this is set to true when the puyos are currently being shifted left
  movingright = false; // this is set to true when the puyos are currently being shifted right
  rotatecw = false; // this is set to true when the puyos are rotating clockwise
  rotateccw = false; // this is set to true when the puyos are rotating counterclockwise
  godownnow = false; // this is set to true when the puyos are to be dropped down immediately
  plopping = false; // this is set to true when the puyos are being drawn in
  poofed = false;  // this is set to true when there are puyos that have been being poofed
  flashed = false;  // this is set to true when there are puyos that have been flashed
  greyflashed = false // this is set to true when a row of grey puyos has disappeared
  showpoofs = false; // this is set to true when the poofs need to be shown
  toplevel = false;  // this is set to true when the poofs have reached the top level of the board
  if (dropspeedtimerloopcount == maxdropspeed) playedmaxdrop = true;
  else playedmaxdrop = false;  // this is set to true when the maxdrop animation has been played
  if (currentmeterspeed == maxmeterspeed) playedmaxmeter = true;
  else playedmaxmeter = false;  // this is set to true when the maxmeter animation has been played

  GetGamePiece('p1');
  GetGamePiece('p2');
  GetGamePiece('nextp1');
  GetGamePiece('nextp2');
  GetGamePiece('nextnextp1');
  GetGamePiece('nextnextp2');
  nexttopcolor = puyopuyoObj.TCurrentLabel("_level0/gp/p1");
  nextbottomcolor = puyopuyoObj.TCurrentLabel("_level0/gp/p2");
  nextp1color = puyopuyoObj.TCurrentLabel("_level0/gp/nextp1");
  nextp2color = puyopuyoObj.TCurrentLabel("_level0/gp/nextp2");
  nextnextp1color = puyopuyoObj.TCurrentLabel("_level0/gp/nextnextp1");
  nextnextp2color = puyopuyoObj.TCurrentLabel("_level0/gp/nextnextp2");
  puyopuyoObj.TPlay("_level0");
}

function UpdatePoofSetArray(oldpuyo, newpuyo, puyolink) {
// this function will attempt to seek out oldpuyo in the array of poof sets, and if not 
// found, then create a new poof set in the poof set array, storing both oldpuyo and newpuyo
// in the poof set, otherwise add the newpuyo to the poof set containing oldpuyo
  var located = false;
  var newlocated = false;
  var arrayindex, poofindex, arrayindex2, newpuyoindex;
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
doneloop:
  for (arrayindex = 0; arrayindex < PoofSetArray.length; arrayindex++) {
    // go thru all the poof sets in the poof set array to find oldpuyo
    for (poofindex = 0; poofindex < PoofSetArray[arrayindex].length; poofindex++) {
      // try and find a matching puyolink in the current poof set
      if (PoofSetArray[arrayindex][poofindex] == oldpuyo) {

        // set a flag to indicate we've found a match
        located = true;

        // update the poof set with the link
        PoofSetArray[arrayindex][PoofSetArray[arrayindex].length] = puyolink;

        // first have to chk to see if we are connecting to another established group, or a
        // single puyo -- if it is an established group, then have to copy all elements of
        // newpuyo's group into oldpuyo's group, otherwise add the newpuyo to the current poof set
chknewloop:
        for (arrayindex2 = 0; arrayindex2 < PoofSetArray.length; arrayindex2++) {
        // go thru all the poof sets in the poof set array to find newpuyo
          for (newpuyoindex = 0; newpuyoindex < PoofSetArray[arrayindex2].length; newpuyoindex++) {
            if (PoofSetArray[arrayindex2][newpuyoindex] == newpuyo) {
              // set the flag indicating we've found the newpuyo in a poof set to true
              newlocated = true;

              // at this point, it's been detected that the newpuyo already belongs to an
              // existing poof set -- if the newpuyo's poof set is not the same as the 
              // oldpuyo's poof set, then take the newpuyo's poof set and append it to the 
              // oldpuyo's poof set, then delete the newpuyo's poof set, in 3 steps:
              if (arrayindex2 != arrayindex) {
                // 1.  this step adds all the elements of newpuyo's poof set into oldpuyo's poof set
                PoofSetArray[arrayindex] = PoofSetArray[arrayindex].concat(PoofSetArray[arrayindex2]);
                // 2.  this step swaps the position of newpuyo's poof set with the last poof set in 
	          //     the PoofSetArray
                if (arrayindex2 != (PoofSetArray.length - 1)) {
                  PoofSetArray[arrayindex2] = PoofSetArray[PoofSetArray.length - 1];
                }
                // 3.  this step reduces PoofSetArray's length by 1, thereby deleting the last PoofSet, 
                //     which at this time, has been moved over to newpuyo's position
	          PoofSetArray.length--;
              }
              // break out of the for loop as we've already dealt with the newpuyo
              break chknewloop;
            }
          }
        }
        if (!newlocated) {
          PoofSetArray[arrayindex][PoofSetArray[arrayindex].length] = newpuyo;
        }
        // exit the for loop as we don't need to continue searching anymore since the
        // oldpuyo has been found in the curent poof set
        break doneloop;
      }
    }
  }

  if (!located) {
  // if we get to this point, then it means that this is a new match, so we have to add
  // both the oldpuyo and the newpuyo to the array
    PoofSetArray[PoofSetArray.length] = [oldpuyo, newpuyo, puyolink];
  }
}

function ConnectPuyo(row, column, xycolor) {
// this function adds all the colored links between one puyo, checking
// to the left, to the right, and below the given puyo
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var puyocolor;
  var lyes = false;
  var ryes = false;
  var byes = false;
  var leftconnected = (column != 1 && puyopuyoObj.TCurrentLabel("_level0/r" + row + (column - 1) + column) != 'blank');
  var rightconnected = (column != 6 && puyopuyoObj.TCurrentLabel("_level0/r" + row + column + (column + 1)) != 'blank');
  var bottomconnected = (row != 13 && puyopuyoObj.TCurrentLabel("_level0/c" + column + row + (row + 1)) != 'blank');

  var rowcount, colcount;
  
// had to use ("" + xycolor) so that the strings would be compared by value

// first make sure it's not a flash puyo, because if it is, then handle differently by updating the
// UpdateFlashArray

if (xycolor == 'flash') {
  // add the location of the flash puyo to UpdateFlashArray for blanking out later
    UpdateFlashArray[UpdateFlashArray.length] = 'p' + row + column;  
  // perform the following if the flash puyo touches the bottom layer
  if (row == chunklevel) {
    // if the bottom layer is the lowest layer, then the flash puyo has touched the ground of the game board;
    // in this case, reward the player with 500 points
    if (row == bottomlevel) {
      SetPuyoScore (500);
    }
    // otherwise the flash puyo is now touching a level of greys, so add the locations of the grey puyos
    // to the UpdateFlashArray for performing the removal of a row of greys later
    else {
      for (colcount = 1; colcount < 7; colcount++) {
      	UpdateFlashArray[UpdateFlashArray.length] = 'p' + (chunklevel + 1) + colcount;
      }
      // set the greyflashed flag to true to indicate a level of greys will disappear
      greyflashed = true;
    }
  }
  // here, the else means the flash puyo did not hit bottom, nor did it hit the greys i.e. it is currently
  // touching a color, so find out what the color is and update the UpdateFlashArray with all the puyos on
  // the board currently with that color
  else {
    // assign the color of the puyo that's beneath the flash puyo into "puyocolor"
    puyocolor = puyopuyoObj.TCurrentLabel("_level0/p" + (row + 1) + column);
    // go through each column and store the locations of the puyos matching the color of puyocolor into
    // UpdateFlashArray
    if (puyocolor != 'flash') {
      for (colcount = 1; colcount < 7; colcount++) {
        nextcolumn:
        // traverse each element of the column from bottom up
        for (rowcount = 13; rowcount > 0; rowcount--) {
          // now check to make sure that the current puyo isn't the flash puyo and that the current puyo's 
          // color matches that of puyocolor before adding it to the UpdateFlashArray
          if ('' + row + column != '' + rowcount + colcount && '' + puyopuyoObj.TCurrentLabel('_level0/p' + rowcount + colcount) == ('' + puyocolor)) {
            UpdateFlashArray[UpdateFlashArray.length] = 'p' + rowcount + colcount;
          }
        }  
      }
    } 
  }
}
else {
// else do the following steps establishing links between like-colored puyos:
  // chk below
  if (row != (chunklevel - 0)) {
    puyocolor = puyopuyoObj.TCurrentLabel("_level0/p" + (row + 1) + column);
    if (puyocolor == ("" + xycolor) && !bottomconnected) {
      puyopuyoObj.TGotoLabel("_level0/c" + column + row + (row + 1), xycolor);
      if (!(leftconnected || rightconnected)) {
        UpdatePoofSetArray('p' + (row + 1) + column, 'p' + row + column, 'c' + column + row + (row + 1));
      }
      else {
        UpdatePoofSetArray('p' + row + column, 'p' + (row + 1) + column, 'c' + column + row + (row + 1));
      }
      byes = true;
    }
  }

  // chk the left side
  if (column != 1) {
    puyocolor = puyopuyoObj.TCurrentLabel("_level0/p" + row + (column - 1));
    if (puyocolor == ("" + xycolor) && !leftconnected) {
      puyopuyoObj.TGotoLabel("_level0/r" + row + (column - 1) + column, xycolor);
      if (byes || bottomconnected) {
        UpdatePoofSetArray('p' + row + column, 'p' + row + (column - 1), 'r' + row + (column - 1) + column);
      }
      else {
        UpdatePoofSetArray('p' + row + (column - 1), 'p' + row + column, 'r' + row + (column - 1) + column);
      }
      lyes = true;
    }
  }
  // chk the right side
  if (column != 6) {
    puyocolor = puyopuyoObj.TCurrentLabel("_level0/p" + row + (column + 1));
    if (puyocolor == ("" + xycolor) && !rightconnected) {
      puyopuyoObj.TGotoLabel("_level0/r" + row + column + (column + 1), xycolor);
      if (lyes || byes || leftconnected || bottomconnected) {
        UpdatePoofSetArray('p' + row + column, 'p' + row + (column + 1), 'r' + row + column + (column + 1));
      }
      else {
// alert ("UpdatingPoofSetArray with: p" + row + (column + 1) + ", p" + row + column + ", r" + row + column + (column + 1));
        UpdatePoofSetArray('p' + row + (column + 1), 'p' + row + column, 'r' + row + column + (column + 1));
      }
      ryes = true;
    }
  }
}
}

function ConnectTwoPuyos() {
// this function takes each of the puyos that have fallen and checks each one
// to see if there's any similar colors surrounding each one 
  if (orientation == 1 || orientation == 2) {
    ConnectPuyo(botposx, botposy, bottomcolor);
    ConnectPuyo(topposx, topposy, topcolor);
  }
  else {
    ConnectPuyo(topposx, topposy, topcolor);
    ConnectPuyo(botposx, botposy, bottomcolor);
  }
}

function BlankLinks (arrayindex) {
// this function blanks out on the screen all the links of a given PoofSet from the PoofSetArray
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var puyoindex, puyoprefix;

  // for each element in the PoofSetArray, if it is a row or column link, then blank it out
  // on the screen
  for (puyoindex = 0; puyoindex < PoofSetArray[arrayindex].length; puyoindex++) {
    puyoprefix = PoofSetArray[arrayindex][puyoindex].charAt(0);
    if (puyoprefix == 'c' || puyoprefix == 'r') {
      puyopuyoObj.TGotoLabel ("_level0/" + PoofSetArray[arrayindex][puyoindex], "blank");
    }
  }
}

function FlashPuyos (color) {
// this function changes all the puyos affected by a flash puyo
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var flashindex, arrayindex, poofindex;

  if (color == 'flash') {
    flashed = (UpdateFlashArray.length > 0);  // initialize the flashed flag to false until there's some 
                                              // indication of flashing
    // if there are puyos to be flashed then the flashed flag is true
    if (flashed) {
      // make all puyos listed in the UpdateFlashArray appear flashhappy
      for (flashindex = 0; flashindex < UpdateFlashArray.length; flashindex++) {
        puyopuyoObj.TGotoLabel('_level0/' + UpdateFlashArray[flashindex], 'flashhappy');
      }
      // for each puyo in the UpdateFlashArray, see if it matches a puyo from a PoofSet in the 
      // PoofSetArray and if so, then remove the PoofSet containing this puyo from the PoofSetArray
      for (flashindex = 1; flashindex < UpdateFlashArray.length; flashindex++) {
      	nextflashpuyo:
        for (arrayindex = 0; arrayindex < PoofSetArray.length; arrayindex++) {
      	  for (poofindex = 0; poofindex < PoofSetArray[arrayindex].length; poofindex++) {
      	    if ((PoofSetArray[arrayindex][poofindex] + '') == (UpdateFlashArray[flashindex] + '')) {
              // blank out on the screen all the links contained in the current poofset
              BlankLinks (arrayindex);
      	      // remove from the poofsetarray the poofset containing the matching puyo
              PoofSetArray[arrayindex] = PoofSetArray[PoofSetArray.length - 1];
              PoofSetArray.length--;
      	      // go to the next puyo in the UpdateFlasharray
      	      break nextflashpuyo;
            }
      	  }
        }
      }
      puyopuyoObj.TPlay("_level0/yippee");
    }
  }
  // blank out the flash puyos as well, if requested to do so by the 'color' flag
  if (color == 'blank' && flashed) {
    for (poofindex = 0; poofindex < UpdateFlashArray.length; poofindex++) {
      puyopuyoObj.TGotoLabel('_level0/' + UpdateFlashArray[poofindex], 'blank');
    }
  }
}


function PoofPuyos (color) {
// this will make any matching puyos change to the color designated by the passed parameter color
// to perform the above task, this function scans through the PoofSetArray and for any Poof
// Set that is greater than 6 elements (4 puyos + 3 links > 6), it changes its respective puyos 
// to the color
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var arrayindex, poofindex;
  var addedscore = 0;

  if (color == 'poof') poofed = false;  // initialize the poofed flag to false until there's some 
                                        // indication of poofing
  for (arrayindex = 0; arrayindex < PoofSetArray.length; arrayindex++) {
    if (PoofSetArray[arrayindex].length > 6) {
      if (color == 'poof') {
        poofed = true;  // change the poofed flag to indicated poofing happening
        // calculate how much to add to the score
        addedscore = addedscore + ((scoreperpuyo * 4) + (scorebonus * ((PoofSetArray[arrayindex].length - 7)/2)));
      }
      for (poofindex = 0; poofindex < PoofSetArray[arrayindex].length; poofindex++) {
        puyopuyoObj.TGotoLabel('_level0/' + PoofSetArray[arrayindex][poofindex], color);
      } // end for poofindex
      // play poof sound
      if (color == 'poof') puyopuyoObj.TPlay("_level0/pop");
    } // end if
  } // end for arrayindex
  tempscore = addedscore;
} // end PoofPuyos

function DropPoofedPuyos () {
// this will drop down all the puyos that are above any puyos found in the PoofSetArray to be blank
// and then remove the Poof Set from the PoofSetArray
// * at this point, this function assumes that any PoofSet greater than 6 elements in length is
//   assumed to be blank, and thus can be removed from the PoofSetArray

  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var arrayindex, poofindex, dropdownindex;
  var x, y;
  var lowestrow;
  var abovecolor;
  var PoofSetElement;
  var pattern;
  var ypattern;
  var columnstring = "";

  // if there was a flash puyo, then include the set of puyos that was flashed as a poofset of min length 7
  // so it can drop down correctly  
  if (flashed) {
    // re-sort the UpdateFlashArray
      UpdateFlashArray.sort(PuyoSort);
    // make sure UpdateFlashArray is at least 7 elements long
    while (UpdateFlashArray.length < 7) {
      UpdateFlashArray[UpdateFlashArray.length] = " ";
    }
    // add the UpdateFlashArray as another element of PoofSetArray
    PoofSetArray[PoofSetArray.length] = [];
    for (arrayindex = 0; arrayindex < UpdateFlashArray.length; arrayindex++) {
      PoofSetArray[PoofSetArray.length - 1][arrayindex] = (UpdateFlashArray[arrayindex] + '');
    }
    // adjust the chunklevel indicator to show one level of greys has disappeared
    if (greyflashed) {
      chunklevel++;
    }
    // empty the FlashArray after blanking
    UpdateFlashArray.length = 0;
    // reset the flag that indicated that flashing had happened
    flashed = false;  
  }

  // add some sort routine here to sort the poofsets such that it's going from the lowest row
  // to the highest row
  //  << add sort routine here >>
  // first sort each element of the poofsetarray
  for (arrayindex = 0; arrayindex < PoofSetArray.length; arrayindex++) {
    PoofSetArray[arrayindex].sort (PuyoSort);
  }
  // next sort by each of the first elements of PoofSetArray to sort according to row from the lowest
  // to the highest
  PoofSetArray.sort (PoofSort);

  for (arrayindex = 0; arrayindex < PoofSetArray.length; arrayindex++) {
    if (PoofSetArray[arrayindex].length > 6) {
      columnstring = "";
      for (poofindex = 0; poofindex < PoofSetArray[arrayindex].length; poofindex++) {
        PoofSetElement = PoofSetArray[arrayindex][poofindex];
        if (PoofSetElement.charAt(0) == 'p') {
          x = PoofSetElement.substr(1, PoofSetElement.length - 2) - 0;
          y = PoofSetElement.charAt(PoofSetElement.length - 1) - 0;
          ypattern = new RegExp(y);

          // if the column has not yet been dropped down once by a previous poof puyo in the same column
          // then keep track of this column to be dropped, otherwise don't do the column again
          if (columnstring.search(ypattern) == -1) {
            columnstring = columnstring + y;
          }
          else x = 0; // setting x to be 0 will prevent the code below to execute

          // move the entire column above the poofed puyo down by 1
          while ((x - 1) > 0) {
            pattern = new RegExp("p" + (x - 1) + y);
            if (puyopuyoObj.TCurrentLabel("_level0/p" + (x - 1) + y) != "blank" && PreDropArray.join().search(pattern) == -1) {
              // save the info about what was moved before its going to be dropped
              PreDropArray[PreDropArray.length] = 'p' + (x - 1) + y;
  //            alert ("Added " + PreDropArray[PreDropArray.length - 1] + " to PreDropArray");
              // blank out any links that exist with the current puyo being dropped and save the
              // info about the links before the puyo is to be dropped
              // left link
              if (y != 1 && puyopuyoObj.TCurrentLabel("_level0/r" + (x - 1) + (y - 1) + y) != "blank") {
                PreDropArray[PreDropArray.length] = 'r' + (x - 1) + (y - 1) + y;
                puyopuyoObj.TGotoLabel("_level0/r" + (x - 1) + (y - 1) + y, "blank");
              }
              // right link
              if (y != 6 && puyopuyoObj.TCurrentLabel("_level0/r" + (x - 1) + y + (y + 1)) != "blank") {
                PreDropArray[PreDropArray.length] = 'r' + (x - 1) + y + (y + 1);
                puyopuyoObj.TGotoLabel("_level0/r" + (x - 1) + y + (y + 1), "blank");
              }
              // top link
              if ((x - 1) != 1 && puyopuyoObj.TCurrentLabel("_level0/c" + y + (x - 2) + (x - 1)) != "blank") {
                PreDropArray[PreDropArray.length] = 'c' + y + (x - 2) + (x - 1);
                puyopuyoObj.TGotoLabel("_level0/c" + y + (x - 2) + (x - 1), "blank");
              }
              // find the row that the above puyo can fall to
              lowestrow = x;
              while (lowestrow != (chunklevel - 0) && puyopuyoObj.TCurrentLabel("_level0/p" + (lowestrow + 1) + y) == "blank") {
                lowestrow++;
              }
//              alert ("the lowest row the puyo can fall to is " + lowestrow);
              // add the element to the DropDownArray
              DropDownArray[DropDownArray.length] = "p" + lowestrow + y;
//              alert ("added " + DropDownArray[DropDownArray.length - 1] + " to DropDownArray");
              // assign the color that the current puyo is supposed to change to
              abovecolor = puyopuyoObj.TCurrentLabel("_level0/p" + (x - 1) + y);
//              alert ("assigned abovecolor to be " + abovecolor);
              // blank out the original location of the puyo being dropped
              puyopuyoObj.TGotoLabel("_level0/p" + (x - 1) + y, "blank");
//              alert ("p" + (x - 1) + y + " was blanked out");
              // drop the puyo down
              puyopuyoObj.TGotoLabel("_level0/p" + lowestrow + y, abovecolor);
//              alert (abovecolor + " puyo dropped down to p" + lowestrow + y);
            }
            x--;
          }
        }
      }
    }
  }
//  alert("PreDropArray before removing poof sets from Poof Set Array: " + PreDropArray);
  // now remove the poof sets from the Poof Set Array that have been poofed
  for (arrayindex = 0; arrayindex < PoofSetArray.length; arrayindex++) {
    while ((PoofSetArray.length) != arrayindex && PoofSetArray[arrayindex].length > 6) {
      if (arrayindex != (PoofSetArray.length - 1)) {
        PoofSetArray[arrayindex] = PoofSetArray[PoofSetArray.length - 1];
      }
      PoofSetArray.length--;
    }
  }
  // resort the PreDropArray
  if (PreDropArray.length > 0) PreDropArray.sort(PuyoSort);
  // now must remove the elements from PoofSetArray that have since dropped down
  // i.e. remove all elements from PoofSetArray that belong to PreDropArray
  // then empty the PreDropArray
  for (dropdownindex = 0; dropdownindex < PreDropArray.length; dropdownindex++) {
    poofmatch:
    for (arrayindex = 0; arrayindex < PoofSetArray.length; arrayindex++) {
      for (poofindex = 0; poofindex < PoofSetArray[arrayindex].length; poofindex++) {
        if (PoofSetArray[arrayindex][poofindex] == PreDropArray[dropdownindex]) {
          PoofSetArray[arrayindex][poofindex] = PoofSetArray[arrayindex][PoofSetArray[arrayindex].length - 1];
          PoofSetArray[arrayindex].length--;
          if (PoofSetArray[arrayindex].length < 3) {
            PoofSetArray[arrayindex] = PoofSetArray[PoofSetArray.length - 1];
            PoofSetArray.length--;
          }
          break poofmatch;
        }
      }
    }
  }
  // clear the PreDropArray as we won't be using it anymore
  PreDropArray.length = 0;
  // the final step is to reconnect all puyos that have dropped down to the new
  // locations i.e. check the connections for each puyo in DropDownArray -- this
  // leads to a reupdate of the PoofSetArray with the new locations of the dropped
  // puyos
  DropDownArray.sort(PuyoSort);
  for (dropdownindex = 0; dropdownindex < DropDownArray.length; dropdownindex++) {
    PoofSetElement = DropDownArray[dropdownindex];
    x = PoofSetElement.substr(1, PoofSetElement.length - 2) - 0;
    y = PoofSetElement.charAt(PoofSetElement.length - 1) - 0;
    abovecolor = puyopuyoObj.TCurrentLabel("_level0/p" + x + y);
    if (abovecolor != "blank") {
      ConnectPuyo(x, y, abovecolor);
    }
  }
  // lastly, clear the DropDownArray
  DropDownArray.length = 0;

  // play the dropped sound if a row of greys had been eliminated
  if (greyflashed) puyopuyoObj.TPlay("_level0/plop");
  // reset the greyflashed flag
  greyflashed = false;
}

function PuyoSort (a, b) {
  var xa, xb, ya, yb;
  var str1, str2;
  var firststr1, firststr2;

  str1 = "" + a;
  str2 = "" + b;

// handle in case of empty value
  if (str1 == "" || str2 == "") {
         if (str1 == "" && str2 == "") { return  0;}
    else if (str2 == "")               { return -1;}
    else                               { return  1;}
  }

// handle in case of puyo value
  else if (str1.charAt(0) == "p" && str2.charAt(0) == "p") {
 
    xa = str1.substr(1, str1.length - 2) - 0;
    xb = str2.substr(1, str2.length - 2) - 0;
    ya = str1.charAt(str1.length - 1) - 0;
    yb = str2.charAt(str2.length - 1) - 0;

         if (xa > xb) { return -1;}
    else if (xa < xb) { return  1;}
    else if (ya > yb) { return  1;}
    else if (ya < yb) { return -1;}
    else              { return  0;}
  }

// handle for cases where one is not a puyo
  else {
    firststr1 = str1.charAt(0);
    firststr2 = str2.charAt(0);
  
         if (firststr1 == "p") { return -1;}
    else if (firststr2 == "p") { return  1;}
    else                       { return  0;}
  }
}

function PoofSort (a, b) {
  // this function expects a and b to be two arrays, where each of its first elements is a puyo value
  // this also assumes that the array elements have been sorted according to PuyoSort prior to this function

  var firsta = a[0] + "";
  var firstb = b[0] + "";
  var xa = firsta.substr(1, firsta.length - 2) - 0;
  var xb = firstb.substr(1, firstb.length - 2) - 0;
  
       if (xa > xb) { return -1;}
  else if (xa < xb) { return  1;}
  else              { return  0;}  
}

function PreNewGamePiece() {
// this function is run prior to NewGamePiece to check for any puyos
// that are to be connected and poofing that needs to be done
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;

  if (!showpoofs) {
    // this checks to see if there are any puyos of the same color adjacent to one another
    // and if so, then connect them with a similar color -- this also takes into account the flash puyos
      ConnectTwoPuyos();

    // this makes the respective puyos flash and the connecting puyos poof
      FlashPuyos('flash');
      PoofPuyos('poof');
  }

  // check the poofed flag to see if there was some poofing happening, and if so, then 
  // set a delay by calling the swf file to run a timer
  // 1) blank out the poofed puyos
  // 2) move the puyos down to fill in the spaces left behind by the blanked puyos
  // 3) perform any new connections that are needed
  // 4) poof any connected puyos that need poofing, and adjust the poofed flag
  // 5) loop back to step 1 if poofed flag is true

  if (poofed || flashed) {
    // set up a delay to show off the poofed and/or flashed puyos before they go blank
    stateSwitch('showpoofs', true);
    puyopuyoObj.TGotoLabel("_level0", "poof");
    // stop the riser from moving, then increment the poof counter
    puyopuyoObj.TStopPlay("_level0/riserfills/riser");
    poofchains++;
    puyopuyoObj.TPlay("_level0");
    // after the delay, the swf file will call PreNewGamePiece2()
  }
  else {
    stateSwitch('showpoofs', false);
    // check here to see if there's anything in row 1 of the board;
    // if so that means the top has been reached and the game is over
    ChkTopLevel();
    if (!toplevel) {
      NewGamePiece();
      // do another chk on the top level before continuing
      ChkTopLevel ();
      if (!toplevel) {
      	LevelUp();
      }
      else GameOverRoutine();
    }
    else GameOverRoutine();
  }
}

function PreNewGamePiece2() {
// this function is the 2nd half of the PreNewGamePiece function... it is split
// into two sections to accomodate the time delay for showing the poof graphics

// update the score before doing anything else
  tempscore = (tempscore * poofchains);
  SetPuyoScore (tempscore);

// step 1)
  if (flashed) FlashPuyos('blank');
  PoofPuyos('blank');
// step 2) and step 3)
  DropPoofedPuyos();
// step 4)
  PoofPuyos('poof');
// step 5)
  PreNewGamePiece();
}

function GameOverRoutine() {
// this function performs the final steps required for game over
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  
  puyopuyoObj.TStopPlay("_level0/riserfills/riser");
  PlayMusic("off");
  puyopuyoObj.TPlay("_level0/gameoversound");
  puyopuyoObj.TGotoLabel("_level0", "gameover");

  // save the high score in a cookie
  nextyear.setFullYear(nextyear.getFullYear() + 1);
  document.cookie = "highscore=" + highscore + "; expires=" + nextyear.toGMTString() + "; path=" + cookiepath + "; domain= " + cookiedomain;
}

function ChkTopLevel() {
// this checks to see if the top has been reached yet and returns true in toplevel if so
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var column;

  for (column = 1; column < 7; column++) {
    if (puyopuyoObj.TCurrentLabel ("_level0/p1" + column) != 'blank' || puyopuyoObj.TCurrentLabel ("_level0/p23") != 'blank') {
      toplevel = true;
    }
  }
}

function NewGamePiece() {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var currentriseramt = 0;
  
  puyopuyoObj.TGotoLabel("_level0", "begin");
  GetGamePiece('nextnextp1');
  GetGamePiece('nextnextp2');
  puyopuyoObj.TGotoLabel("_level0/gp/p1", nextp1color);
  puyopuyoObj.TGotoLabel("_level0/gp/p2", nextp2color);
  puyopuyoObj.TGotoLabel("_level0/gp/nextp1", nextnextp1color);
  puyopuyoObj.TGotoLabel("_level0/gp/nextp2", nextnextp2color);
  nexttopcolor = nextp1color;
  nextbottomcolor = nextp2color;
  nextp1color = nextnextp1color;
  nextp2color = nextnextp2color;
  nextnextp1color = puyopuyoObj.TCurrentLabel("_level0/gp/nextnextp1");
  nextnextp2color = puyopuyoObj.TCurrentLabel("_level0/gp/nextnextp2");
  if (poofchains > 0 && !donerising) {
    currentriseramt = puyopuyoObj.TCurrentFrame("_level0/riserfills/riser");
    switch (poofchains) {
      case 1:
        currentriseramt = currentriseramt - 40;
        if (currentriseramt < 1) puyopuyoObj.TGotoLabel("_level0/riserfills/riser", "rise");
        else puyopuyoObj.TGotoFrame("_level0/riserfills/riser", currentriseramt);
        break;
      case 2:
        currentriseramt = currentriseramt - 100;
        if (currentriseramt < 1) puyopuyoObj.TGotoLabel("_level0/riserfills/riser", "rise");
        else puyopuyoObj.TGotoFrame("_level0/riserfills/riser", currentriseramt);
        break;
      default:
        puyopuyoObj.TGotoLabel("_level0/riserfills/riser","rise");
        break;
    }
  }
  if (!donerising) {
    puyopuyoObj.TPlay("_level0/riserfills/riser");
  }
  else {
  // check here to see if the meter is full, and if so, then raise the levels up
    DoneRise();
    donerising = false;
  }
  // update combocount if a greater value exists
  if (poofchains > combocount) {
    combocount = poofchains;
    Define2Digits (combocount, "combocount");
  }
  // reinit poofchains
  poofchains = 0;
}

function NewDrop() {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;

  topcolor = nexttopcolor;
  bottomcolor = nextbottomcolor;
  orientation = 1;
  desiredorientation = 1;
  prevtopposx = 1;
  prevtopposy = 3;
  prevbotposx = 2;
  prevbotposy = 3;
  topposx = 1;
  topposy = 3;
  botposx = 2;
  botposy = 3;
  dropspeedcounter = 0;
  if (!donerising) {
    puyopuyoObj.TPlay("_level0/riserfills/riser");
  }
  stateSwitch ('plopping', true);
  Plop('down');
  stateSwitch('movingdown', false);
  puyopuyoObj.TGotoLabel("_level0", "timer start");
  puyopuyoObj.TPlay("_level0");
}


function GetGamePiece(piecename) {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var piece = 0;

  // create a random gamepiece by generating a random number and using that as
  // a random choice for selecting the color to appear
  piece = Math.round (Math.random() * 100);
  if (piece <= 20) {
    puyopuyoObj.TGotoLabel("_level0/gp/" + piecename, "red");
  }
  else if ((20 < piece) && (piece <= 39)) {
    puyopuyoObj.TGotoLabel("_level0/gp/" + piecename, "orange");
  }
  else if ((39 < piece) && (piece <= 59)) {
    puyopuyoObj.TGotoLabel("_level0/gp/" + piecename, "green");
  }
  else if ((59 < piece) && (piece <= 79)) {
    puyopuyoObj.TGotoLabel("_level0/gp/" + piecename, "blue");
  }
  else if ((79 < piece) && (piece <= 98)) {
    puyopuyoObj.TGotoLabel("_level0/gp/" + piecename, "purple");
  }
  else {
    if (flashonoff == "on") puyopuyoObj.TGotoLabel("_level0/gp/" + piecename, "flash");
    else puyopuyoObj.TGotoLabel("_level0/gp/" + piecename, "purple");
  }
}


function MoveLeft() {
  var movecheck = (!movingright && canmove && !movingleft && !movingdown && !rotatecw && !rotateccw && !godownnow && !plopping);
  var orientchk13 = ((orientation == 1 || orientation == 3) && prevbotposy != 1 && prevtopposy != 1);
  var orientchk2 = (orientation == 2 && prevbotposy != 1);
  var orientchk4 = (orientation == 4 && prevtopposy != 1);
  if (movecheck && (orientchk13 || orientchk2 || orientchk4)) {
    stateSwitch('movingleft', true);
    prevtopposx = topposx;
    prevtopposy = topposy;
    prevbotposx = botposx;
    prevbotposy = botposy;
    topposy = topposy - 1;
    botposy = botposy - 1;
    stateSwitch ('plopping', true);
    Plop('left');
    stateSwitch('movingleft', false);
  }
}

  
function MoveRight() {
  var movecheck = (!movingright && canmove && !movingleft && !movingdown && !rotatecw && !rotateccw && !godownnow && !plopping);
  var orientchk13 = ((orientation == 1 || orientation == 3) && prevbotposy != 6 && prevtopposy != 6);
  var orientchk2 = (orientation == 2 && prevtopposy != 6);
  var orientchk4 = (orientation == 4 && prevbotposy != 6);
  if (movecheck && (orientchk13 || orientchk2 || orientchk4)) {
    stateSwitch('movingright', true);
    prevtopposx = topposx;
    prevtopposy = topposy;
    prevbotposx = botposx;
    prevbotposy = botposy;
    topposy = topposy + 1;
    botposy = botposy + 1;
    stateSwitch ('plopping', true);
    Plop('right');
    stateSwitch('movingright', false);
  }
}


function MoveDown() {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var movecheck = (!movingdown && !movingleft && !movingright && !rotatecw && !rotateccw && !godownnow && !plopping);
  var orientchk24 = ((orientation == 2 || orientation == 4) && prevtopposx != (chunklevel - 0) && prevtopposy != (chunklevel - 0));
  var orientchk1 = (orientation == 1 && prevbotposx != (chunklevel - 0));
  var orientchk3 = (orientation == 3 && prevtopposx != (chunklevel - 0));
  if (movecheck && (orientchk24 || orientchk1 || orientchk3)) {
    stateSwitch('movingdown', true);
    prevtopposx = topposx;
    prevtopposy = topposy;
    prevbotposx = botposx;
    prevbotposy = botposy;
    topposx = topposx + 1;
    botposx = botposx + 1;
    stateSwitch ('plopping', true);
    Plop('down');
    stateSwitch('movingdown', false);

  }
  else if (movecheck) {
    stateSwitch('canmove', false);
    stateSwitch('movingdown', true);
    PreNewGamePiece();
    stateSwitch('movingdown', false);
  }
}


function DownNow() {
  var movecheck = (canmove && !godownnow && !movingleft && !movingright && !rotatecw && !rotateccw && !movingdown && !plopping);
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var topblocked, botblocked, targettop, targetbot;
  var currentop = '_level0/p' + prevtopposx + prevtopposy;
  var currenbot = '_level0/p' + prevbotposx + prevbotposy;

  topposx = topposx + 1;
  botposx = botposx + 1;
  targettop = '_level0/p' + topposx + topposy;
  targetbot = '_level0/p' + botposx + botposy;

  if (movecheck) {
    puyopuyoObj.TPlay("_level0/plop");
    stateSwitch('canmove', false);
    stateSwitch('godownnow', true);
    topblocked = (topposx > (chunklevel - 0) || puyopuyoObj.TCurrentLabel(targettop) != 'blank') ? true : false;
    botblocked = (botposx > (chunklevel - 0) || puyopuyoObj.TCurrentLabel(targetbot) != 'blank') ? true : false;

    switch (orientation) {
      case 1:
        // adjust the score for bonus points if pulled down early
        if (!botblocked) {
          if (botposx == 10 || botposx == 11 || botposx == 12) SetPuyoScore(1);
          else if (botposx == 7 || botposx == 8 || botposx == 9) SetPuyoScore(2);
          else if (botposx == 4 || botposx == 5 || botposx == 6) SetPuyoScore(3);
          else if (botposx < 4) SetPuyoScore(4);
        }
        // perform the drop down
        while (!botblocked) {
          botposx = botposx + 1;
          targetbot = '_level0/p' + botposx + botposy;
          botblocked = (botposx > (chunklevel - 0) || puyopuyoObj.TCurrentLabel(targetbot) != 'blank') ? true : false;
        }
        botposx = botposx - 1;
        topposx = botposx - 1;
        break;
      case 2:
        // adjust the score for bonus points if pulled down early
        if (!botblocked) {
          if (botposx == 10 || botposx == 11 || botposx == 12) SetPuyoScore(1);
          else if (botposx == 7 || botposx == 8 || botposx == 9) SetPuyoScore(2);
          else if (botposx == 4 || botposx == 5 || botposx == 6) SetPuyoScore(3);
          else if (botposx < 4) SetPuyoScore(4);
        }
        // perform the drop down
        while (!botblocked) {
          botposx = botposx + 1;
          targetbot = '_level0/p' + botposx + botposy;
          botblocked = (botposx > (chunklevel - 0) || puyopuyoObj.TCurrentLabel(targetbot) != 'blank') ? true : false;
        }
        botposx = botposx - 1;
        while (!topblocked) {
          topposx = topposx + 1;
          targettop = '_level0/p' + topposx + topposy;
          topblocked = (topposx > (chunklevel - 0) || puyopuyoObj.TCurrentLabel(targettop) != 'blank') ? true : false;
        }
        topposx = topposx - 1;
        break;
      case 3:
        // adjust the score for bonus points if pulled down early
        if (!topblocked) {
          if (topposx == 10 || topposx == 11 || topposx == 12) SetPuyoScore(1);
          else if (topposx == 7 || topposx == 8 || topposx == 9) SetPuyoScore(2);
          else if (topposx == 4 || topposx == 5 || topposx == 6) SetPuyoScore(3);
          else if (topposx < 4) SetPuyoScore(4);
        }
        // perform the drop down
        while (!topblocked) {
          topposx = topposx + 1;
          targettop = '_level0/p' + topposx + topposy;
          topblocked = (topposx > (chunklevel - 0) || puyopuyoObj.TCurrentLabel(targettop) != 'blank') ? true : false;
       }
        topposx = topposx - 1;
        botposx = topposx - 1;
        break;
      case 4:
        // adjust the score for bonus points if pulled down early
        if (!botblocked) {
          if (botposx == 10 || botposx == 11 || botposx == 12) SetPuyoScore(1);
          else if (botposx == 7 || botposx == 8 || botposx == 9) SetPuyoScore(2);
          else if (botposx == 4 || botposx == 5 || botposx == 6) SetPuyoScore(3);
          else if (botposx < 4) SetPuyoScore(4);
        }
        // perform the drop down      
        while (!botblocked) {
          botposx = botposx + 1;
          targetbot = '_level0/p' + botposx + botposy;
          botblocked = (botposx > (chunklevel - 0) || puyopuyoObj.TCurrentLabel(targetbot) != 'blank') ? true : false;
        }
        botposx = botposx - 1;
        while (!topblocked) {
          topposx = topposx + 1;
          targettop = '_level0/p' + topposx + topposy;
          topblocked = (topposx > (chunklevel - 0) || puyopuyoObj.TCurrentLabel(targettop) != 'blank') ? true : false;
        }
        topposx = topposx - 1;
        break;
    }
    targettop = '_level0/p' + topposx + topposy;
    targetbot = '_level0/p' + botposx + botposy;
    puyopuyoObj.TGotoLabel(currentop, 'blank');
    puyopuyoObj.TGotoLabel(currenbot, 'blank');  
    puyopuyoObj.TGotoLabel(targettop, topcolor);
    puyopuyoObj.TGotoLabel(targetbot, bottomcolor);
    PreNewGamePiece();
    stateSwitch('godownnow', false);
  }
}


function Plop(directionmoving) {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
  var currentop = '_level0/p' + prevtopposx + prevtopposy;
  var currenbot = '_level0/p' + prevbotposx + prevbotposy;
  var targettop = '_level0/p' + topposx + topposy;
  var targetbot = '_level0/p' + botposx + botposy;
  // test to see if the target space is occupied, given the orientation 
  // of the top and bottom puyos to each other
  switch (orientation) {
  case 1:
    if (directionmoving == 'rotate') {
      var topblocked = (puyopuyoObj.TCurrentLabel(targettop) != 'blank') ? true : false;    
    }
    else {
      var topblocked = false;
    }
    if (directionmoving != 'rotate') {
      var botblocked = (puyopuyoObj.TCurrentLabel(targetbot) != 'blank') ? true : false;
    }
    else {
      var botblocked = false;
    }
    break;
  case 2:
    if (directionmoving != 'left') {
      var topblocked = ((topposy != 0) && (puyopuyoObj.TCurrentLabel(targettop) != 'blank') && (targettop != currenbot)) ? true : false;
    }
    else {
      var topblocked = false;
    }
    if (directionmoving != 'rotate' && directionmoving != 'right') {
      var botblocked = ((botposy != 0) && (puyopuyoObj.TCurrentLabel(targetbot) != 'blank') && (targetbot != currentop)) ? true : false;
    }
    else {
      var botblocked = false;
    }
    break;
  case 3:
    var topblocked = (puyopuyoObj.TCurrentLabel(targettop) != 'blank') ? true : false;
    var botblocked = false;
    break;
  case 4:
    if (directionmoving != 'right') {
      var topblocked = ((topposy != 0) && (puyopuyoObj.TCurrentLabel(targettop) != 'blank') && (targettop != currenbot)) ? true : false;
    }
    else {
      var topblocked = false;
    }
    if (directionmoving != 'rotate' && directionmoving != 'left') {
      var botblocked = ((botposy != 0) && (puyopuyoObj.TCurrentLabel(targetbot) != 'blank') && (targetbot != currentop)) ? true : false;
    }
    else {
      var botblocked = false;
    }
    break;
  }

  // when both target areas are unblocked, then erase its current position
  // and draw it in its new position and reconfigure the orientation if required
  if (!topblocked && !botblocked) {
    puyopuyoObj.TGotoLabel(currentop, 'blank');
    puyopuyoObj.TGotoLabel(currenbot, 'blank');  
    puyopuyoObj.TGotoLabel(targettop, topcolor);
    puyopuyoObj.TGotoLabel(targetbot, bottomcolor);
  // update previous positions to current positions
    if (directionmoving == 'rotate') {
      orientation = desiredorientation;
    }
    prevtopposx = topposx;
    prevtopposy = topposy;
    prevbotposx = botposx;
    prevbotposy = botposy;
    stateSwitch('canmove', true);
  }
  // when either target area is blocked, then chk to see which one is blocked, and for the
  // one that isn't blocked, drop it down the screen until it hits either the bottom of the
  // play field or another puyo
  // then leave the puyos where they currently are and readjust the target positions to 
  // their original values for each puyo that hasn't dropped
  else if (topblocked || botblocked) {
    if (!topblocked && directionmoving == 'down' && (orientation == 2 || orientation == 4)) {
      while (!topblocked) {
        topposx = topposx + 1;
        targettop = '_level0/p' + topposx + topposy;
        topblocked = (topposx > (chunklevel - 0) || puyopuyoObj.TCurrentLabel(targettop) != 'blank') ? true : false;
      }
      topposx = topposx - 1;
      targettop = '_level0/p' + topposx + topposy;
      puyopuyoObj.TGotoLabel(currentop, 'blank');
      puyopuyoObj.TGotoLabel(targettop, topcolor);
    }
    else {
      topposx = prevtopposx;
      topposy = prevtopposy;
    }
    if (!botblocked && directionmoving == 'down' && (orientation == 2 || orientation == 4)) {
      while (!botblocked) {
        botposx = botposx + 1;
        targetbot = '_level0/p' + botposx + botposy;
        botblocked = (botposx > (chunklevel - 0) || puyopuyoObj.TCurrentLabel(targetbot) != 'blank') ? true : false;
      }
      botposx = botposx - 1;
      targetbot = '_level0/p' + botposx + botposy;
      puyopuyoObj.TGotoLabel(currenbot, 'blank');
      puyopuyoObj.TGotoLabel(targetbot, bottomcolor);
    }
    else {
      botposx = prevbotposx;
      botposy = prevbotposy;
    }
    if (directionmoving == 'rotate') {
      desiredorientation = orientation;
    }
    if (directionmoving == 'down') {
      stateSwitch('canmove', false);
      PreNewGamePiece();
    }
  }
  stateSwitch ('plopping', false);
}

function RotateClockWise() {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
// the bottom puyo stays put and the top puyo rotates clockwise around the bottom puyo
  if (canmove && !movingleft && !movingdown && !movingright && !rotatecw && !rotateccw && !godownnow && !plopping) {
    stateSwitch('rotatecw', true);
    puyopuyoObj.TPlay("_level0/rotate");
    prevtopposx = topposx;
    prevtopposy = topposy;
    prevbotposx = botposx;
    prevbotposy = botposy;

    // T --> BT
    // B
    if (prevtopposx == (prevbotposx - 1)) {
      topposx = botposx;
      topposy = botposy + 1;
      desiredorientation = 2;
      stateSwitch ('plopping', true);
      Plop('rotate');
    }

    // BT --> B
    //        T
    else if (prevtopposy == (prevbotposy + 1)) {
      topposx = botposx + 1;
      topposy = botposy;
      desiredorientation = 3;
      stateSwitch ('plopping', true);
      Plop('rotate');
    }

    // B --> TB
    // T
    else if ((prevtopposx == (prevbotposx + 1)) && prevtopposy != 1) {
      topposx = botposx;
      topposy = botposy - 1;
      desiredorientation = 4;
      stateSwitch ('plopping', true);
      Plop('rotate');
    }

    // TB --> T
    //        B
    else if (prevtopposy == (prevbotposy - 1)) {
      topposx = botposx - 1;
      topposy = botposy;
      desiredorientation = 1;
      stateSwitch ('plopping', true);
      Plop('rotate');
    }
    stateSwitch('rotatecw', false);
  }
}


function RotateCounterClockWise() {
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;
// the bottom puyo stays put and the top puyo rotates counterclockwise around the bottom puyo
  if (canmove && !movingleft && !movingdown && !movingright && !rotatecw && !rotateccw && !godownnow && !plopping) {
    stateSwitch('rotateccw', true);
    puyopuyoObj.TPlay("_level0/rotate");
    prevtopposx = topposx;
    prevtopposy = topposy;
    prevbotposx = botposx;
    prevbotposy = botposy;

    // T --> TB
    // B
    if ((prevtopposx == (prevbotposx - 1)) && prevtopposy != 1) {
      topposx = botposx;
      topposy = botposy - 1;
      desiredorientation = 4;
      stateSwitch ('plopping', true);
      Plop('rotate');
    }

    // BT --> T
    //        B
    else if (prevtopposy == (prevbotposy + 1)) {
      topposx = botposx - 1;
      topposy = botposy;
      desiredorientation = 1;
      stateSwitch ('plopping', true);
      Plop('rotate');
    }

    // B --> BT
    // T
    else if (prevtopposx == (prevbotposx + 1)) {
      topposx = botposx;
      topposy = botposy + 1;
      desiredorientation = 2;
      stateSwitch ('plopping', true);
      Plop('rotate');
    }

    // TB --> B
    //        T
    else if (prevtopposy == (prevbotposy - 1)) {
      topposx = botposx + 1;
      topposy = botposy;
      desiredorientation = 3;
      stateSwitch ('plopping', true);
      Plop('rotate');
    }
    stateSwitch ('rotateccw', false);
  }
}


function stateSwitch (state, value) {
// changes the puyo states in one combined control function
  var puyopuyoObj = InternetExplorer ? puyopuyo : document.puyopuyo;

  switch (state) {
    case 'canmove':
      canmove = value;
      break;
    case 'plopping':
      plopping = value;
      break;
    case 'showpoofs':
      showpoofs = value;
      break;
    case 'godownnow':
      godownnow = value;
      break;
    case 'movingleft':
      movingleft = value;
      break;
    case 'movingright':
      movingright = value;
      break;
    case 'movingdown':
      movingdown = value;
      break;
    case 'rotatecw':
      rotatecw = value;
      break;
    case 'rotateccw':
      rotateccw = value;
      break;
  }
} 