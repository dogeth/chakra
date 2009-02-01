// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  	/*
    	Rotation of objects on a canvas
  	*/
  	var objects= $("#canvas .move"); //Get the objects to move about the canvas
  	if (objects.length > 0) {
  		var steps = 140;												//Number of points to use in the circle
  		var turns = 5;													//Number of complete rotations
  		
  		//Initialisation for the circle
	  	var x_pos = new Array(steps); var y_pos = new Array(steps);		//points around the circle
	  	var x_offset = new Array(objects.length); 
	  	var y_offset = new Array(objects.length); 						//store offsets for each object (may be different sizes)
	  	var position = new Array(objects.length);						//where each object is in the circle
	  	
	  	//Hard-coding size of the canvas for now, jQuery not picking up the correct width and height from the style after a refresh
	  	//var canvas_width = parseInt($("#canvas").width()); var canvas_height = parseInt($("#canvas").height());
	  	var canvas_width = 300; var canvas_height = 300;
	  	

		//Get Offsets, and Maximum object width and height
	  	var max_object_width = 0; var max_object_height = 0; 				
  		for (var i = 0; i < objects.length ; i++) {
    		var w = parseInt($(objects[i]).width()); var h = parseInt($(objects[i]).height());
    		if (w > max_object_width) {max_object_width = w}; if (h > max_object_height) {max_object_height = h};
    		x_offset[i] = Math.floor(w / 2); y_offset[i] = Math.floor(h / 2);
  		}

	  	var max_object_length = (max_object_width > max_object_height) ? max_object_width : max_object_height;
  		var max_canvas_length = (canvas_width > canvas_height) ? canvas_width : canvas_height;

		//Calculate points of a circle around the canvas
	  	var radius = max_canvas_length / 2 - Math.floor(max_object_length / 2); 
	  	var x_center = Math.floor(canvas_width / 2);
  		var y_center = Math.floor(canvas_height / 2);
	  	for (var i = 0; i < steps; i++) {
    	  x_pos[i] = Math.floor(x_center + radius * Math.cos(2 * Math.PI * i / steps)) ;
	      y_pos[i] = Math.floor(y_center + radius * Math.sin(2 * Math.PI * i / steps)) ;
  		}

		//Move the objects into starting positions and make visible
  		for (var j = 0; j < objects.length ; j++) {
    		position[j] = Math.floor((steps * j) / objects.length);
    		x = (x_pos[position[j]] - x_offset[j]) ; y = (y_pos[position[j]] - y_offset[j]);
    		$(objects[j]).css({left: x + "px", top: y + "px"}).show();
	  	}

		//Start the rotation		
    	for (var i = 0; i < steps * turns ; i++) {
	  		for (var j = 0; j < objects.length ; j++) {
    			position[j] = position[j] + 1;
    			if (position[j] >= steps) {position[j] = 0}; 
    			x = (x_pos[position[j]] - x_offset[j]) ; y = (y_pos[position[j]] - y_offset[j]);
        		$(objects[j]).animate({left: x + "px", top: y + "px"}, 200);
	  		}
		}
	}
});
