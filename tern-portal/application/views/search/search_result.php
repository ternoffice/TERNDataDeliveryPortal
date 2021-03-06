<?php
/** 
Copyright 2011 The Australian National University
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

********************************************************************************
$Date: 2011-09-06 11:35:57 +1000 (Tue, 06 Sep 2011) $
$Revision: 1 $
***************************************************************************
*
**/
?>


<?php //if($json):?>	
        
            <?php $this->load->view('search/facet');?> 
       
         <?php  
                $realNumFound = $json->{'response'}->{'numFound'}; 
                if($realNumFound == '') $realNumFound=0;
                echo '<div id="head-toolbar-content" class="resultsNav">';
                echo '<div id="realNumFound" class="hide">'.($realNumFound).'</div>';
                echo        '<div id="left_num_records" class="result left">';
                echo            'Showing ';
                                if($this->input->cookie('selection')<$realNumFound)
                                {    
                                    echo '<span class="numResultsPerPage"><label id="showing">'.$this->input->cookie('selection').' </label></span>';
                                }else
                                {
                                    echo '<span class="numResultsPerPage"><label id="showing">'.$realNumFound.' </label></span>';
                                }
                echo            ' of ';                
                echo           '<span class="totalResults">'. number_format($realNumFound).'</span> results';                
                echo        '</div>';

                
                echo        '<div id="middle-select-num" class="resultsPerPage left">';
                echo        'Display';
                echo        '<select class="viewrecord" name="select-view-record">';				
                echo                '<option value="10">10</option>';
                echo                '<option value="25">25</option>';
                echo                '<option value="50">50</option>';				
                echo               '<option value="100">100</option>';			
                echo           '</select>';
                echo        'results';
                echo        '</div>';              
       
                
                echo        '<div id="sorting_selection" class="sortBy left">';
                echo        'Sort By:';
                echo        '<select class="sort_record" name="select-sorting">';				
                echo                '<option value="score">Relevance</option>';
                echo                '<option value="date_modified">Date released</option>';             
                echo                '<option value="list_title">Title</option>';   
                echo           '</select>'; 
                echo        '</div>';
                                
                $this->load->view('search/pagination');
                echo '</div>';
                

                ?>    

        <div id="search-results-content" >
                <?php $this->load->view('search/content');?>        
        </div>
<?php //endif;?>