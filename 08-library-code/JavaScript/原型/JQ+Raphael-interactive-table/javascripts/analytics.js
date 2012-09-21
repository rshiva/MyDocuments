
// extend Raphael.fn object add a function call drawGrid 
// draw tabel background 
Raphael.fn.drawGrid = function (x, y, w, h, wv, hv, color) {
    color = color || "#000";
    
	/*
	console.log("x= "+x); // 42.91935483870968
	console.log("y= "+y); // 20.5
	
	console.log("w= "+y); // 20.5
	console.log("h= "+y); // 20.5
	
	console.log("wv= "+wv); // 10
	console.log("hv= "+hv); // 10
	*/
	
	// M, L is SVG path string format. http://raphaeljs.com/reference.html#Paper.path
	// M move to
	// L line to
	// draw table border using //["M", 43.5, 21.5, "L", 788.5, 21.5, 788.5, 231.5, 43.5, 231.5, 43.5, 21.5]
	var path = ["M", Math.round(x) + .5, Math.round(y) + .5, "L", Math.round(x + w) + .5, Math.round(y) + .5, Math.round(x + w) + .5, Math.round(y + h) + .5, Math.round(x) + .5, Math.round(y + h) + .5, Math.round(x) + .5, Math.round(y) + .5];
    
	
	var rowHeight = h / hv;
    var columnWidth = w / wv;
    

	for (var i = 1; i < hv; i++) {
		// using contact to join new array to path, add line data for y axie
        path = path.concat(["M", Math.round(x) + .5, Math.round(y + i * rowHeight) + .5, "H", Math.round(x + w) + .5]); 
    }

    for (i = 1; i < wv; i++) {
        // // using contact to join new array to path, add line data for y axie
		path = path.concat(["M", Math.round(x + i * columnWidth) + .5, Math.round(y) + .5, "V", Math.round(y + h) + .5]);
    }

	// console.log(path)
	// path.join(",") is joins all elements of an array into a string using ","
	// draw table background  
    return this.path(path.join(",")).attr({stroke: color});  
};

// hide the resource data
$(function () {
    $("#data").css({
        position: "absolute",
        left: "-9999em",
        top: "-9999em"
    });
});

