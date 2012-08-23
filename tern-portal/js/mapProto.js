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
           
    $.getJSON('/api/regions.json',function(data){
       $.each(data.layers,function(key,val){
            if(key == 0){
                visibility = true;
            }else visibility = false;
            mapWidget.addExtLayer({
                url: val.geo_url,
                protocol: "WMS",
                geoLayer: val.geo_name,
                layerName: val.l_name,
                visibility: visibility
            });
                      
             
                 
        });
        mapWidget.registerClick(data.layers,updateSelectedFeature);   
    });
    
   
    return mapWidget;
}
   
function switchLayer(e,i,mapWidget){
    var active = $("#regionSelect").accordion('option','active');
    var active_id = $("#regionSelect h3 a:eq(" + active + ")").text();
    mapWidget.switchLayer(active_id);
    updateSelectedFeature('');
}

$(document).ready(function() {
   $("#regionTypeSelect").change(function(){
      $('#regionSelect').dropdownchecklist("destroy");
      $('#regionSelect').html($("#regionSelect" + $(this).val()).html());
       $('#regionSelect select').dropdownchecklist();
           
       });
     
    var mapWidget = initMapProto();
    /*$("#regionSelect").accordion({
        autoHeight: false, 
        fillSpace: true,
        change: function(e,i){
            switchLayer(e,i,mapWidget);
        }
    });
    $(".regionlink").bind('click',function(){
        var id  = $(this).attr("id");
        var l_id = $("#regionSelect h3.ui-state-active").attr("id");
        mapWidget.setSelectedId(l_id, id, $(this).text());        
        mapWidget.setHighlightLayer(id);
        updateSelectedFeature($(this).text());
    });
    */
    $("button").bind('click', function() {
        if(mapWidget.getSelectedId()!=""){ 
            
            $.ajax({
                type:"POST",
                url: base_url+"/search/filter/",
                data:"q=&classFilter=All&typeFilter=All&groupFilter=All&subjectFilter=All&fortwoFilter=All&forfourFilter=All&forsixFilter=All&page=1&temporal=All&adv=0&ternRegionFilter="+ mapWidget.getSelectedId()  +"&num=100",            
                success: function(msg,textStatus){
                    var divs = $(msg).filter(function(){return $(this).is('div')});
                    divs.each(function() {
                           
                            if($(this).attr('id') != 'facet-content') {        
                                $('#results').html($(this).html());
                            }
                          
                        });         

                   
                }
                ,
                error:function(msg){
                    console.log('error');

                }
            });
            } else{
                alert("Please select a region first!");
            }
    });
});