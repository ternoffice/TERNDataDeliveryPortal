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
					<a href="#a" data-toggle="tab">Identifiers</a>
				</li>
				<li>
					<a href="#a" data-toggle="tab">Locations</a>
				</li>
				<li>
					<a href="#a" data-toggle="tab">Related Objects</a>
				</li>
				<li>
					<a href="#a" data-toggle="tab">Subjects</a>
				</li>
				<li>
					<a href="#a" data-toggle="tab">Related Info</a>
				</li>
			</ul>

			<!-- form-->
			<form class="form-horizontal" id="edit-form">
				<!-- All the tab contents -->
				<div class="tab-content">
					<xsl:call-template name="recordAdminTab"/>
					<xsl:call-template name="namesTab"/>
					<xsl:call-template name="descriptionRightsTab"/>

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
						<input type="text" class="input-xlarge" name="title" value="{$dataSourceID}"/>
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
						<button class="btn btn">
							<i class="icon-refresh"/> Generate Random Key </button>
						<p class="help-inline">
							<small>Key must be unique and is case sensitive</small>
						</p>
					</div>
				</div>

				<div class="control-group">
					<label class="control-label" for="title">Date Modified</label>
					<div class="controls">
						<div class="input-append">
						  <input type="text" class="input-large" name="title" value="{$dateModified}"/>
						  <button class="btn" type="button"><i class="icon-calendar"></i></button>
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
				<div class="main">
					<xsl:apply-templates select="collection/name | activity/name | party/name  | service/name"/>
				</div>
				<div class="aro_box template" type="name">
					<div class="aro_box_display clearfix">
						<a href="javascript:;" class="toggle"><i class="icon-plus"></i></a>
						<h1></h1>
						<div class="control-group">
							<label class="control-label" for="title">Type: </label>
							<div class="controls">
								<input type="text" class="input-small" name="type" placeholder="Type" value="{@type}"/>
								<button class="btn btn-mini btn-danger removeName">
									<i class="icon-remove icon-white"></i>
								</button>
								<p class="help-inline"><small></small></p>
							</div>
						</div>
					</div>
					<div class="aro_box_part">
						<div class="control-group">
							<label class="control-label" for="title">Name Part: </label>
							<div class="controls">
								<input type="text" class="input-small" name="type" placeholder="Type" value=""/>
								<input type="text" class="input-xlarge" name="value" placeholder="Value" value=""/>
								<button class="btn btn-mini btn-danger removeNamePart">
									<i class="icon-remove icon-white"></i>
								</button>
								<p class="help-inline"><small></small></p>
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button class="btn btn-primary">
									<i class="icon-plus icon-white"></i> Add Name Part
								</button>
							</div>
						</div>
					</div>
				</div>
				<button class="btn btn-primary addNew">
					<i class="icon-plus icon-white"></i> Add Name
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
						<button class="btn btn-mini btn-danger removeName">
							<i class="icon-remove icon-white"></i>
						</button>
						<p class="help-inline"><small></small></p>
					</div>
				</div>
			</div>
			<div class="aro_box_part">
				<xsl:apply-templates select="namePart"/>
				<div class="control-group">
					<div class="controls">
						<button class="btn btn-primary">
							<i class="icon-plus icon-white"></i> Add Name Part
						</button>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="namePart">
		<div class="control-group">
			<label class="control-label" for="title">Name Part: </label>
			<div class="controls">
				<input type="text" class="input-small" name="type" placeholder="Type" value="{@type}"/>
				<input type="text" class="input-xlarge" name="value" value="{text()}"/>
				<button class="btn btn-mini btn-danger removeNamePart">
					<i class="icon-remove icon-white"></i>
				</button>
				<p class="help-inline"><small></small></p>
			</div>
		</div>
	</xsl:template>


	<xsl:template name="descriptionRightsTab">
		<div id="descriptions" class="tab-pane">
			<fieldset>
				<legend>Descriptions / Rights</legend>
				<xsl:apply-templates select="collection/description | activity/description | party/description  | service/description"/>
				<xsl:apply-templates select="collection/rights | activity/rights | party/rights  | service/rights"/>

				<div class="aro_box template">
					<h1>Description</h1>
					<p>
						<input type="text" class="input-xlarge" name="type" placeholder="Type" value="{@type}"/>
						<button class="btn btn-mini btn-danger removeDescription">
							<i class="icon-remove icon-white"></i>
						</button>
					</p>
					<p>
						<textarea name="value"><xsl:apply-templates select="text()"/></textarea>
					</p>
					
					<p class="help-inline"><small></small></p>
				</div>	
				<button class="btn btn-primary">
					<i class="icon-plus icon-white"></i> Add Description
				</button>

				<div class="aro_box template">
					<h1>Rights</h1>
					<p>
						<input type="text" class="input-xlarge" name="type" placeholder="Type" value="{@type}"/>
						<button class="btn btn-mini btn-danger removeDescription">
							<i class="icon-remove icon-white"></i>
						</button>
					</p>
					<p>
						<textarea name="value"><xsl:apply-templates select="text()"/></textarea>
					</p>
					
					<p class="help-inline"><small></small></p>
				</div>	
				<button class="btn btn-primary">
					<i class="icon-plus icon-white"></i> Add Rights
				</button>
			</fieldset>
		</div>
	</xsl:template>

	<xsl:template match="collection/description | activity/description | party/description  | service/description">
		<div class="aro_box">
			<h1>Description</h1>
			<p>
				<input type="text" class="input-xlarge" name="type" placeholder="Type" value="{@type}"/>
				<button class="btn btn-mini btn-danger removeDescription">
					<i class="icon-remove icon-white"></i>
				</button>
			</p>
			<p>
				<textarea name="value"><xsl:apply-templates select="text()"/></textarea>
			</p>
			
			<p class="help-inline"><small></small></p>
		</div>	
	</xsl:template>
	
	<xsl:template match="collection/rights | activity/rights | party/rights  | service/rights">
		<div class="aro_box">
			<h1>Rights</h1>
			<p>
				<input type="text" class="input-xlarge" name="type" placeholder="Type" value="{@type}"/>
				<button class="btn btn-mini btn-danger removeDescription">
					<i class="icon-remove icon-white"></i>
				</button>
			</p>
			<p>
				<textarea name="value"><xsl:apply-templates select="text()"/></textarea>
			</p>
			
			<p class="help-inline"><small></small></p>
		</div>	
	</xsl:template>


</xsl:stylesheet>