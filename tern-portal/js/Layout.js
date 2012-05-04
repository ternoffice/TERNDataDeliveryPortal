var myLayout,middleLayout;
      
function sizeCenterPane () {
    var $Container	= $('#container')
    ,	$Pane		= $('.ui-layout-center')
    ,	$Content	= $('#content')
    ,	outerHeight = $Pane.outerHeight()
    // use a Layout utility to calc total height of padding+borders (also handles IE6)
    ,	panePadding	= outerHeight - $.layout.cssHeight($Pane, outerHeight)
    ,       $West           = $('.ui-layout-west')
    ,       $WestContent    = $('#advsearch')
    ,       outerWestHeight  = $West.outerHeight()      
    ,       paneWestPadding	= outerWestHeight - $.layout.cssHeight($West, outerWestHeight)
    ;
    if(( $Pane.position().top + $Content.outerHeight() + panePadding ) > ( $West.position().top + $WestContent.outerHeight() + paneWestPadding )) {
        // update the container height - *just* tall enough to accommodate #Content without scrolling
        $Container.height( $Pane.position().top + $Content.outerHeight() + panePadding );
    }else{
        $Container.height( $West.position().top + $WestContent.outerHeight() + paneWestPadding + 5);
    }
    // now resize panes to fit new container size
    myLayout.resizeAll();
}

$(function(){
                
    /*                              LAYOUT
                 *              Set outer container to div#container
                 *              Set inner container to div#content 
                 */
    // first set a 'fixed height' on the container so it does not collapse...
    var $Container = $('#container')
    $Container.height( $(window).height() - $Container.offset().top );

    // NOW create the layout
    myLayout = $('#container').layout({
        west__size: 300, 
        north__spacing_open: 0

    });
		
    var $Content = $('#content')
    $Content.height( $(window).height() - $Content.offset().top );
    middleLayout = $('#content').layout({ 
        center__paneSelector:	".ui-layout-results" 
        ,	
        west__paneSelector:		".ui-layout-facet" 
        ,	
        north__paneSelector:		".ui-layout-map" 
        ,	
        west__size:				300 
        ,       
        north__size:                             300
    }); 

    // now RESIZE the container to be a perfect fit
    sizeCenterPane();

});
           
         