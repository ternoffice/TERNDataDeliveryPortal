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
<?php 

if(($spatial_included_ids!='') || ($temporal!='All') || ($typeFilter!='All') || ($groupFilter!='All')||($subjectFilter!='All')||($fortwoFilter!='All')||($forfourFilter!='All')||($forsixFilter!='All'))
{
	echo '<div class="right-box">';
	echo '<h2>Selected</h2>';
	echo '<div class="facet-content">';
		echo '<ul>';
		if($temporal!='All'){
			echo '<li><a href="javascript:void(0);" id="clearTemporal" class="clearFilter" title="Search results are restricted to this timeline, Click to remove this filter">'.$temporal.'</a></li>';
		}
		if($spatial_included_ids!=''){
			//echo '<li><a href="javascript:void(0);" id="clearSpatial" class="clearFilter" title="Search results are restricted to spatial, Click to remove this filter">Clear Spatial</a></li>';
		}
		//if($typeFilter!='All') displaySelectedFacet('type',$typeFilter,$json);
		if($groupFilter!='All') displaySelectedFacet('group',$groupFilter,$json);
		if($subjectFilter!='All') displaySelectedFacet('subject_value',$subjectFilter,$json);
                //if($fortwoFilter!='All') displaySelectedFacet('for_value_two',$fortwoFilter,$json);
                 if($forfourFilter!='All') displaySelectedFacet('for_value_four',$forfourFilter,$json);
               //   if($forsixFilter!='All') displaySelectedFacet('for_value_six',$forsixFilter,$json);

		echo '</ul>';
	echo '</div>';
	echo '</div>';    
}

?>

<?php
	/*
	echo '<pre>';
	print_r($json->{'facet_counts'}->{'facet_fields'}->{'group'});
	echo '</pre>';
	*/
	//displayFacet('type', $typeFilter, $json, $classFilter, $this);
	displayFacet('subject_value', $subjectFilter, $json, $classFilter);
         echo '<div class="right-box">';
	
	
	echo '<h2>Field of Research';
	echo '<span class="toggle-facet-field" id="for">
			<span class="ui-icon ui-icon-arrowthickstop-1-s toggle-facet-field"></span>
			</span>';
	echo '</h2>';
	echo '<div class="facet-content hide">';
	
	
	echo '<ul class="more">';
        $obj_type=displayFORFacet('for_value_two','for_value_four','for_value_six',$forfourFilter,$json, $classFilter, $this);
        

       	echo '</ul>';
	echo '</div>';
	echo '</div>';	
        displayFacet('group', $groupFilter, $json, $classFilter, true);
	  
       
?>
