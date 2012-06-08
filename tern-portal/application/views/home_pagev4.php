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
 * **************************************************************************
 *
 * */
?>
<?php
$this->load->view('tpl/header');
$home = 1;
?>


<?php $this->load->view('tpl/mid'); ?>

<div id="container" class="ui-corner-all">
    <div id="ui-layout-center" class="ui-layout-center ">

        <div id="tab">
          
            <div id="random" class="clearfix">

            </div>
        </div>

    </div>
    <div class="ui-layout-west hidden">  
        <div id="capabilities_list">
             <?php		
                $facilities_list = array("tddp","auscover","ozflux","ecoinformatics","supersites");
                if($json && $json->{'response'}->{'docs'}){		
                    foreach($json->{'response'}->{'docs'} as $d){		
                        if(in_array($d->{'key'}, $facilities_list)){		
                            echo '<div class="flrow"><div class="fl" id="'. $d->{'key'} .'">';		
                            echo htmlentities($d->{'alt_name'});
                            echo '</div></div>';		
                            }		
                    }		
                }		
                ?>                               
        </div>
    </div>
   <!-- <div class="ui-layout-east hidden"> Some exciting logos to be found here   -->
    </div>
</div>

<?php $this->load->view('tpl/footer'); ?>



