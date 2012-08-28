<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:extRif="http://ands.org.au/standards/rif-cs/extendedRegistryObjects"
	exclude-result-prefixes="extRif">
	<xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
	<xsl:param name="dataSource"/>
	<xsl:param name="dateCreated"/>
	<xsl:template match="registryObject">
		<div class="">
			<!-- tabs -->
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#admin" data-toggle="tab">Record Administration</a>
				</li>
				<li>
					<a href="#names" data-toggle="tab">Names</a>
				</li>
				<li>
					<a href="#descriptions" data-toggle="tab">Descriptions/Rights</a>
				</li>
				<li>
					<a href="#identifiers" data-toggle="tab">Identifiers</a>
				</li>
				<li>
					<a href="#a" data-toggle="tab">Locations</a>
				</li>
				<li>
					<a href="#relatedobjects" data-toggle="tab">Related Objects</a>
				</li>
				<li>
					<a href="#subjects" data-toggle="tab">Subjects</a>
				</li>
				<li>
					<a href="#relatedinfos" data-toggle="tab">Related Info</a>
				</li>
			</ul>

			<!-- form-->
			<form class="form-horizontal" id="edit-form">
				<!-- All the tab contents -->
				<div class="tab-content">
					<xsl:call-template name="recordAdminTab"/>
					<xsl:call-template name="namesTab"/>
					<xsl:call-template name="descriptionRightsTab"/>
					<xsl:call-template name="subjectsTab"/>
					<xsl:call-template name="identifiersTab"/>
					<xsl:call-template name="relatedobjectsTab"/>
					<xsl:call-template name="relatedinfosTab"/>

					<div class="modal hide" id="myModal">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h3>Alert</h3>
						</div>
						<div class="modal-body"/>
						<div class="modal-footer"> </div>
					</div>
				</div>


			</form>
			<div class="aro_toolbar">
					<div class="message">
						Auto-saved: 5 seconds ago...
					</div>
					<div class="aro_controls">
						

						<div class="btn-toolbar">		
							<button class="btn btn-info" id="master_export_xml">
							  <i class="icon-download-alt icon-white"></i> Export XML
							</button>		  

							<div class="btn-group dropup">
							<button class="btn btn-primary"> <i class="icon-download-alt icon-white"></i> Save &amp; Validate</button>
								<button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
									<span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="javascript:;">Save &amp; Publish</a></li>
									<li><a href="javascript:;">Save &amp; Exit</a></li>
									<li><a href="javascript:;">Save &amp; Validate</a></li>
									<li><a href="javascript:;">Quick Save</a></li>
								</ul>
							</div>

						  <div class="btn-group">
						  	<a class="btn"><i class="icon-chevron-left"></i></a>
						  	<a class="btn"><i class="icon-chevron-right"></i></a>
						  </div>

						</div>
					</div>		
					<div class="clearfix"></div>	
				</div>
			<xsl:call-template name="blankTemplate"/>
		</div>
	</xsl:template>


	<xsl:template name="recordAdminTab">
		<!-- Record Admin-->
		<div id="admin" class="tab-pane active">
			<fieldset>
				<legend>Record Administration</legend>
				<xsl:variable name="ro_type">
					<xsl:apply-templates
						select="collection/@type | activity/@type | party/@type  | service/@type"/>
				</xsl:variable>
				<xsl:variable name="dataSourceID">
					<xsl:value-of select="extRif:extendedMetadata/extRif:dataSourceID"/>
				</xsl:variable>
				<xsl:variable name="dateModified">
					<xsl:apply-templates
						select="collection/@dateModified | activity/@dateModified | party/@dateModified  | service/@dateModified"
					/>
				</xsl:variable>

				<div class="control-group">
					<label class="control-label" for="title">Type</label>
					<div class="controls">
						<div class="input-prepend">
							<button class="btn triggerTypeAhead" type="button"><i class="icon-chevron-down"></i></button>
						  	<input type="text" class="input-large" name="title" value="{$ro_type}"/>
						</div>
						<p class="help-inline">
							<small/>
						</p>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="title">Data Source</label>
					<div class="controls">
						<select id="data_sources_select"/>
						<input type="text" id="data_source_id_value" class="input-small hide" name="title" value="{$dataSourceID}"/>
						<p class="help-inline">
							<small/>
						</p>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="title">Group</label>
					<div class="controls">
						<div class="input-prepend">
							<button class="btn triggerTypeAhead" type="button"><i class="icon-chevron-down"></i></button>
						  	<input type="text" class="input-large" name="title" value="{@group}"/>
						</div>
						<p class="help-inline">
							<small/>
						</p>
					</div>
				</div>

				<div class="control-group warning">
					<label class="control-label" for="title">Key</label>
					<div class="controls">
						<input type="text" class="input-xlarge" name="title" value="{key}"/>
						<button class="btn btn" id="generate_random_key">
							<i class="icon-refresh"/> Generate Random Key
						</button>
						<p class="help-inline">
							<small>Key must be unique and is case sensitive</small>
						</p>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="title">Date Modified</label>
					<div class="controls">
						<div class="input-append">
						  <input type="text" class="input-large datepicker" name="title" value="{$dateModified}"/>
						  <button class="btn triggerDatePicker" type="button"><i class="icon-calendar"></i></button>
						  <p class="help-inline">
								<small/>
							</p>
						</div>
					</div>
				</div>

			</fieldset>
		</div>
	</xsl:template>


	<xsl:template name="namesTab">
		<div id="names" class="tab-pane">
			<fieldset>
				<legend>Names</legend>

				<xsl:apply-templates select="collection/name | activity/name | party/name  | service/name"/>
				<div class="separate_line"/>
				
				<button class="btn btn-primary addNew" type="name">
					<i class="icon-plus icon-white"></i> Add Name
				</button>
				<button class="btn export_xml btn-info">
					Export XML fragment
				</button>
			</fieldset>
		</div>
	</xsl:template>

	<xsl:template
		match="collection/@type | activity/@type | party/@type  | service/@type | collection/@dateModified | activity/@dateModified | party/@dateModified  | service/@dateModified">
		<xsl:value-of select="."/>
	</xsl:template>
	
	<xsl:template match="collection/name | activity/name | party/name  | service/name">
		<div class="aro_box" type="name">
			<div class="aro_box_display clearfix">
				<a href="javascript:;" class="toggle"><i class="icon-plus"></i></a>
				<h1></h1>
				<div class="control-group">
					<label class="control-label" for="title">Type: </label>
					<div class="controls">
						<input type="text" class="input-small" name="type" placeholder="Type" value="{@type}"/>
						<button class="btn btn-mini btn-danger remove">
							<i class="icon-remove icon-white"></i>
						</button>
						<p class="help-inline"><small></small></p>
					</div>
				</div>
			</div>
			<xsl:apply-templates select="namePart"/>
			<div class="separate_line"/>
			<button class="btn btn-primary addNew hide" type="namePart">
				<i class="icon-plus icon-white"></i> Add Name Part
			</button>
		</div>
	</xsl:template>
	
	<xsl:template match="namePart">
		<div class="aro_box_part hide" type="namePart">
			<div class="control-group">
				<label class="control-label" for="title">Name Part: </label>
				<div class="controls">
					<input type="text" class="input-small" name="type" placeholder="Type" value="{@type}"/>
					<input type="text" class="input-xlarge" name="value" value="{text()}"/>
					<button class="btn btn-mini btn-danger remove">
						<i class="icon-remove icon-white"></i>
					</button>
					<p class="help-inline"><small></small></p>
				</div>
			</div>
		</div>
	</xsl:template>


	<xsl:template name="descriptionRightsTab">
		<div id="descriptions" class="tab-pane">
			<fieldset>
				<legend>Descriptions / Rights</legend>
				<xsl:apply-templates select="collection/description | activity/description | party/description  | service/description"/>
				<xsl:apply-templates select="collection/rights | activity/rights | party/rights  | service/rights"/>

				
				<div class="separate_line"/>
				<button class="btn btn-primary addNew" type="description">
					<i class="icon-plus icon-white"></i> Add Description
				</button>
				<button class="btn btn-primary addNew" type="rights">
					<i class="icon-plus icon-white"></i> Add Rights
				</button>
				<button class="btn export_xml btn-info">
					Export XML fragment
				</button>
			</fieldset>
		</div>
	</xsl:template>

	<xsl:template match="collection/description | activity/description | party/description  | service/description">
		<div class="aro_box" type="description">
			<h1>Description</h1>
			<p>
				<input type="text" class="input-xlarge" name="type" placeholder="Type" value="{@type}"/>
				<button class="btn btn-mini btn-danger remove">
					<i class="icon-remove icon-white"></i>
				</button>
			</p>
			<p>
				<textarea name="value" class="editor"><xsl:apply-templates select="text()"/></textarea>
			</p>
			
			<p class="help-inline"><small></small></p>
		</div>
	</xsl:template>
	
	<xsl:template match="collection/rights | activity/rights | party/rights  | service/rights">
		<div class="aro_box">
			<h1>Rights</h1>
			<p>
				<input type="text" class="input-xlarge" name="type" placeholder="Type" value="{@type}"/>
				<button class="btn btn-mini btn-danger remove">
					<i class="icon-remove icon-white"></i>
				</button>
			</p>
			<p>
				<textarea name="value" class="editor"><xsl:apply-templates select="text()"/></textarea>
			</p>
			
			<p class="help-inline"><small></small></p>
		</div>
	</xsl:template>

	<xsl:template name="subjectsTab">
		<div id="subjects" class="tab-pane">
			<fieldset>
				<legend>Subjects</legend>
				
				<xsl:apply-templates select="collection/subject | activity/subject | party/subject  | service/subject"/>
				<div class="separate_line"/>
				
				<button class="btn btn-primary addNew" type="subject">
					<i class="icon-plus icon-white"></i> Add Subject
				</button>
				<button class="btn export_xml btn-info">
					Export XML fragment
				</button>
			</fieldset>
		</div>
	</xsl:template>
	
	
	<xsl:template name="identifiersTab">
		<div id="identifiers" class="tab-pane">
			<fieldset>
				<legend>Identifiers</legend>
				
				<xsl:apply-templates select="collection/identifier | activity/identifier | party/identifier  | service/identifier"/>
				<div class="separate_line"/>
				
				<button class="btn btn-primary addNew" type="identifier">
					<i class="icon-plus icon-white"></i> Add Identifier
				</button>
				<button class="btn export_xml btn-info">
					Export XML fragment
				</button>
			</fieldset>
		</div>
	</xsl:template>
	
	<xsl:template name="relatedobjectsTab">
		<div id="relatedobjects" class="tab-pane">
			<fieldset>
				<legend>Related Objects</legend>
				
				<xsl:apply-templates select="collection/relatedObject | activity/relatedObject | party/relatedObject  | service/relatedObject"/>
				<div class="separate_line"/>
				
				<button class="btn btn-primary addNew" type="relatedobject">
					<i class="icon-plus icon-white"></i> Add Related Object
				</button>
				<button class="btn export_xml btn-info">
					Export XML fragment
				</button>
			</fieldset>
		</div>
	</xsl:template>
	
	<xsl:template name="relatedinfosTab">
		<div id="relatedinfos" class="tab-pane">
			<fieldset>
				<legend>Related Infos</legend>			
				<xsl:apply-templates select="collection/relatedinfo | activity/relatedinfo | party/relatedinfo  | service/relatedinfo"/>
				<div class="separate_line"/>			
				<button class="btn btn-primary addNew" type="relatedinfo">
					<i class="icon-plus icon-white"></i> Add related Info
				</button>
				<button class="btn export_xml btn-info">
					Export XML fragment
				</button>
			</fieldset>
		</div>
		
	</xsl:template>
	
	<xsl:template match="collection/relatedinfo | activity/relatedinfo | party/relatedinfo  | service/relatedinfo">
		<div class="aro_box" type="relatedInfo">
			<div class="aro_box_display clearfix">
				<div class="controls">
					<div class="controls">
						<input type="text" class="input-small" name="type" placeholder="Type" value="{@type}"/>
						<input type="text" class="input-xlarge" name="identifier" value="{identifier/text()}"/>
						<input type="text" class="input-xlarge" name="identifier_type" value="{identifier/@type}"/>
						<input type="text" class="input-xlarge" name="title" value="{title/text()}"/>
						<input type="text" class="input-xlarge" name="notes" value="{notes/text()}"/>
						<button class="btn btn-mini btn-danger remove">
							<i class="icon-remove icon-white"></i>
						</button>
						<p class="help-inline"><small></small></p>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	
	
	<xsl:template match="collection/subject  | activity/subject  | party/subject   | service/subject">
		<div class="aro_box" type="subject">
			<div class="aro_box_display clearfix">
				<div class="controls">
					Type: <input type="text" class="input-small" name="type" placeholder="Type" value="{@type}"/>
					Value: <input type="text" class="input-xlarge" name="value" value="{text()}"/>
					<button class="btn btn-mini btn-danger remove">
						<i class="icon-remove icon-white"></i>
					</button>
					<p class="help-inline"><small></small></p>
				</div>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="collection/identifier  | activity/identifier  | party/identifier   | service/identifier">
		<div class="aro_box" type="identifier">
			<div class="aro_box_display clearfix">
				<div class="controls">
					<input type="text" class="input-small" name="type" placeholder="Type" value="{@type}"/>
					<input type="text" class="input-xlarge" name="value" value="{text()}"/>
					<button class="btn btn-mini btn-danger remove">
						<i class="icon-remove icon-white"></i>
					</button>
					<p class="help-inline"><small></small></p>
				</div>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="collection/relatedObject | activity/relatedObject | party/relatedObject  | service/relatedObject">
		<div class="aro_box" type="relatedobject">
			<div class="aro_box_display clearfix">
				<a href="javascript:;" class="toggle"><i class="icon-minus"></i></a>
				<h1>Related Object Title goes here <small>relation</small></h1>
				<div class="control-group">
					<div class="controls">
						<button class="btn btn-mini btn-danger remove">
							<i class="icon-remove icon-white"></i>
						</button>
						<p class="help-inline"><small></small></p>
					</div>
				</div>
			</div>
			
			<div class="aro_box_part">
				<div class="control-group">
					<label class="control-label" for="title">Key: </label>
					<div class="controls">
						<input type="text" class="input-xlarge" name="key" value="{key}"/>
					</div>
				</div>
			</div>
					
			<xsl:apply-templates select="relation"/>
			<div class="separate_line"/>
			<button class="btn btn-primary addNew" type="relation">
				<i class="icon-plus icon-white"></i> Add Relation
			</button>
				
			
		</div>
	</xsl:template>
	
	
	<xsl:template match="relation">
		<div class="aro_box_part" type="relation">
			<div class="control-group">
				<label class="control-label" for="title">Relation: </label>
				<div class="controls">
					<input type="text" class="input-small" name="type" placeholder="Type" value="{@type}"/>
					<input type="text" class="input-xlarge" name="description" placeholder="Description" value="{description}"/>
					<input type="text" class="input-xlarge" name="url" placeholder="Url" value="{url}"/>
					<button class="btn btn-mini btn-danger remove">
						<i class="icon-remove icon-white"></i>
					</button>
					<p class="help-inline"><small></small></p>
				</div>
			</div>
		</div>
		
	</xsl:template>

	<!-- BLANK TEMPLATE -->
	<xsl:template name="blankTemplate">

		<div class="aro_box template" type="name">
			<div class="aro_box_display clearfix">				
				<a href="javascript:;" class="toggle"><i class="icon-minus"></i></a>
				<h1></h1>
				<div class="control-group">
					<label class="control-label" for="title">Type: </label>
					<div class="controls">
						<input type="text" class="input-small" name="type" placeholder="Type" value="{@type}"/>
						<button class="btn btn-mini btn-danger remove">
							<i class="icon-remove icon-white"></i>
						</button>
						<p class="help-inline"><small></small></p>
					</div>
				</div>
			</div>
			<div class="aro_box_part" type="namePart">
				<div class="control-group">
					<label class="control-label" for="title">Name Part: </label>
					<div class="controls">
						<input type="text" class="input-small" name="type" placeholder="Type" value=""/>
						<input type="text" class="input-xlarge" name="value" placeholder="Value" value=""/>
						<button class="btn btn-mini btn-danger remove">
							<i class="icon-remove icon-white"></i>
						</button>
						<p class="help-inline"><small></small></p>
					</div>
				</div>
			</div>
			<div class="separate_line"/>
			<button class="btn btn-primary addNew" type="namePart">
				<i class="icon-plus icon-white"></i> Add Name Part
			</button>
		</div>

		<div class="aro_box_part template" type="namePart">
			<div class="control-group">
				<label class="control-label" for="title">Name Part: </label>
				<div class="controls">
					<input type="text" class="input-small" name="type" placeholder="Type" value=""/>
					<input type="text" class="input-xlarge" name="value" placeholder="Value" value=""/>
					<button class="btn btn-mini btn-danger remove">
						<i class="icon-remove icon-white"></i>
					</button>
					<p class="help-inline"><small></small></p>
				</div>
			</div>
		</div>

		<div class="aro_box template" type="description">
			<h1>Description</h1>
			<p>
				<input type="text" class="input-xlarge" name="type" placeholder="Type" value=""/>
				<button class="btn btn-mini btn-danger remove">
					<i class="icon-remove icon-white"></i>
				</button>
			</p>
			<p>
				<textarea name="value" class=""></textarea>
			</p>
			
			<p class="help-inline"><small></small></p>
		</div>

		<div class="aro_box template" type="rights">
			<h1>Rights</h1>
			<p>
				<input type="text" class="input-xlarge" name="type" placeholder="Type" value=""/>
				<button class="btn btn-mini btn-danger remove">
					<i class="icon-remove icon-white"></i>
				</button>
			</p>
			<p>
				<textarea name="value" class=""></textarea>
			</p>
			
			<p class="help-inline"><small></small></p>
		</div>
		
		<div class="aro_box template" type="subject">
			<div class="aro_box_display  clearfix">
				<div class="controls">
					<input type="text" class="input-small" name="type" placeholder="Type" value=""/>
					<input type="text" class="input-xlarge" name="value" value=""/>
					<button class="btn btn-mini btn-danger remove">
						<i class="icon-remove icon-white"></i>
					</button>
					<p class="help-inline"><small></small></p>
				</div>
			</div>
		</div>
		
		<div class="aro_box template" type="identifier">
			<div class="aro_box_display  clearfix">
				<div class="controls">
					<input type="text" class="input-small" name="type" placeholder="Type" value=""/>
					<input type="text" class="input-xlarge" name="value" value=""/>
					<button class="btn btn-mini btn-danger remove">
						<i class="icon-remove icon-white"></i>
					</button>
					<p class="help-inline"><small></small></p>
				</div>
			</div>
		</div>
		
		<div class="aro_box template" type="relatedobject">
			<div class="aro_box_display clearfix">
				<a href="javascript:;" class="toggle"><i class="icon-minus"></i></a>
				<h1>Related Object Title goes here <small>relation</small></h1>
				<div class="control-group">
					<div class="controls">
						<button class="btn btn-mini btn-danger remove">
							<i class="icon-remove icon-white"></i>
						</button>
						<p class="help-inline"><small></small></p>
					</div>
				</div>
			</div>
			
			<div class="aro_box_part">
				<div class="control-group">
					<label class="control-label" for="title">Key: </label>
					<div class="controls">
						<input type="text" class="input-xlarge" name="key" value=""/>
					</div>
				</div>
			</div>
					
			
			<div class="separate_line"/>
			<button class="btn btn-primary addNew" type="relation">
				<i class="icon-plus icon-white"></i> Add Relation
			</button>
		</div>
		
		<div class="aro_box_part template" type="relation">
			<div class="control-group">
				<label class="control-label" for="title">Relation: </label>
				<div class="controls">
					<input type="text" class="input-small" name="type" placeholder="Type" value=""/>
					<input type="text" class="input-xlarge" name="description" placeholder="Description" value=""/>
					<input type="text" class="input-xlarge" name="url" placeholder="Url" value=""/>
					<button class="btn btn-mini btn-danger remove">
						<i class="icon-remove icon-white"></i>
					</button>
					<p class="help-inline"><small></small></p>
				</div>
			</div>
		</div>
		
		<div class="aro_box template" type="relatedInfo">
			<div class="aro_box_display clearfix">
				<div class="controls">
					<div class="controls">
						<input type="text" class="input-small" name="type" placeholder="Type" value=""/>
						<input type="text" class="input-xlarge" name="identifier" placeholder="Identifier" value=""/>
						<input type="text" class="input-xlarge" name="identifier_type" placeholder="Identifier Type" value=""/>
						<input type="text" class="input-xlarge" name="title" placeholder="Title" value=""/>
						<input type="text" class="input-xlarge" name="notes" placeholder="Notes" value=""/>
						<button class="btn btn-mini btn-danger remove">
							<i class="icon-remove icon-white"></i>
						</button>
						<p class="help-inline"><small></small></p>
					</div>
				</div>
			</div>
		</div>

	</xsl:template>
	


</xsl:stylesheet>
