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
//session_start();
//$_SESSION["timeout"] += 30000;
<<<<<<< HEAD

=======
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
require '../../_includes/init.php';
require '../orca_init.php';
require '../_functions/assoc_array2xml.php';

<<<<<<< HEAD


$task = getQueryValue('task');
$keyValue = trim(getQueryValue('key'));
$dataSourceValue = rawurldecode(getQueryValue('data_source'));
$firstLoad = getQueryValue('firstLoad');
$defaultKeys = array('collection','party','activity','service');
if($task == 'get')
	{
=======
$task = getQueryValue('task');
$keyValue = trim(getQueryValue('key'));
$dataSourceValue = urldecode(getQueryValue('data_source'));
$firstLoad = getQueryValue('firstLoad');
$defaultKeys = array('collection','party','activity','service');
if($task == 'get')
	{	
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
		include('_processes/get.php');
	}
else if($task == 'save')
	{
		include('_processes/save.php');
	}
<<<<<<< HEAD
else if($task == 'preview')
	{
		include('_processes/preview.php');
	}
	// AJAX responses to the manage my records screen
else if ($task == 'manage_my_records')
	{
		include('_processes/manage_my_records.php');
	}

=======

	// AJAX responses to the manage my records screen
else if ($task == 'manage_my_records')
	{
		include('_processes/manage_my_records.php');		
	}
	
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
else if($task == 'validate')
	{
		include('_processes/validate.php');
	}

else if($task ==  'delete')
<<<<<<< HEAD
	{
		include('_processes/delete.php');
	}

else if($task ==  'add')
	{
		include('_processes/add.php');
	}

else if($task ==  'getvocab')
	{
		include('_processes/getvocab.php');
	}

=======
	{	
		include('_processes/delete.php');
	}
	
else if($task ==  'add')
	{
		include('_processes/add.php');
	}	
	
else if($task ==  'getvocab')
	{
		include('_processes/getvocab.php');
	}	
	
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
else if($task ==  'getSubjectVocab')
	{
		include('_processes/get_subject_vocab.php');

<<<<<<< HEAD
	}

else if($task ==  'searchRelated')
	{
		include('_processes/search_related.php');
	}
else if($task ==  'keepalive')
	{
		// Dummy method, session is refreshed when COSI init is called at the top of this script
=======
	}	
	
else if($task ==  'searchRelated')
	{
		include('_processes/search_related.php');
	}	
else if($task ==  'keepalive')
	{
		// Dummy method, session is refreshed when COSI init is called at the top of this script	
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
	}
else if($task ==  'getRelatedClass')
	{
		include('_processes/get_related_class.php');
	}
else if($task ==  'related_object_preview')
{
	include('_processes/related_object_preview.php');
}
else if($task ==  'checkKey')
<<<<<<< HEAD
	{
=======
	{	
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
		include('_processes/check_key.php');
	}
else if ($task == 'getGroups')
	{
<<<<<<< HEAD
		include('_processes/get_groups.php');


	}
else if($task ==  'fetch_record')
	{
		include('_processes/fetch_record.php');

	}
else if($task ==  'recover_record')
	{

=======
		include('_processes/get_groups.php');	
		
			
	}	
else if($task ==  'fetch_record')
	{
		include('_processes/fetch_record.php');
		
	}
else if($task ==  'recover_record')
	{
		
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
		include('_processes/recover_record.php');

	}
else if($task ==  'flag_draft')
<<<<<<< HEAD
	{
		include('_processes/flag_draft.php');
	}
else if($task ==  'flag_regobj')
	{
		include('_processes/flag_regobj.php');
		syncKey($keyValue, $dataSourceValue);
	}
else if($task ==  'getRegistryTasks')
	{
		include('_processes/get_registry_tasks.php');
	}
else if($task ==  'dataSourceBackgroundStatus')
	{
		include('_processes/get_ds_background_status.php');
	}

if($task ==  'flag_draft' || $task ==  'recover_record' || $task == 'validate')
{
	//$result = addDraftToSolrIndex($keyValue);
	syncDraftKey($keyValue, $dataSourceValue);
}

if($task ==  'delete' || $task ==  'add')
{
	$hash = sha1($keyValue.$dataSourceValue);
	$result = deleteSolrHashKey($hash);
}

=======
	{	
		include('_processes/flag_draft.php');
	}
else if($task ==  'flag_regobj')
	{	
		include('_processes/flag_regobj.php');
	}
	
	
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
require '../../_includes/finish.php';

function saveDraftRegistryObject($rifcs, $objectClass, $dataSource ,$keyValue, $title, $status='DRAFT', $maintainAttributes = false)
{
	$registryObjects = new DomDocument();
	$registryObjects->loadXML($rifcs);
	$xs = 'rif';
	//var_dump($registryObjects);

	$gXPath = new DOMXpath($registryObjects);
	$defaultNamespace = $gXPath->evaluate('/*')->item(0)->namespaceURI;

	$gXPath->registerNamespace($xs, $defaultNamespace);
<<<<<<< HEAD

	$registryObject = $gXPath->evaluate("$xs:registryObject")->item(0);

	$draft_owner = getLoggedInUser();

	$draft_key = substr($gXPath->evaluate("$xs:key", $registryObject)->item(0)->nodeValue, 0, 512);

=======
		
	$registryObject = $gXPath->evaluate("$xs:registryObject")->item(0);
			
	$draft_owner = getLoggedInUser();
	
	$draft_key = substr($gXPath->evaluate("$xs:key", $registryObject)->item(0)->nodeValue, 0, 512);
	
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
	if ($objectClass == null)
	{
		$objectClass = $gXPath->evaluate("$xs:collection|$xs:party|$xs:activity|$xs:service", $registryObject)->item(0)->nodeName;
	}

	$objectClass = strtolower(substr($objectClass, 0, 1)) . substr($objectClass, 1);
<<<<<<< HEAD

	$draft_class = strtoupper(substr($objectClass, 0, 1)) . substr($objectClass, 1);

	$draft_group = $registryObject->getAttribute("group");

	$draft_type = $gXPath->evaluate("$xs:$objectClass", $registryObject)->item(0)->getAttribute("type");

	$draft_data_source = $dataSource; //$gXPath->evaluate("$xs:originatingSource", $registryObject)->item(0)->nodeValue;

	$date_created = date('Y-m-d H:i:s');

	// If the object already exists, maintain creation and flagged details
	$flagged = false;
	if ($r = getRegistryObject($draft_key)) { $flagged = $r[0]['flag'] == 't'; $date_created = $r[0]['created_when']; }
	if ($d = getDraftRegistryObject($draft_key,$draft_data_source)) { $flagged = $d[0]['flag'] == 't'; $date_created = $d[0]['date_created']; }

	// Last date modified is NOW!
	$date_modified = date('Y-m-d H:i:s');

=======
	
	$draft_class = strtoupper(substr($objectClass, 0, 1)) . substr($objectClass, 1);
	
	$draft_group = $registryObject->getAttribute("group");

	$draft_type = $gXPath->evaluate("$xs:$objectClass", $registryObject)->item(0)->getAttribute("type");
	
	$draft_data_source = $dataSource; //$gXPath->evaluate("$xs:originatingSource", $registryObject)->item(0)->nodeValue;
	
	$date_created = date('Y-m-d H:i:s'); 
	
	// If the object already exists, maintain creation and flagged details
	$flagged = false;
	if ($r = getRegistryObject($draft_key)) { $flagged = $r[0]['flag'] == 't'; $date_created = $r[0]['created_when']; } 
	if ($d = getDraftRegistryObject($draft_key,$draft_data_source)) { $flagged = $d[0]['flag'] == 't'; $date_created = $d[0]['date_created']; }

	// Last date modified is NOW!
	$date_modified = date('Y-m-d H:i:s'); 
	
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
	// Are we keeping all the pre-existing details?
	if ($maintainAttributes)
	{
		$d = getDraftRegistryObject($draft_key,$draft_data_source);
		if ($d)
		{
			$date_modified = $d[0]['date_modified'];
			$draft_owner = $d[0]['draft_owner'];
			$status = $d[0]['status'];
		}
	}
<<<<<<< HEAD


	$qualityTestResult = '';
	$errorCount = '0';
	$warningCount = '0';
	insertDraftRegistryObject($draft_owner, $draft_key, $draft_class, $draft_group, $draft_type, $title, $draft_data_source, $date_created, $date_modified, $rifcs, $qualityTestResult, $errorCount, $warningCount, $status);

	// Maintain the flagged status
	if ($flagged)
	{
		setDraftFlag($draft_key, $draft_data_source, true);
	}

	if($keyValue != '' && $keyValue != $draft_key)
	{
		//deleteDraftRegistryObject($dataSource, $keyValue);
		//deleteSetofSolrDrafts($keys, $data_source_key);
		//queueSyncDataSource($data_source_key);
	}

=======
	
	
	$qualityTestResult = runQualityCheck($rifcs,$objectClass, $draft_data_source, 'html');
	$errorCount = substr_count($qualityTestResult, 'class="error"');                              
	$warningCount = substr_count($qualityTestResult, 'class="warning"') + substr_count($qualityTestResult, 'class="info"');   
	insertDraftRegistryObject($draft_owner, $draft_key, $draft_class, $draft_group, $draft_type, $title, $draft_data_source, $date_created, $date_modified, $rifcs, $qualityTestResult, $errorCount, $warningCount, $status);
	
	// Maintain the flagged status
	if ($flagged) 
	{
		setDraftFlag($draft_key, $draft_data_source, true);
	}
	
	if($keyValue != $draft_key)
	{
		deleteDraftRegistryObject($dataSource, $keyValue);		
	}
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
}


function createPreview($rifcs, $objectClass, $dataSource, $dateCreated)
{
	//print("<pre>");
	//print_r($rifcs);
	//print("</pre>");
	//print($objectClass);
<<<<<<< HEAD
	$relatedXml = getRelatedXml($dataSource,$rifcs,$objectClass);
=======
	$relatedXml = getRelatedXml($dataSource,$rifcs,$objectClass);		
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
	$registryObjects = new DomDocument();
	$registryObjects->loadXML($relatedXml);
	$rifcs2preview = new DomDocument();
	$rifcs2preview->load('../_xsl/rifcs2preview.xsl');
	$proc = new XSLTProcessor();
	$proc->setParameter('', 'dataSource', $dataSource);
	$proc->setParameter('','dateCreated', $dateCreated);
	$proc->importStyleSheet($rifcs2preview);
	$preview = $proc->transformToXML($registryObjects);
<<<<<<< HEAD
	return $preview;
=======
	return $preview;	
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
}

function replace_unicode_escape_sequence($match) {
    return mb_convert_encoding(pack('H*', $match[1]), 'UTF-8', 'UTF-16BE');
}

function replace_unicode_escape_sequence2($match) {
    return mb_convert_encoding(pack('H*', $match[1]), 'UTF-8');
}

function rmdGetName($registryObjectKey)
{
	$name = '';
	$names = getNames($registryObjectKey);
	if( $names )
	{
		for( $i = 0; $i < count($names); $i++ )
<<<<<<< HEAD
		{
=======
		{		
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
			if( $i != 0 )
			{
				$name .= ' '.gCHAR_MIDDOT.' ';
			}
			$name .= $names[$i]['value'];
		}
	}
	return $name;
}

<<<<<<< HEAD


=======
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
?>
