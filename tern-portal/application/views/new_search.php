<?php $this->load->view('tpl/header'); ?>      
 
<div id="container" class="ui-corner-all clearfix">
     <div id="page_name" class="hide">Search</div>
     <div id="loading"  ><p><img src="/img/ajax-loader.gif" alt="Please wait.." /> Please wait.. </p></div>
            <div id="search-panel" class="">    
                <div id="accordion" class="accordion">
                    
 <!--                   <h2 id="basicSearchH2"><a href="#">Basic Search</a></h2>-->
                    <?php //$this->load->view('tab/widgets/basicsearch');?>               
 <!--
                    <h2 id="advSearchH2"><a href="#">Advanced Search</a></h2>
                    <div id="advSearch-frame" class="padding5">
                     
                    <?php //if($widget_keyword) { ?> 
                     <?php //$this->load->view('tab/widgets/keyword');?>
                 
                    <?php //} ?>
                    <?php //if($widget_facilities) { ?>
                     <?php //$this->load->view('tab/widgets/facility');?>
                   
                    <?php //} ?>
                    <?php //if($widget_temporal) { ?>
                     <?php //$this->load->view('tab/widgets/temporal');?>
                     <?php //}?>
                     
                    <?php //if($widget_for){  ?>
                     <?php //$this->load->view('tab/widgets/researchfield');?>              
                    <?php //} ?>
                          <?php //$this->load->view('tab/widgets/buttonsearch');?>
                      </div>
-->                    
                    <h2 id="facetH2"><a href="#">Search</a></h2>
                    <div id="facet-frame" ><div id="facet-accordion" class="accordion"></div></div>         
                 </div>
            </div> 
            <div id="result-panel" class="ui-layout-center ">
                <!--  <div id="head-toolbar" class="toolbar clearfix hide"></div>                                -->
        
                 <?php $this->load->view('tab/widgets/spatial');?>
                  <div id ="middle-toolbar" class="clearfix"></div>
                <div id="search-result" class="ui-layout-search-results"></div>
                <div id ="bottom-toolbar"></div>
            
            </div>
        </div> 
<div id="dialog-searchterm" title="Confirm search" class="hide">There are special characters entered. Do you want to continue?</div>
<?php $this->load->view('tpl/footer');?>