window.onload = function () {
    
	function getAnchors(p1x, p1y, p2x, p2y, p3x, p3y) {
        var l1 = (p2x - p1x) / 2,
            l2 = (p3x - p2x) / 2,
            a = Math.atan((p2x - p1x) / Math.abs(p2y - p1y)),
            b = Math.atan((p3x - p2x) / Math.abs(p2y - p3y));
        a = p1y < p2y ? Math.PI - a : a;
        b = p3y < p2y ? Math.PI - b : b;
        var alpha = Math.PI / 2 - ((a + b) % (Math.PI * 2)) / 2,
            dx1 = l1 * Math.sin(alpha + a),
            dy1 = l1 * Math.cos(alpha + a),
            dx2 = l2 * Math.sin(alpha + b),
            dy2 = l2 * Math.cos(alpha + b);
        return {
            x1: p2x - dx1,
            y1: p2y + dy1,
            x2: p2x + dx2,
            y2: p2y + dy2
        };
    }
    
	
	// Grab the data from table
    var labels = [],
        data = [];
    $("#data tfoot th").each(function () { labels.push($(this).html());});
    $("#data tbody td").each(function () { data.push($(this).html()); });
    
	
    // start drawing
    
	// draw table background
	var width = 800,
        height = 250,
        
		leftgutter = 30,
        bottomgutter = 20,
        topgutter = 20,
        
		colorhue = .6 || Math.random(),
        color = "hsl(" + [colorhue, .5, .5] + ")",
        
		r = Raphael("holder", width, height), // in holder, create a canvas using width and height
        
		txt = {font: '12px Helvetica, Arial', fill: "#fff"},
        txt1 = {font: '10px Helvetica, Arial', fill: "#fff"},
        txt2 = {font: '12px Helvetica, Arial', fill: "#000"},

		max = Math.max.apply(Math, data), // get largest number from data
        X = (width - leftgutter) / labels.length, // get unit width on X
        Y = (height - bottomgutter - topgutter) / max; // get unit height on Y
    	
	r.drawGrid(leftgutter + X * .5 + .5, topgutter + .5, width - leftgutter - X, height - topgutter - bottomgutter, 10, 10, "#000"); //call the drawGrid function extend to Raphael at beginning


	// 
    var path = r.path().attr({stroke: color, "stroke-width": 4, "stroke-linejoin": "round"}), // set line attribute
        bgp = r.path().attr({stroke: "none", opacity: .3, fill: color}), // set fill attribute create by line
        label = r.set(), // make label as raphael object
        lx = 0, ly = 0,
        is_label_visible = false,
        leave_timer,
        blanket = r.set();

	// set label for X asie and Y asie
    label.push(r.text(60, 12, "24 hits").attr(txt)); 
    label.push(r.text(60, 27, "22 September 2008").attr(txt1).attr({fill: color}));
    label.hide();
    
	// set roll over panel
	// in popup.js, extend Raphael.fn object add a function call popup 
	var frame = r.popup(100, 100, label, "right").attr({fill: "#000", stroke: "#666", "stroke-width": 2, "fill-opacity": .7}).hide();

    var p, bgpp;
    for (var i = 0, ii = labels.length; i < ii; i++) {
        var y = Math.round(height - bottomgutter - Y * data[i]), // get y position for circle
            x = Math.round(leftgutter + X * (i + .5)), // get x position for circle
            t = r.text(x, height - 6, labels[i]).attr(txt).toBack(); // set bottom text
        
		// set point position and fille position
		if (!i) {
			// C curve to
			// L line to
			// M move to
            p = ["M", x, y, "C", x, y];
            bgpp = ["M", leftgutter + X * .5, height - bottomgutter, "L", x, y, "C", x, y];
        }

        if (i && i < ii - 1) {
            var Y0 = Math.round(height - bottomgutter - Y * data[i - 1]),
                X0 = Math.round(leftgutter + X * (i - .5)),
                Y2 = Math.round(height - bottomgutter - Y * data[i + 1]),
                X2 = Math.round(leftgutter + X * (i + 1.5));
            var a = getAnchors(X0, Y0, x, y, X2, Y2);
            p = p.concat([a.x1, a.y1, x, y, a.x2, a.y2]);
            bgpp = bgpp.concat([a.x1, a.y1, x, y, a.x2, a.y2]);
        }

		
        var dot = r.circle(x, y, 4).attr({fill: "#333", stroke: color, "stroke-width": 2}); // set attribute for point
        blanket.push(r.rect(leftgutter + X * i, 0, X, height - bottomgutter).attr({stroke: "none", fill: "#fff", opacity: 0})); // draw rollover area
        
		// add interactive behaior for each roll over area
		var rect = blanket[blanket.length - 1];
        (function (x, y, data, lbl, dot) {
            // show popup
						var timer, i = 0;
            rect.hover(
				function () {
                	dot.attr("r", 6);
					clearTimeout(leave_timer);
	                var side = "right";
	                if (x + frame.getBBox().width > width) {
	                    side = "left";
	                }
	                var ppp = r.popup(x, y, label, side, 1),
	                    anim = Raphael.animation({
	                        path: ppp.path,
	                        transform: ["t", ppp.dx, ppp.dy]
	                    }, 200 * is_label_visible);
	                lx = label[0].transform()[0][1] + ppp.dx;
	                ly = label[0].transform()[0][2] + ppp.dy;
	                frame.show().stop().animate(anim);
	                label[0].attr({text: data + " hit" + (data == 1 ? "" : "s")}).show().stop().animateWith(frame, anim, {transform: ["t", lx, ly]}, 200 * is_label_visible);
	                label[1].attr({text: lbl + " September 2008"}).show().stop().animateWith(frame, anim, {transform: ["t", lx, ly]}, 200 * is_label_visible);
	                is_label_visible = true;
            }, function () {
                dot.attr("r", 4);
				leave_timer = setTimeout(function () {
                    frame.hide();
                    label[0].hide();
                    label[1].hide();
                    is_label_visible = false;
                }, 1);
            });
        })(x, y, data[i], labels[i], dot);
    }
    

	p = p.concat([x, y, x, y]);
	bgpp = bgpp.concat([x, y, x, y, "L", x, height - bottomgutter, "z"]);
	path.attr({path: p});
	bgp.attr({path: bgpp});
	frame.toFront();
	label[0].toFront();
	label[1].toFront();
	blanket.toFront();
};