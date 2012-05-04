<?php $this->load->view('tpl/header'); ?>      
        <div id="container">


            <div id="content" class="ui-layout-center hidden">
              
                    <div class="ui-layout-map hidden">
                        Map here
                    </div>
                    <div class="ui-layout-facet hidden">
                        <h3 class="ui-widget-header"> Facets </h3>
                    </div>
                    <div class="ui-layout-results hidden" >
                   <pre>     lasses Added During Resizing

                            When a pane is being "resized", a clone of the resizer-bar is created by ui.draggable. During the dragging process, classes are added to both the real resizer-bar (which does not move) and the cloned resizer-bar (which is 'dragging'). When dragging is completed, the cloned element is deleted, the real resizer-bar is moved to the new position, and the 'drag' classes are removed.

                            These are the classes added to the west-pane elements while resizing is in-progress:

                            REAL Resizer-bar

                                ui-layout-resizer-drag
                                ui-layout-resizer-west-drag

                            The 'drag' classes are added to the 4 regular classes already on the resizer bar

                            class="ui-layout-resizer
                                ui-layout-resizer-west
                                ui-layout-resizer-open
                                ui-layout-resizer-west-open
                                ui-layout-resizer-drag
                                ui-layout-resizer-west-drag"

                            CLONED Resizer-bar

                                ui-draggable-dragging - this class is generated by ui.draggable when the clone is created
                                ui-resizer-dragging
                                ui-resizer-west-dragging

                            The cloned bar inherits the 4 regular classes from the real resizer-bar - the 'dragging' classes are added to these:

                            class="ui-layout-resizer
                                ui-layout-resizer-west
                                ui-layout-resizer-open
                                ui-layout-resizer-west-open
                                ui-draggable-dragging
                                ui-layout-resizer-dragging 
                                ui-layout-resizer-west-dragging"

                            Resizer & Toggler Graphics

                            To use graphics for resizer-bars and toggler-buttons, specify them as background-images in your CSS. Different graphics and/or opacity can be specified for each 'state' - open, closed, resizing and hover (using the :hover pseudo-class).

                            The complex demo uses a variety of colors, images and opacity to create a range of effects. Pane-spacing can also be used to control appearance. Each pane can have different options and be styled independant of the others.
                            Custom Button Classes

                            If you add custom buttons using the layout utilities described below, a number of additional styles are auto-generated for the button-elements.

                            SEE Special Utility Methods below for a list of the button classes.</pre>
                    </div>
                
            </div>

            <div class="ui-layout-west hidden">    
                <div class="accordion">
                    <h3><a href="#">Basic Search</a></h3>
                    <?php $this->load->view('tab/widgets/basicsearch');?>               
                    <h3><a href="#">Advanced Search</a></h3>
                    <div class="padding5">
                     
                    <?php if($widget_keyword) { ?> 
                     <?php $this->load->view('tab/widgets/keyword');?>
                 
                    <?php } ?>
                    <?php if($widget_facilities) { ?>
                     <?php $this->load->view('tab/widgets/facility');?>
                   
                    <?php } ?>
                    <?php if($widget_temporal) { ?>
                     <?php $this->load->view('tab/widgets/temporal');?>
              
                    <?php }?>
                    <?php if($widget_for){  ?>
                     <?php $this->load->view('tab/widgets/researchfield');?>              
                    <?php } ?>
                      </div>
                 </div>
                     <?php $this->load->view('tab/widgets/buttonsearch');?>
               
           </div> 
            


        </div> 

<?php $this->load->view('tpl/footer');?>