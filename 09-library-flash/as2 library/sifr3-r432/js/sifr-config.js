	// set fonts
	var cochin = {src: 'flash/cochin.swf', ratios: [7, 1.32, 11, 1.31, 13, 1.24, 14, 1.25, 19, 1.23, 27, 1.2, 34, 1.19, 42, 1.18, 47, 1.17, 48, 1.18, 69, 1.17, 74, 1.16, 75, 1.17, 1.16]};
	var rockwell = {src: 'flash/rockwell.swf',ratios: [6, 1.41, 9, 1.35, 15, 1.29, 21, 1.25, 22, 1.22, 27, 1.24, 29, 1.21, 34, 1.22, 41, 1.21, 45, 1.2, 46, 1.21, 59, 1.2, 68, 1.19, 69, 1.2, 96, 1.19, 97, 1.18, 102, 1.19, 103, 1.18, 107, 1.19, 108, 1.18, 112, 1.19, 114, 1.18, 116, 1.19, 120, 1.18, 121, 1.19, 1.18]};

	// You probably want to switch this on, but read <http://wiki.novemberborn.net/sifr3/DetectingCSSLoad> first.
	// sIFR.useStyleCheck = true;
 
	// active fonts
	sIFR.activate(cochin, rockwell);
	
	// set alink in h1
	sIFR.replace(rockwell, {selector: 'h1',css: ['.sIFR-root { text-align: center; font-weight: bold; }','a { text-decoration: none; }','a:link { color: #000000; }','a:hover { color: #CCCCCC; }']});
	
	// set h5 id=pullquote in em tag font color is #660000;
	sIFR.replace(rockwell, {selector: 'h5#pullquote',css: 'em { font-style: normal; color: #660000; }',selectable: false});
	
	// set h3 class=sidebox with background color
	sIFR.replace(cochin, {selector: 'h3.sidebox',css: {'.sIFR-root': { 'background-color': '#DCDCDC' }}});
	
	// set h2,h3
	sIFR.replace(cochin, {selector: 'h2,h3'});
	
	// set h4 class=subhead with lots of attribute and add filters
	sIFR.replace(cochin, {selector: 'h4.subhead',css: {'.sIFR-root': { 'color': '#660000', 'letter-spacing': -1.5, 'text-transform': 'capitalize' }},filters: {DropShadow: {knockout: true,distance: 1,color: '#330000',strength: 2}}});