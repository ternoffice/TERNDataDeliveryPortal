<?php
/*
Copyright 2009 The Australian National University
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*******************************************************************************/
// Include required files and initialisation.
require '../../_includes/init.php';

require '../orca_init.php';

// Import the stylesheet for this page
importApplicationStylesheet(eAPP_ROOT.'orca/_styles/add_registry_object.css');
importApplicationStylesheet(eAPP_ROOT.'orca/_styles/jquery-ui-1.8.9.custom.css');

// Page processing
// -----------------------------------------------------------------------------
<<<<<<< HEAD
<<<<<<< HEAD
$keyValue = getQueryValue('key');
=======
$keyValue = getQueryValue('key');	
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
$keyValue = getQueryValue('key');
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
$readOnly = isset($_GET['readOnly']);

if ($readOnly)
$action = 'View ';
elseif ($keyValue)
$action = 'Edit ';
<<<<<<< HEAD
<<<<<<< HEAD
else
=======
else 
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
else
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
$action = 'Add ';
// -----------------------------------------------------------------------------
// Begin the XHTML response. Any redirects must occur before this point.
require '../../_includes/header.php';
// BEGIN: Page Content
// =============================================================================
?>

<<<<<<< HEAD
<<<<<<< HEAD
<script type="text/javascript" src="<?php print eAPP_ROOT ?>orca/_javascript/jquery-ui-1.8.9.custom.min.js"></script>
=======
<script type="text/javascript" src="<?php print eAPP_ROOT ?>orca/_javascript/jquery-ui-1.8.9.custom.min.js"></script>	
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
<script type="text/javascript" src="<?php print eAPP_ROOT ?>orca/_javascript/jquery-ui-1.8.9.custom.min.js"></script>
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
<script type="text/javascript" src="<?php print ePROTOCOL ?>://maps.google.com/maps/api/js?sensor=false&libraries=drawing"></script>
<script type="text/javascript" src="<?php print eAPP_ROOT ?>orca/_javascript/orca_dhtml.js"></script>
<script type="text/javascript" src="<?php print eAPP_ROOT ?>orca/_javascript/regmydata_dhtml.js"></script>
<script type="text/javascript" src="<?php print eAPP_ROOT ?>orca/_javascript/map_control.js"></script>
<script type="text/javascript" src="<?php print eAPP_ROOT ?>orca/_javascript/form2json.js"></script>
<script type="text/javascript" src="<?php print eAPP_ROOT ?>ckeditor/ckeditor.js"></script>
<script type="text/javascript">vcSetImagePath('<?php print gORCA_IMAGE_ROOT ?>_controls/_vocab_control/');</script>
<script type="text/javascript">mctInit('<?php print gORCA_IMAGE_ROOT ?>_controls/_map_control/');</script>
<script type="text/javascript">

	var tabs = new Array();
<<<<<<< HEAD
<<<<<<< HEAD
	// Tabs which should be created for this page, including the name of the tab and the link to the Content Provider's Guide
	// which will be displayed when the user selects the [?] help button.
=======
	// Tabs which should be created for this page, including the name of the tab and the link to the Content Provider's Guide 
	// which will be displayed when the user selects the [?] help button. 
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
	// Tabs which should be created for this page, including the name of the tab and the link to the Content Provider's Guide
	// which will be displayed when the user selects the [?] help button.
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
	tabs["#mandatoryInformation"] = {name:"Record Administration", cpg:"http://ands.org.au/guides/cpguide/cpgcollection.html"};
	tabs["#name"] = {name:"Name/Title", cpg:"http://ands.org.au/guides/cpguide/cpgname.html"};
	tabs["#description"] = {name:"Descriptions/Rights",cpg:"http://ands.org.au/guides/cpguide/cpgdescription.html"};
	tabs["#identifier"] = {name:"Identifiers", cpg:"http://ands.org.au/guides/cpguide/cpgidentifiers.html"};
	tabs["#location"] = {name:"Locations",cpg:"http://ands.org.au/guides/cpguide/cpglocationintro.html"};
	tabs["#relatedObject"] = {name:"Related Objects",cpg:"http://ands.org.au/guides/cpguide/cpgrelatedobject.html"};
	tabs["#subject"] = {name:"Subjects",cpg:"http://ands.org.au/guides/cpguide/cpgsubject.html"};
	tabs["#existenceDates"] = {name:"Existence Dates",cpg:"http://ands.org.au/guides/cpguide/cpgexistencedates.html"};
