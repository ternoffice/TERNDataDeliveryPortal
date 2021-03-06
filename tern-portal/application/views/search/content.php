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

 * *******************************************************************************
  $Date: 2011-09-06 11:35:57 +1000 (Tue, 06 Sep 2011) $
  $Revision: 1 $
 * *******************************************************************************
 *
 * */
?>
<?php

$realNumFound = $json->{'response'}->{'numFound'};
$numFound = $json_tab->{'response'}->{'numFound'};
$timeTaken = $json->{'responseHeader'}->{'QTime'};
$timeTaken = $timeTaken / 1000;

//print_r($json->{'responseHeader'}->{'params'});

$row = $json->{'responseHeader'}->{'params'}->{'rows'};
$start = $json->{'responseHeader'}->{'params'}->{'start'};
$end = $start + $row;

$h_start = $start + 1; //human start
$h_end = $end + 1; //human end

if ($h_end > $numFound)
    $h_end = $numFound;

if ($row > 0) {
    $totalPage = ceil($numFound / $row);
    $currentPage = ceil($start / $row) + 1;
}
?>
<?php

if ($realNumFound >0)
{

            //$this->load->view('search/no_result');
   
        $c = 1; //record counter 1- 10
       // echo '<table style="border:1px solid black;table-layout:fixed" width="880px">';
        //echo '<col width=50>';
        //echo '<col width=730>';
        //echo '<col width=100>';
        echo '<table id="searchResults">';
        echo '<thead>';
        echo '<tr>';
        echo    '<th class="mapRefTH">Map ref#</th>';
        echo    '<th class="titleTH">Title</th>';
        echo    '<th class="datePublishedTH">Date released</th>';
        echo '</tr>';
        echo '</thead>'; 
        foreach ($json->{'response'}->{'docs'} as $r) 
        {

            //var_dump($r->{'description_value'});
            $type = $r->{'type'};
            $ro_key = $r->{'key'};

            //$name = $r->{'listTitle'};
            $name = $r->{'list_title'};

            $descriptions = array();
            if (isset($r->{'description_value'}))
                $descriptions = $r->{'description_value'};
            $date_pub = array();
            if (isset($r->{'date_modified'})){  
                $date_pub = $r->{'date_modified'};
                $date_pubf = new DateTime($date_pub);
                $date_pubf->setTimeZone(new DateTimeZone("Australia/Brisbane")); 
                $date_pub = $date_pubf->format('d-m-Y');
            }
            $description_type = array();
            if (isset($r->{'description_type'}))
                $description_type = $r->{'description_type'};
            $class = '';
            if (isset($r->{'class'}))
                $class = $r->{'class'};
            $type = '';
            if (isset($r->{'type'}))
                $type = strtolower($r->{'type'});

            $brief = '';
            $found_brief = false;
            $full = '';
            $found_full = false;
            foreach ($description_type as $key => $t)
            {
                if ($t == 'brief' && !$found_brief)
                {
                    $brief = $descriptions[$key];
                    $found_brief = true;
                }
                elseif ($t == 'full' && !$found_full)
                {
                    $full = $descriptions[$key];
                    $found_full = true;
                }
            }

            $spatial = '';
            $center = '';
            if (isset($r->{'spatial_coverage'}))
            {
                $spatial = $r->{'spatial_coverage'};
                $center = $r->{'spatial_coverage_center'}[0];
            }

            $subjects = '';

            //		if(isset($r->{'subject_value'})){
            //			$subjects = $r->{'subject_value'};
            //		}
            if (isset($r->{'subject_value_resolved'}))
            {
                $subjects = $r->{'subject_value_resolved'};
            }
            if ($r->url_slug)
                {
                    $key_url = base_url().$r->{'url_slug'};
                }
            else{
                $key_url = base_url() . 'view/dataview?key=' . urlencode($ro_key);
            }
            echo '<tbody>';
            echo '<tr>';
            echo    '<td>';
                        if($center) {
                            if($c > 99){ 
                                echo '<a class="pin3" href="javascript:void(0);">' . $c . '</a>';
                            }elseif($c > 9){
                                 echo '<a class="pin2" href="javascript:void(0);">' . $c . '</a>';
                            }else{
                                echo '<a class="pin" href="javascript:void(0);">' . $c . '</a>';
                            }
                        }
            echo    '</td>';
            echo    '<td><h2><a href="javascript:void(0);" class="recordTitle">' . $name . '</a></h2>';
            echo        '<div class="expand" id="metadesc">';
                            if (isset($r->{'alt_list_title'}))
                            {
                                echo '<div>';
                                //foreach($r->{'alt_listTitle'} as $listTitle){
                                foreach ($r->{'alt_list_title'} as $listTitle)
                                {

                                    echo '<p class="alt_listTitle">' . $listTitle . '</p>';
                                }
                                echo '</div>';
                            }
                            //DESCRIPTIONS';
                            if ($found_brief || $found_full)
                            {
                                echo '<p>';
                                if ($found_brief)
                                {
                                    echo ($brief);
                                }
                                elseif ($found_full)
                                {
                                    echo ($full);
                                }
                                echo '</p> ';
                            }

         
            if($spatial){

                echo '<ul class="spatial hide">';
                foreach($spatial as $s){
                echo '<li>'.$s.'</li>';
                }
                echo '</ul>';
                echo '<span class="spatial_center hide">'.$center.'</span><br/>';
                echo '<span class="key hide">'.$ro_key.'</span>';
                if($center) $c++;
            }
            echo '</div>';
            echo '</td>';
            echo    '<td class="actionsColumn"><p class="datePublished">' . $date_pub . '</p>';
            echo    '<a class="show" href="javascript:void(0);"></a>';
            echo        '<div class="expand" id="metabutton">';
            
                 echo            '<a class="greyGradient smallRoundedCorners disabled tblsaveRecord" href="javascript:void(0);" style="display: block;">Saved</a>';
        
                 echo            '<a class="orangeGradient smallRoundedCorners tblFav" href="javascript:void(0);">Add to Favourites</a>';
            


            echo            '<a class="greenGradient smallRoundedCorners viewmeta" href="' . $key_url . '" target="_blank">View Metadata</a>';
            echo        '</div>';
             echo '</td>';

            echo  '</tr>';

            echo '</tbody>';

        }
        echo '</table>';
        echo '<div id="infoBox"></div>';
}
?>