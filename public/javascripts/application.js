// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {

  	/*
    	Initialise for the Circle Activity
  	*/
  	var shapes= $(".shape")
  	var xoffset = new Array();
  	var yoffset = new Array();
  	var maxWidth = 0; var maxHeight = 0;
  	for (var j = 0; j < shapes.length ; j++) {
    	var w = parseInt($(shapes[j]).width()); var h = parseInt($(shapes[j]).height());
    	if (w > maxWidth) {maxWidth = w}; if (h > maxHeight) {maxHeight = h};
    	xoffset[j] = Math.floor(w / 2); yoffset[j] = Math.floor(h / 2);
  	};
  	var maxImageLength = (maxWidth > maxHeight) ? maxWidth : maxHeight;

  	var canvasWidth = parseInt($("#canvas").width()); var canvasHeight = parseInt($("#canvas").height());
  	var maxCanvasLength = (canvasWidth > canvasHeight) ? canvasWidth : canvasHeight;

    $("#debug").append("maxWidth" + maxWidth);
    $("#debug").append("<br />");
    $("#debug").append("maxHeight" + maxHeight);
    $("#debug").append("<br />");
    $("#debug").append("maxImageLength" + maxImageLength);
    $("#debug").append("<br />");

  	var radius = maxCanvasLength / 2 - Math.floor(maxImageLength / 2); 
  	var steps = 140;
  	var centerX = Math.floor(maxCanvasLength / 2);
  	var centerY = Math.floor(maxCanvasLength / 2);
  	var xValues = new Array();
  	var yValues = new Array();

  	for (var i = 0; i < steps; i++) {
      xValues[i] = Math.floor(centerX + radius * Math.cos(2 * Math.PI * i / steps)) ;
      yValues[i] = Math.floor(centerY + radius * Math.sin(2 * Math.PI * i / steps)) ;
  	};
  	//for (var i = 0; i < steps; i++) {
  		//    $("#debug").append("Pos" + i + ":" + xValues[i] + "," + yValues[i] + " ");
 		// }
		//  $("#debug").append("<br />");

  	var position = new Array();
  	for (var j = 0; j < shapes.length ; j++) {
    	position[j] = Math.floor((steps * j) / shapes.length);
    	x = (xValues[position[j]] - xoffset[j]) ; y = (yValues[position[j]] - yoffset[j]);
    	$(shapes[j]).css({left: x + "px", top: y + "px"}).show();	
		//    $("#debug").append("shape" + j + " pos:" + position[j] + " " + xValues[position[j]] + "px," + yValues[position[j]] + "px ");
		//    $("#debug").append("<br />");
  	};

   	function rotate_shapes() {
    	for (var i = 0; i < steps * 5 ; i++) {
      		for (var j = 0; j < shapes.length ; j++) {
        		position[j] = position[j] + 1;
        		if (position[j] >= steps) {position[j] = 0}; 
        		x = (xValues[position[j]] - xoffset[j]) ; y = (yValues[position[j]] - yoffset[j]);
        		$(shapes[j]).animate({left: x + "px", top: y + "px"}, 200);
      		}
    	}
   	};

    rotate_shapes();
});