//	tabs["#coverage"] = {name:"Coverage",cpg:"http://ands.org.au/guides/cpguide/cpgcoverage.html", cError:false , cWarning:false};
	tabs["#relatedInfo"] = {name:"Related Info",cpg:"http://ands.org.au/guides/cpguide/cpgrelatedinfo.html"};
	tabs["#accessPolicy"] = {name:"Access Policy",cpg:"http://ands.org.au/guides/cpguide/cpgservice.html"};
	<?php
<<<<<<< HEAD
<<<<<<< HEAD

			if ($readOnly)
=======
			
			if ($readOnly) 
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======

			if ($readOnly)
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
			{
				echo 'tabs["#preview"] = {name:"Preview Draft",cpg:"http://ands.org.au/guides/content-providers-guide.html"};';
			}
			else
			{
				echo 'tabs["#preview"] = {name:"<img id=\"saveButton\" src=\"'. eAPP_ROOT . 'orca/_images/save.png\" style=\"padding-top:4px;\" alt=\"Save and Preview this Draft\" /> Save Draft",cpg:"http://ands.org.au/guides/content-providers-guide.html"};';
			}
<<<<<<< HEAD
<<<<<<< HEAD

	?>
	function quagmire_reset()
=======
			
	?>
	function quagmire_reset() 
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======

	?>
	function quagmire_reset()
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
	{
		quagmire_init();
		//Required List
		quagmire_append('REQ_PRIMARY_NAME', REQUIRED,'At least one primary name is required for the Service record.');
<<<<<<< HEAD
<<<<<<< HEAD
		quagmire_append('REQ_RELATED_OBJECT_COLLECTION', REQUIRED,'The Service must be related to at least one Collection record.');
		//quagmire_append('REQ_ACCESS_POLICY', REQUIRED);

		//Recommended List
		quagmire_append('REC_RELATED_OBJECT_PARTY', RECOMMENDED,'It is recommended that the Service be related to at least one Party record.');
		quagmire_append('REC_LOCATION_ADDRESS_ELECTRONIC', RECOMMENDED,'At least one electronic address is required for the Service if available.'); //Required if available
		quagmire_append('REC_DESCRIPTION_FULL', RECOMMENDED,'At least one description (brief and/or full) is recommended for the Service.');
=======
		quagmire_append('REQ_RELATED_OBJECT_COLLECTION', REQUIRED,'The Service must be related to at least one Collection record.');	
=======
		quagmire_append('REQ_RELATED_OBJECT_COLLECTION', REQUIRED,'The Service must be related to at least one Collection record.');
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
		//quagmire_append('REQ_ACCESS_POLICY', REQUIRED);

		//Recommended List
		quagmire_append('REC_RELATED_OBJECT_PARTY', RECOMMENDED,'It is recommended that the Service be related to at least one Party record.');
		quagmire_append('REC_LOCATION_ADDRESS_ELECTRONIC', RECOMMENDED,'At least one electronic address is required for the Service if available.'); //Required if available
<<<<<<< HEAD
		quagmire_append('REC_DESCRIPTION_FULL', RECOMMENDED,'At least one description (brief and/or full) is recommended for the Service. The description must be longer than 9 characters.');				
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
		quagmire_append('REC_DESCRIPTION_FULL', RECOMMENDED,'At least one description (brief and/or full) is recommended for the Service.');
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
	}
	quagmire_reset();
</script>

<<<<<<< HEAD
<<<<<<< HEAD
<input type="hidden" id="baseRDAURL" value="<?php print "http://" . $host . "/" . $rda_root; ?>" />
<input type="hidden" id="baseURL" value="<?php print eAPP_ROOT . "orca/" ?>" />
<input type="hidden" id="elementSourceURL" value="<?php print eAPP_ROOT . "orca/fetch_element.php" ?>" />
<input type="hidden" id="elementCategory" value="service" />
<input type="hidden" id="contributor_page" value="" name="contributor_page"/>

=======
=======
<input type="hidden" id="baseRDAURL" value="<?php print "http://" . $host . "/" . $rda_root; ?>" />
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
<input type="hidden" id="baseURL" value="<?php print eAPP_ROOT . "orca/" ?>" />
<input type="hidden" id="ternURL" value="<?php print eTERN_ROOT ?>" />
<input type="hidden" id="elementSourceURL" value="<?php print eAPP_ROOT . "orca/fetch_element.php" ?>" />
<input type="hidden" id="elementCategory" value="service" />
<<<<<<< HEAD
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
<input type="hidden" id="contributor_page" value="" name="contributor_page"/>

>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f

