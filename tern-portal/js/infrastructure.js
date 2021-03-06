function addCheckbox(name,image_url,help_url,text_abstract,popup_title) {
   var container = $('#facilities');
   var inputs = container.find('input');
   var id = inputs.length+1;
   var img = '<img src="' + image_url + '"/>';
   var helpimg = '<a id="' + id + '" class="helpBtn"></a>'; 
    var helptext = '<div id="help-' + id + '" class="hide" checked="checked" title="Help">' + text_abstract + '</div>';
  
   var html = '<div class="clearfix">' + helpimg + '<input  checked="checked" type="checkbox" id="cb'+id+'" value="'+name+'" /> <label for="cb'+id+'">'+name+ img + '</label>' + '<br/>' + helptext + '</div>';
   container.append($(html));
} 

 
function initMapProto(){
            
    var mapWidget = new MapWidget('spatialmap',true);                   
          
           OpenLayers.ProxyHost= base_url + "api/geoproxy.php?url=";

            $.getJSON('/api/facilities.infrastructure.json',function(data){
            var layers = Array();
            var capability;
              var  wms = new OpenLayers.Format.WMSCapabilities();
                OpenLayers.Request.GET({
                     url: data.geo_url + "/filedata?request=GetCapabilities",
                     success: function(e){
                        var response = wms.read(e.responseText);
                        capability = response.capability;
                        $.each(data.facilities,function(key,val){
                        var visibility = true;
                            mapWidget.addExtLayer({ 
                                url: val.geo_url,
                                protocol: "WMS",
                                geoLayer: val.geo_name,
                                layerName: val.name,
                                visibility: visibility
                            });
                        layers.push(val.name);       

                        for (var i=0, len=capability.layers.length; i<len; i+=1) {
                            var layerObj = capability.layers[i];
                            if (layerObj.name === val.geo_name) {
                                addCheckbox(val.name,val.marker_url,data.help_url, layerObj.abstract, val.popup_title);
                            }
                        }
                        $("#facilities .helpBtn").click(function(e){
                           var id = $(this).attr('id');
                           $("#help-" + id).dialog();
                        });
                    });
                    mapWidget.registerClickInfo({url: data.geo_url, layers: layers}, null);
                    $("#facilities input").click(function(){
                        if($(this).prop("checked")){ 
                                mapWidget.toggleExtLayer($(this).val(),true);   
                        } else{
                            mapWidget.toggleExtLayer($(this).val(),false);   
                        }
                        });
                 }
            });
       
                
        });                       
        
        
  
}
   
$(document).ready(function() {
   
     initMapProto();
    
});