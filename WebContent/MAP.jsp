<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="javaxt.io.Image"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<title>Reverse Geocoding</title>
    <style>
      html, body, #map-canvas {
        height: 75%;
        margin: 25px;
        padding: 25px
      }
      #panel {
        position: absolute;
        top: 5px;
        left: 50%;
        margin-left: -180px;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
    <script>
    <%
    Image image = new Image("c:/Users/pavan/Desktop/" +  request.getParameter("uploadField"));
	double[] coords = image.getGPSCoordinate();
	//System.out.println(coords[0]+"  "+coords[1]);
    %>
var geocoder;
var map;
var infowindow = new google.maps.InfoWindow();
var marker;
function initialize() {
  geocoder = new google.maps.Geocoder();
//  var latlng = new google.maps.LatLng(17.41497611111111,78.44747138888889 );
   var latlng = new google.maps.LatLng(coords[0],coords[1] );
  geocoder.geocode({'latLng': latlng}, function(results, status) {
	    if (status == google.maps.GeocoderStatus.OK) {
	      if (results[1]) {
	        map.setZoom(11);
	        marker = new google.maps.Marker({
	            position: latlng,
	            map: map
	        });
	        infowindow.setContent(results[1].formatted_address);
	        infowindow.open(map, marker);
	      } else {
	        alert('No results found');
	      }
	    } else {
	      alert('Geocoder failed due to: ' + status);
	    }
	  });
  
  
  
  var mapOptions = {
    zoom: 25,
    center: latlng,
    mapTypeId: 'roadmap'
  }
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  
  
  
}


google.maps.event.addDomListener(window, 'load', initialize);

    </script>
    
  </head>
  <body>
    
    <div id="map-canvas"></div>
  </body>
</html>