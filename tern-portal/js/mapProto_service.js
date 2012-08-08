function updateSelectedFeature(name){
    if(name !=''){    
        $("#featurename").text("Selected region: " + name);        
    }
    else{
        $("#featurename").text("");    
    }
}
function initMapProto(){
            
    var mapWidget = new MapWidget('spatialmap',true);
           
   
            mapWidget.addExtLayer({
                url: 'http://demo:8080/geoserver/wms',
                protocol: "WMS",
                geoLayer: "nr:ltern",
                layerName: "LTERN",
                visibility: true
                    
            });
                      
            mapWidget.registerClickInfo({url: 'http://demo:8080/geoserver/wms', geoLayer: "nr:ltern"}, null);
   
  
}
   
$(document).ready(function() {
   
     initMapProto();
    
});