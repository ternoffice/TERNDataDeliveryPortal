<?php

// Include required files and initialisation.
require '../../_includes/init.php';
require '../orca/orca_init.php';

// Set the Content-Type header.
header("Content-Type: text/xml; charset=UTF-8", true);

// BEGIN: XML Response
// =============================================================================
print('<?xml version="1.0" encoding="UTF-8"?>'."\n");
print('<OpenSearchDescription xmlns="http://a9.com/-/spec/opensearch/1.1/">'."\n");
print('<ShortName>'.esc(eINSTANCE_TITLE_SHORT.' '.eAPP_TITLE)." Ecosystem registry Search</ShortName>\n");
print('<Description>Searches the '.esc(eINSTANCE_TITLE.' '.eAPP_TITLE)." Registry for ecosystem records metadata</Description>\n");
print('<Contact>'.esc(eCONTACT_EMAIL)."</Contact>\n");
print("<Tags>Collection Party Service Activity</Tags>\n");
print("<SyndicationRight>open</SyndicationRight>\n");
print('<Url type="application/xml" template="'.esc(eAPP_ROOT).'/search?term={searchTerms}" />'."\n");
print("</OpenSearchDescription>\n");
// END: XML Response
// =============================================================================
//require '../../_includes/finish.php';
?>