<div id="mmr_datasource_alert" style="display:none;">
	<div id="mmr_datasource_alert_title" class="clearfix">
		<div style="float:left;"><img src="<?php echo eAPP_ROOT; ?>_images/_logos/logo_ANDS.gif" alt="Australian National Data Service Online Services"></div>
		<div style="margin-top:18px; margin-left:5px; float:left;">Message</div>
	</div>
	<div id="mmr_datasource_alert_msg">
	</div>
<<<<<<< HEAD
<<<<<<< HEAD
	<!-- input type="button" onclick="location.reload();" value="Continue" style="vertical-align:bottom;"/-->
=======
	<input type="button" onclick="location.reload();" value="Continue" style="vertical-align:bottom;"/>
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
	<!-- input type="button" onclick="location.reload();" value="Continue" style="vertical-align:bottom;"/-->
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
</div>

<form id="registry_object_add" action="registry_object_add.php" method="post">

<div id="formMetadata">
</div>


<input type="hidden" id="object.objectClass" name="object.objectClass" value="Service" />

<<<<<<< HEAD
<<<<<<< HEAD
<table id="outer-table" summary="<?php print $action ?> Registry Object">
	<tbody>
		<tr>

		<td id="content-cell">

			<div class="heading" style="width:95%"><h3><span id="heading_action"><?php print $action ?></span>Service</h3>

=======
<table id="outer-table" summary="<?php print $action ?> Registry Object">	
=======
<table id="outer-table" summary="<?php print $action ?> Registry Object">
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
	<tbody>
		<tr>

		<td id="content-cell">

			<div class="heading" style="width:95%"><h3><span id="heading_action"><?php print $action ?></span>Service</h3>
<<<<<<< HEAD
			
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======

>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
			<div id="options_bar">
					<div id="status_bar">
						Status: <span id="status_span"></span>
					</div>
<<<<<<< HEAD
<<<<<<< HEAD


					<div id="tool_bar">
						You are currently viewing this record in Read Only mode.
						<input id="enableBtn" type="button" value="Enable Editing" disabled="disabled" /><br/>
						<span style="float:right;">or go back to <a href="<?php print eAPP_ROOT . "orca/manage/my_records.php?data_source=" . getQueryValue('data_source'); ?>">Manage My Records</a></span>
					</div>

=======
				
					
=======


>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
					<div id="tool_bar">
						You are currently viewing this record in Read Only mode.
						<input id="enableBtn" type="button" value="Enable Editing" disabled="disabled" /><br/>
						<span style="float:right;">or go back to <a href="<?php print eAPP_ROOT . "orca/manage/my_records.php?data_source=" . getQueryValue('data_source'); ?>">Manage My Records</a></span>
					</div>
<<<<<<< HEAD
					
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======

>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
				</div>
				<br/>
				<div id="button_bar">
				</div>
			</div>
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f

			<div id="table-cell">

				<div id="rmd_interface">
<<<<<<< HEAD
					<ul id="tabList" class="tabs">
					</ul>
					<div id="panel_container">
					</div>




					<div id="formButtons">

					</div>

				</div>

				<div id="rmd_loading"></div>
				<div id="rmd_scripts"></div>

			</div>
		</td>


		</tr>
=======
			
			<div id="table-cell">	
				
				<div id="rmd_interface">	
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
					<ul id="tabList" class="tabs">
					</ul>
					<div id="panel_container">
					</div>




					<div id="formButtons">

					</div>

				</div>

				<div id="rmd_loading"></div>
				<div id="rmd_scripts"></div>

			</div>
		</td>
<<<<<<< HEAD
	
			
		</tr>		
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======


		</tr>
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
	</tbody>
</table>

</form>

<<<<<<< HEAD
<<<<<<< HEAD
<script type="text/javascript">
 getRemoteElement("#formButtons", "buttons");
 <?php if ($readOnly) { echo "userMode = 'readOnly';disableEditing();$('#tool_bar').show();"; } ?>
=======
<script type="text/javascript"> 
 getRemoteElement("#formButtons", "buttons"); 
 <?php if ($readOnly) { echo "userMode = 'readOnly';disableEditing();$('#tool_bar').show();"; } ?> 
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
<script type="text/javascript">
 getRemoteElement("#formButtons", "buttons");
 <?php if ($readOnly) { echo "userMode = 'readOnly';disableEditing();$('#tool_bar').show();"; } ?>
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
</script>

<?php
// =============================================================================
// END: Page Content
// Complete the XHTML response.
require '../../_includes/footer.php';
require '../../_includes/finish.php';
