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

<div id="container">
    <div id="ui-layout-center" class="ui-layout-center ">

        <div id="tab" class="firstcolumn">
          
            <div id="random" class="clearfix">

            </div>
        </div>
         <div id="tab2"  class="secondcolumn" >
            <div id="random" class="clearfix"></div>
        </div>

    </div>
    <div class="ui-layout-west hidden">  
        <ul>
             <li id ="tddp" class="fl">
                <input type="image"  src="" height="50" width="240" name="tddps" value="TDDP">
            </li>
            <li id ="auscover" class="fl">
            <input type="image"  src="/img/auscover.PNG" height="50" width="240" name="auscover">
            </li>
            <li id ="ozflux" class="fl">
            <input type="image"  src="/img/ozflux.png" height="50" width="240" name="ozflux">
            </li>
<!--            
            <li id ="ausplot" class="fl">
            <input type="image"  src="/img/ausplot.PNG" height="50" width="80" name="ausplot">
            </li>
-->
<!--
            <li  id ="aceas" class="fl">
            <input type="image"  src="/img/aceas.png" height="50" width="150" name="aceas">
            </li>
-->
            <li  id ="ecoinformatics" class="fl">
            <input type="image"  src="/img/aekos.PNG" height="50" width="150" name="aekos">
            </li>
<!--            
            <li  id ="emast" class="fl">
            <input type="image"  src="/img/emast.PNG" height="50" width="100" name="emast">
            </li>
-->
            <li  id ="supersites" class="fl">
            <input type="image"  src="/img/supersite.PNG" height="50" width="240" name="supersite">
            </li>
        </ul>
    </div>
   <!-- <div class="ui-layout-east hidden"> Some exciting logos to be found here   -->
    </div>
</div>

<?php $this->load->view('tpl/footer'); ?>



