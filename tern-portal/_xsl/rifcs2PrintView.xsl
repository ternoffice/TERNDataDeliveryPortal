<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ro="http://ands.org.au/standards/rif-cs/registryObjects" exclude-result-prefixes="ro" xmlns:custom="http://youdomain.ext/custom">
    <xsl:output method="html" encoding="UTF-8" indent="no" omit-xml-declaration="yes"/>
    <xsl:include   href ="rifcsParty2View.xsl" />
 <xsl:strip-space elements="*"/>
    <xsl:param name="dataSource" select="//ro:originatingSource"/>
    <xsl:param name="dateCreated"/>
    <xsl:param name="base_url" select="'http://demo'"/>  
    <xsl:param name="orca_view"/>   
    <xsl:param name="key"/>  
    <xsl:variable name="objectClass" >
        <xsl:choose>
            <xsl:when test="//ro:collection">Collection</xsl:when>
            <xsl:when test="//ro:activity">Activity</xsl:when>
            <xsl:when test="//ro:party">Party</xsl:when>
            <xsl:when test="//ro:service">Service</xsl:when>
        </xsl:choose>       
    </xsl:variable>
    <xsl:variable name="objectClassLabel" >
        <xsl:choose>
            <xsl:when test="//ro:collection">Research Data</xsl:when>
            <xsl:when test="//ro:activity">Projects</xsl:when>
            <xsl:when test="//ro:party">People</xsl:when>
            <xsl:when test="//ro:service">Research Systems</xsl:when>
        </xsl:choose>
    </xsl:variable>
	<xsl:variable name="objectClassType" >
		<xsl:choose>
			<xsl:when test="//ro:collection">collections</xsl:when>
			<xsl:when test="//ro:activity">activities</xsl:when>
			<xsl:when test="//ro:party/@type='group'">party_multi</xsl:when>
			<xsl:when test="//ro:party/@type='person'">party_one</xsl:when>			
			<xsl:when test="//ro:service">services</xsl:when>			
		</xsl:choose>		
	</xsl:variable>	


    <xsl:template match="ro:registryObject">
        <!--  We will first set up the breadcrumb menu for the page -->   
        <span id="originating_source" class="hide"><xsl:value-of select="$dataSource"/></span>
        
		<xsl:variable name="group">	
		<xsl:choose>
		<xsl:when test="string-length(./@group)>30">
		<xsl:value-of select="substring(./@group,0,30)"/>...
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="./@group"/>
		</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>	

		<xsl:variable name="theTitle">	
		<xsl:choose>

                    <!--
		<xsl:when test="string-length(//ro:displayTitle)>30">
		<xsl:value-of select="substring(//ro:displayTitle,0,30)"/>...
                -->
                <xsl:when test="string-length(//ro:display_title)>30">
		<xsl:value-of select="substring(//ro:display_title,0,30)"/>...
                
		</xsl:when>
		<xsl:otherwise>
		<!--<xsl:value-of select="//ro:displayTitle"/>-->
                <xsl:value-of select="//ro:display_title"/>

		</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>			

		<!--  the following hidden elements dfine content to be used in further ajax calls --> 
        <div id="group_value" class="hide"><xsl:value-of select="@group"/></div>
        <div id="datasource_key" class="hide"><xsl:value-of select="@originatingSource"/></div>
        <div id="key_value" class="hide"></div>
         <div id="class" class="hide"><xsl:value-of select="$objectClass"/></div>       
        <span id="key" class="hide"><xsl:value-of select="ro:key"/></span>
             
        <xsl:apply-templates select="ro:collection | ro:activity | ro:party | ro:service"/>
    
    </xsl:template>

    <xsl:template match="ro:collection | ro:activity | ro:service">
      		<div id="item-view-print" class="clearfix" itemscope="" itemType="http://schema.org/Thing">
		<div id="left-print">           
 		<xsl:choose>

	        <!--<xsl:when test="ro:displayTitle!=''">-->
                <xsl:when test="ro:display_title!=''">
	        	<!--<xsl:apply-templates select="ro:displayTitle"/>-->
                        <xsl:apply-templates select="ro:display_title"/>

	        </xsl:when>
	         <xsl:otherwise>
	                <div id="displaytitle"><h1><xsl:value-of select="../ro:key"/></h1>
                        <xsl:for-each select="//ro:existenceDates">
        		<xsl:if test="./ro:startDate"><xsl:value-of select="./ro:startDate"/></xsl:if>
        		-
				<xsl:if test="./ro:endDate"><xsl:value-of select="./ro:endDate"/></xsl:if><br/>
			</xsl:for-each>
			
			
                        </div>
	        </xsl:otherwise> 
        </xsl:choose>    
        <div class="clearfix"></div>  

        <xsl:apply-templates select="ro:displayLogo"/>

        <xsl:if test="ro:displayLogo = ''">
            <div class="clearfix"></div>
        

        <!--<xsl:apply-templates select="ro:name[@type='alternative']/ro:displayTitle"/>-->
        <xsl:apply-templates select="ro:name[@type='alternative']/ro:display_title"/>


        <div class="clearfix"></div>
        </xsl:if>
        <xsl:if test="ro:description">
            <div style="position:relative;clear:both;" itemprop="descriptions">
				<xsl:apply-templates select="ro:description[@type= 'brief']" mode="content"/>
				<xsl:apply-templates select="ro:description[@type= 'full']" mode="content"/>
				<xsl:apply-templates select="ro:description[@type= 'significanceStatement']" mode="content"/>		
				<xsl:apply-templates select="ro:description[@type= 'notes']" mode="content"/>	
				<xsl:apply-templates select="ro:description[not(@type =  'notes' or @type =  'significanceStatement' or @type =  'full' or @type =  'brief' or @type =  'logo' or @type =  'rights' or @type =  'accessRights')]" mode="content"/>											
				
            </div>
        </xsl:if>
      <!--  <a href="javascript:void(0);" class="hide">More...</a>-->
   

        <!--<xsl:if test="ro:relatedInfo">-->
        <xsl:if test="ro:related_info">
        <p><b>More Information:</b> </p>
            <!--<xsl:apply-templates select="ro:relatedInfo"/> -->
            <xsl:apply-templates select="ro:related_info"/>

         </xsl:if>
                        
        <xsl:if test="ro:coverage or ro:location/ro:spatial">
            <xsl:variable name="coverageLabel">
            <xsl:choose>
            <xsl:when test="ro:coverage/ro:spatial and ro:location/ro:spatial">
            <xsl:text>Coverage And Location:</xsl:text>
            </xsl:when>
            <xsl:when test="ro:location/ro:spatial">
            <xsl:text>Location:</xsl:text>
            </xsl:when>
             <xsl:when test="ro:coverage/ro:spatial">
            <xsl:text>Coverage:</xsl:text>
            </xsl:when>
            
            </xsl:choose>
            </xsl:variable>
<div>            
            <h2><xsl:value-of select="$coverageLabel"/></h2>
                        
            <xsl:variable name="needMap">   
                <xsl:for-each select="ro:coverage/ro:spatial"> 
             	<xsl:if test="not(./@type) or (./@type!='text' and ./@type!='dcmiPoint')">        	
                      <xsl:text>yes</xsl:text>
               </xsl:if>
               </xsl:for-each>    
             	<xsl:for-each select="ro:location/ro:spatial"> 
             	<xsl:if test="not(./@type) or (./@type!='text' and ./@type!='dcmiPoint')">        	
                      <xsl:text>yes</xsl:text>
               </xsl:if>            
               </xsl:for-each>               
        	</xsl:variable>
<div>      
            <xsl:if test="ro:coverage/ro:spatial | ro:location/ro:spatial">
                <xsl:apply-templates select="ro:coverage/ro:spatial | ro:location/ro:spatial"/>
               	 	<xsl:if test="$needMap!=''"> 
                                <div id="spatial_coverage_map"></div>
                      
                        </xsl:if>   
            </xsl:if> 
 </div>            
 </div>           
            <xsl:if test="ro:coverage/ro:center | ro:location/ro:center">
                <xsl:apply-templates select="ro:coverage/ro:center | ro:location/ro:center"/>
            </xsl:if>   
 <div>        
            <xsl:if test="ro:coverage/ro:temporal/ro:date">
                <h2>Time Period</h2>
                        
                <div>
                <xsl:apply-templates select="ro:coverage/ro:temporal/ro:date"/> 
                </div>
                   
            </xsl:if> 
</div>
        </xsl:if>
        
        <xsl:if test="ro:subject">
<div>            
              <div style="position:relative;clear:both">
            <h2>Subjects</h2>

              </div>  
 <div>
            <xsl:if test="ro:subject/@type='anzsrc-for' or ro:subject/@type='anzsrc-seo' or ro:subject/@type='anzsrc-toa'">

                <p>ANZSRC</p>
                <ul class="subjects commas">
                
                <xsl:for-each select="ro:subject">      
                    <xsl:sort select="./@type"/>
                    <xsl:if test="@type='anzsrc-for' or @type='anzsrc-seo' or @type='anzsrc-toa'">
                        <xsl:apply-templates select="."/>
                    </xsl:if>
                </xsl:for-each>
                </ul>
            </xsl:if>
                
                <xsl:if test="ro:subject[not(@type = 'anzsrc-for' or  @type = 'anzsrc-seo' or  @type = 'anzsrc-toa')]">
                    <p>Keywords</p> 
                    <ul class="subjects commas">
                        <xsl:for-each select="ro:subject">      
                            <xsl:sort select="./@type"/>
                            <xsl:if test="@type!='anzsrc-for'and @type!='anzsrc-seo' and @type!='anzsrc-toa'">
                                <xsl:apply-templates select="."/>
                            </xsl:if>
                        </xsl:for-each>
                    </ul>
                </xsl:if> 
              
 </div>
     
</div>  
        </xsl:if> 

                   
       <xsl:choose>
            <xsl:when test="ro:citationInfo">
  <div>  
                    <h2>Citation</h2>
     
<div>                
                <div id="citation" style="position:relative;clear:both;">
                <xsl:choose>
                    <xsl:when test="ro:citationInfo/ro:citationMetadata">
                        <b>How to Cite this Collection:</b><br />
                       <!--   <a title="Add this article to your Mendeley library" target="_blank">
                       <xsl:attribute name="href">
                        http://www.mendeley.com/import/?url=<xsl:value-of select="ro:citationInfo/ro:citationMetadata/ro:url"/>
                        </xsl:attribute> 
                        <img src="http://www.mendeley.com/graphics/mendeley.png"/></a> -->
                        <xsl:apply-templates select="ro:citationInfo/ro:citationMetadata"/>
                    </xsl:when>
                    <xsl:when test="ro:citationInfo/ro:fullCitation">
                        <b>How to Cite this Collection:</b><br />
                        <xsl:apply-templates select="ro:citationInfo/ro:fullCitation"/>
                    </xsl:when>
                    <xsl:otherwise >
                    <!-- If we have found an empty citation element build the openURL using the object display title -->
                        <span class="Z3988">    
                        <xsl:attribute name="title">
                        <xsl:text>ctx_ver=Z39.88-2004</xsl:text>
                        <xsl:text>&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Adc</xsl:text>
                        <xsl:text>&amp;rfr_id=info%3Asid%2FTERN</xsl:text>

                        <!--<xsl:text>&amp;rft.title=</xsl:text><xsl:value-of select="//ro:displayTitle"/>
                        <xsl:text>&amp;rft.description=</xsl:text><xsl:value-of select="//ro:displayTitle"/>-->
                        <xsl:text>&amp;rft.title=</xsl:text><xsl:value-of select="//ro:display_title"/>
                        <xsl:text>&amp;rft.description=</xsl:text><xsl:value-of select="//ro:display_title"/>

                        </xsl:attribute>
                        </span><span class="Z3988"></span>      
                    </xsl:otherwise>                        
                </xsl:choose>   
                </div>
</div> 
 </div> 
            </xsl:when>

         </xsl:choose>
 
 

        <xsl:if test="ro:identifier[not(@type = 'local')]">
 <div>            
            <div style="position:relative;clear:both;"><h2>Identifier</h2>

          </div>
<div>          
           	 	<div id="identifiers">
  
    	<p> 	
    	<xsl:apply-templates select="ro:identifier[@type='doi']" mode = "doi"/>
    	<xsl:apply-templates select="ro:identifier[@type='ark']" mode = "ark"/>    	
     	<xsl:apply-templates select="ro:identifier[@type='AU-ANL:PEAU']" mode = "nla"/>  
     	<xsl:apply-templates select="ro:identifier[@type='handle']" mode = "handle"/>   
     	<xsl:apply-templates select="ro:identifier[@type='purl']" mode = "purl"/>
    	<xsl:apply-templates select="ro:identifier[@type='uri']" mode = "uri"/> 
 		<xsl:apply-templates select="ro:identifier[not(@type =  'doi' or @type =  'ark' or @type =  'AU-ANL:PEAU' or @type =  'handle' or @type =  'purl' or @type =  'uri' or @type='local')]" mode="other"/>											   	
   		</p>
	
        </div>
  </div>
  
  
  </div> 
        </xsl:if>   


			<div id="connectionsRightBox">
			<div id="connectionsInfoBox" ></div>
			<h2>Connections</h2>
                       
			<div id="connections">
				<img>
				<xsl:attribute name="src"><xsl:value-of select="$base_url"/><xsl:text>/img/ajax-loader.gif</xsl:text></xsl:attribute>
				<xsl:attribute name="class">loading-icon</xsl:attribute>
				<xsl:attribute name="alt">Loading…</xsl:attribute>
				</img>
			</div>
                       
			</div>
                        
                    
        </div>
     
  		<div id="right-print">
	      
 
                         	
	       <xsl:if test="ro:location/ro:address/ro:electronic/@type='url' 
		or ro:rights or ro:location/ro:address/ro:electronic/@type='email'  or ro:location/ro:address/ro:physical">	

              		 	<xsl:if test="ro:location/ro:address/ro:electronic/@type='url'">
				<p><xsl:apply-templates select="ro:location/ro:address/ro:electronic"/></p>	
	 		</xsl:if>
		<div>
			<h2>Rights and Licences</h2>
			<div>
 		
	 		 <xsl:if test="ro:rights">
					<h3>Rights</h3>	
			</xsl:if>
				
			<!-- <xsl:apply-templates select="ro:description[@type = 'accessRights' or @type = 'rights']" mode="right"/>	 -->	
			<xsl:apply-templates select="ro:rights"/>		

		 	<xsl:if test="ro:location/ro:address/ro:electronic/@type='email' or ro:location/ro:address/ro:physical">
		 		<h3>Contacts</h3>
		 		<xsl:if test="ro:location/ro:address/ro:electronic/@type='email'">
					<p><xsl:apply-templates select="ro:location/ro:address/ro:electronic/@type"/></p>	
				</xsl:if>
			 	<xsl:if test="ro:location/ro:address/ro:physical/@type='telephoneNumber'">
					<p><xsl:apply-templates select="ro:location/ro:address/ro:physical"/></p>	
				</xsl:if>				
		 		<xsl:if test="ro:location/ro:address/ro:physical">
					<p><xsl:apply-templates select="ro:location/ro:address/ro:physical"/></p>	
				</xsl:if>				
	 		</xsl:if>			
			                        
			</div>             

		</div>		

		</xsl:if>

								
		 	<xsl:if test="$objectClass='Collection'">
				<div id="seeAlsoRightBox">
				<div id="infoBox" class="hide"></div>
				<h2>Suggested Links</h2>
				<div id="seeAlso">
					<img>
					<xsl:attribute name="src"><xsl:value-of select="$base_url"/><xsl:text>/img/ajax-loader.gif</xsl:text></xsl:attribute>
					<xsl:attribute name="class">loading-icon</xsl:attribute>
					<xsl:attribute name="alt">Loading…</xsl:attribute>
					</img>
				</div>
				</div>
			</xsl:if>
	
		 	<xsl:if test="$objectClass='Party'">
				<div id="seeAlso-Identifier">
				<div id="infoBox" class="hide"></div>
				<h2>Suggested Links</h2>
				<div id="seeAlso-IdentifierBox">
					<img>
					<xsl:attribute name="src"><xsl:value-of select="$base_url"/><xsl:text>/img/ajax-loader.gif</xsl:text></xsl:attribute>
					<xsl:attribute name="class">loading-icon</xsl:attribute>
					<xsl:attribute name="alt">Loading…</xsl:attribute>
					</img>
				</div>
				</div>
			</xsl:if>	
					   
		</div>

 </div>              				
        
    </xsl:template>

<!--  the following templates will format the view page content -->

   <!-- <xsl:template match="ro:displayTitle">   -->
   <xsl:template match="ro:display_title">

        <div id="displaytitle">
        	<h1><xsl:value-of select="."/></h1>
        	<xsl:for-each select="//ro:existenceDates">
        		<xsl:if test="./ro:startDate"><xsl:value-of select="./ro:startDate"/></xsl:if> - <xsl:if test="./ro:endDate"><xsl:value-of select="./ro:endDate"/></xsl:if><br/>
			</xsl:for-each>     
		</div>			
    </xsl:template>
    
    <xsl:template match="ro:displayLogo">   
        <div class="rif_logo" ><img id="party_logo" style="max-width:200px;">
        <xsl:attribute name="src"><xsl:value-of select="."/></xsl:attribute>
        </img>
		</div>    
    </xsl:template> 
    

    <!--<xsl:template match="ro:name[@type='alternative']/ro:displayTitle">   -->
    <xsl:template match="ro:name[@type='alternative']/ro:display_title"> 

        <p class="alt_displayTitle"><xsl:value-of select="."/></p>
    </xsl:template> 
  

   <xsl:template match="ro:title">
        <xsl:value-of select="."/><br />    
    </xsl:template>


    <!--<xsl:template match="ro:relatedInfo/ro:notes">-->
    <xsl:template match="ro:related_info/ro:notes">

        <xsl:value-of select="."/><br />    
    </xsl:template> 
    
    <xsl:template match="ro:spatial">

          <xsl:if test="not(./@type) or (./@type!= 'text' and ./@type!= 'dcmiPoint')">

        <p class="coverage" name="{@type}"><xsl:value-of select="."/></p>

      </xsl:if>
      <xsl:if test="./@type= 'text' or ./@type= 'dcmiPoint'">
     	 <p class="coverage_text"><xsl:value-of select="./@type"/>: <xsl:value-of select="."/></p>
      </xsl:if>     

    </xsl:template>
    
    <xsl:template match="ro:center">
        <p class="spatial_coverage_center"><xsl:value-of select="."/></p>
    </xsl:template>
    
    <xsl:template match="ro:date">  

        <xsl:if test="./@type = 'date_from'">
            From 
        </xsl:if>
        <xsl:if test="./@type = 'date_to'">
            To  
        </xsl:if> 

        <xsl:value-of select="."/>          
    </xsl:template> 
    
    <xsl:template match="ro:subject">  
         <xsl:if test="./@type='anzsrc-for'">
            <!--<li><a href="javascript:void(0);" class="forfourFilter" id="{.}"><xsl:value-of select="."/></a></li>-->
            <li><xsl:value-of select="."/></li>
        </xsl:if>
        <xsl:if test="./@type='anzsrc-seo' or ./@type='anzsrc-toa'">
            <!--<li><a href="javascript:void(0);" class="subjectFilter" id="{.}"><xsl:value-of select="."/></a></li>-->
            <li><xsl:value-of select="."/></li>
        </xsl:if>
        <xsl:if test="./@type != 'anzsrc-for' and ./@type != 'anzsrc-seo' and ./@type!='anzsrc-toa'">
            <!--<li><a href="javascript:void(0);" class="subjectFilter" id="{.}"><xsl:value-of select="."/></a></li>-->
            <li><xsl:value-of select="."/></li>
        </xsl:if>  

      
    </xsl:template>
    

   <!--<xsl:template match="ro:relatedInfo">-->
   <xsl:template match="ro:related_info">

        <p>

   		 <xsl:if test="./ro:title">
         	<xsl:value-of select="./ro:title"/><br />
         </xsl:if>
   		<xsl:apply-templates select="./ro:identifier[@type='doi']" mode = "doi"/>
    	<xsl:apply-templates select="./ro:identifier[@type='ark']" mode = "ark"/>    	
     	<xsl:apply-templates select="./ro:identifier[@type='AU-ANL:PEAU']" mode = "nla"/>  
     	<xsl:apply-templates select="./ro:identifier[@type='handle']" mode = "handle"/>   
     	<xsl:apply-templates select="./ro:identifier[@type='purl']" mode = "purl"/>
    	<xsl:apply-templates select="./ro:identifier[@type='uri']" mode = "uri"/> 
 		<xsl:apply-templates select="./ro:identifier[not(@type =  'doi' or @type =  'ark' or @type =  'AU-ANL:PEAU' or @type =  'handle' or @type =  'purl' or @type =  'uri' or @type = 'local' )]" mode="other"/>			            	
                         
        <xsl:if test="./ro:notes">
             <xsl:apply-templates select="./ro:notes"/>
        </xsl:if>
        </p>        
    </xsl:template>
 
 <xsl:template match="ro:identifier" mode="ark">
ARK: 
      			    <xsl:variable name="theidentifier">    			
            <xsl:choose>
    			    	<xsl:when test="string-length(substring-after(.,'http://'))>0">
    			     		<xsl:value-of select="(substring-after(.,'http://'))"/>
            			</xsl:when>
	     	
            			<xsl:otherwise>
    			     		<xsl:value-of select="."/>
            			</xsl:otherwise>
            		</xsl:choose>
 					</xsl:variable>  
 					<xsl:if test="string-length(substring-after(.,'/ark:/'))>0">    			     
    				<a>
    				<xsl:attribute name="href"><xsl:text>http://</xsl:text> <xsl:value-of select="$theidentifier"/></xsl:attribute>
    				<xsl:attribute name="title"><xsl:text>Resolve this ARK identifier</xsl:text></xsl:attribute>    				
    				<xsl:value-of select="."/>
    				</a>
    				</xsl:if>
    				<xsl:if test="string-length(substring-after(.,'/ark:/'))&lt;1">
    					<xsl:value-of select="."/>
    				</xsl:if>
    				 <br />		 
</xsl:template>
 
 <xsl:template match="ro:identifier" mode="nla">
 NLA: 
       			    <xsl:variable name="theidentifier">    			
    				<xsl:choose>				
    			    	<xsl:when test="string-length(substring-after(.,'nla.gov.au/'))>0">
    			     		<xsl:value-of select="substring-after(.,'nla.gov.au/')"/>
            	</xsl:when>
            	<xsl:otherwise>
    			     		<xsl:value-of select="."/>
    			     	</xsl:otherwise>		
    				</xsl:choose>
 					</xsl:variable>  
 					<xsl:if test="string-length(substring-after(.,'nla.party'))>0">		
    				<a>
    				<xsl:attribute name="href"><xsl:text>http://nla.gov.au/</xsl:text> <xsl:value-of select="$theidentifier"/></xsl:attribute>
    				<xsl:attribute name="title"><xsl:text>View the record for this party in Trove</xsl:text></xsl:attribute>    				
    				<xsl:value-of select="."/>
    				</a> 	<br />
  				</xsl:if> 
  					<xsl:if test="string-length(substring-after(.,'nla.party'))&lt;1">		
   				
    				<xsl:value-of select="."/>
    			<br />
  				</xsl:if> 
 </xsl:template>
 <xsl:template match="ro:identifier" mode="doi">   					
DOI: 
        			    <xsl:variable name="theidentifier">    			
            		<xsl:choose>
    			    	<xsl:when test="string-length(substring-after(.,'doi.org/'))>0">
    			     		<xsl:value-of select="substring-after(.,'doi.org/')"/>
            			</xsl:when>
            			<xsl:otherwise>
                    		<xsl:value-of select="./ro:identifier/@type"/>: <xsl:value-of select="./ro:identifier"/><br />   			
            			</xsl:otherwise>          		
            		</xsl:choose>
 					</xsl:variable>   	  
  					<xsl:if test="string-length(substring-after(.,'10.'))>0">		
      				<a>
    				<xsl:attribute name="href"><xsl:text>http://dx.doi.org/</xsl:text> <xsl:value-of select="$theidentifier"/></xsl:attribute>
    				<xsl:attribute name="title"><xsl:text>Resolve this DOI</xsl:text></xsl:attribute>    				
    				<xsl:value-of select="."/>
    				</a> 		 <br />
  				</xsl:if> 
  					<xsl:if test="string-length(substring-after(.,'10.'))&lt;1">		
   				
    				<xsl:value-of select="."/>
    			<br />
  				</xsl:if> 					 			

    			
 </xsl:template>
 <xsl:template match="ro:identifier" mode="handle">      			
Handle: 
      			    <xsl:variable name="theidentifier">    			
    				<xsl:choose>
     			    	<xsl:when test="string-length(substring-after(.,'hdl:'))>0">
    			     		<xsl:text>http://hdl.handle.net/</xsl:text><xsl:value-of select="substring-after(.,'hdl:')"/>
    			     	</xsl:when> 
      			    	<xsl:when test="string-length(substring-after(.,'hdl.handle.net/'))>0">
    			     		<xsl:text>http://hdl.handle.net/</xsl:text><xsl:value-of select="substring-after(.,'hdl.handle.net/')"/>
    			     	</xsl:when>   			     	     				
    			    	<xsl:when test="string-length(substring-after(.,'http:'))>0">
    			     		<xsl:text></xsl:text><xsl:value-of select="."/>
    			     	</xsl:when>    										     	
    			     	<xsl:otherwise>
    			     		<xsl:text>http://hdl.handle.net/</xsl:text><xsl:value-of select="."/>
           	 	</xsl:otherwise>
           	 </xsl:choose>
 					</xsl:variable>
           
    				<a>
    				<xsl:attribute name="href"> <xsl:value-of select="$theidentifier"/></xsl:attribute>
    				<xsl:attribute name="title"><xsl:text>Resolve this handle</xsl:text></xsl:attribute>    				
    				<xsl:value-of select="."/>
    				</a> 	 
    			<br />
    </xsl:template>
 <xsl:template match="ro:identifier" mode="purl">     			
 	PURL: 
    <xsl:variable name="theidentifier">    			
    <xsl:choose>				
    	<xsl:when test="string-length(substring-after(.,'purl.org/'))>0">
    		<xsl:value-of select="substring-after(.,'purl.org/')"/>
    	</xsl:when>		     	
    	<xsl:otherwise>
    		<xsl:value-of select="."/>
    	</xsl:otherwise>		
    </xsl:choose>
 	</xsl:variable>   	   			
    <a>
    <xsl:attribute name="href"><xsl:text>http://purl.org/</xsl:text> <xsl:value-of select="$theidentifier"/></xsl:attribute>
    <xsl:attribute name="title"><xsl:text>Resolve this purl identifier</xsl:text></xsl:attribute>    				
    <xsl:value-of select="."/>
    </a>  
    	<br /> 
  </xsl:template>
  <xsl:template match="ro:identifier" mode="uri">     			
 	URI: 
   <xsl:variable name="theidentifier">    			
    <xsl:choose>				
    	<xsl:when test="string-length(substring-after(.,'http'))>0">
    		<xsl:value-of select="."/>
    	</xsl:when>		     	
    	<xsl:otherwise>
    		http://<xsl:value-of select="."/>
    	</xsl:otherwise>		
    </xsl:choose>
 	</xsl:variable>   	        			
    <a>
    <xsl:attribute name="href"><xsl:value-of select="$theidentifier"/></xsl:attribute>
    <xsl:attribute name="title"><xsl:text>Resolve this uri</xsl:text></xsl:attribute>    				
    <xsl:value-of select="."/>  
    </a>   		 
   	<br />
  </xsl:template> 
 <xsl:template match="ro:identifier" mode="other">     			 			 	    			 			
   <!--  <xsl:attribute name="name"><xsl:value-of select="./@type"/></xsl:attribute>  -->
   <xsl:choose>
   <xsl:when test="./@type='arc' or ./@type='abn' or ./@type='isil'">
 		<xsl:value-of select="translate(./@type,'abcdefghijklmnopqrstuvwxyz','ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>: <xsl:value-of select="."/>  
   </xsl:when>
   
   <xsl:otherwise>
	<xsl:value-of select="./@type"/>: <xsl:value-of select="."/>
	</xsl:otherwise>
	</xsl:choose>
	<br />
  </xsl:template>  
    
    <xsl:template match="ro:citationInfo/ro:fullCitation">
        <p><xsl:value-of select="."/></p>
        <span class="Z3988">    
        <xsl:attribute name="title">
        <xsl:text>ctx_ver=Z39.88-2004</xsl:text>
        <xsl:text>&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Adc</xsl:text>
        <xsl:text>&amp;rfr_id=info%3Asid%2FTERN</xsl:text>

        <!--<xsl:text>&amp;rft.title=</xsl:text><xsl:value-of select="//ro:displayTitle"/>-->
        <xsl:text>&amp;rft.title=</xsl:text><xsl:value-of select="//ro:display_title"/>

        <xsl:text>&amp;rft.description=</xsl:text><xsl:value-of select="."/>
        </xsl:attribute>
        </span>
                <span class="Z3988">
        </span>     
    </xsl:template>
                
    <xsl:template match="ro:citationInfo/ro:citationMetadata">
     <p>
        <xsl:if test="./ro:contributor">
            <xsl:apply-templates select="ro:contributor"/>
        </xsl:if>
        <xsl:if test="./ro:date">
        (
            <xsl:apply-templates select="//ro:citationMetadata/ro:date"/>               
        )           
        </xsl:if>   
        <xsl:if test="./ro:title != ''">
            <xsl:text> </xsl:text>
            <xsl:value-of select="./ro:title"/>.
        </xsl:if>
        <xsl:if test="./ro:edition != ''">
            <xsl:text> </xsl:text>
            <xsl:value-of select="./ro:edition"/>.
        </xsl:if>   
        <xsl:if test="./ro:placePublished != ''">
            <xsl:text> </xsl:text>      
            <xsl:value-of select="./ro:placePublished"/>.
        </xsl:if>
        <xsl:if test="./ro:publisher != ''">
            <xsl:text> </xsl:text>      
            <xsl:value-of select="./ro:publisher"/>.
        </xsl:if>        
        <xsl:if test="./ro:url != ''">
            <xsl:text> </xsl:text>      
            <xsl:value-of select="./ro:url"/>
        </xsl:if>
        <xsl:if test="./ro:context != ''">
            <xsl:text> </xsl:text>      
            , <xsl:value-of select="./ro:context"/>
        </xsl:if>
        <xsl:if test="./ro:identifier != ''">,         
        	<xsl:apply-templates select="./ro:identifier[@type = 'doi']"  mode="doi"/>	
         	<xsl:apply-templates select="./ro:identifier[@type = 'uri']"  mode="uri"/>	 
         	<xsl:apply-templates select="./ro:identifier[@type = 'URL']"  mode="uri"/>	
           	<xsl:apply-templates select="./ro:identifier[@type = 'url']"  mode="uri"/>	  
            <xsl:apply-templates select="./ro:identifier[@type = 'purl']"  mode="purl"/>	  
            <xsl:apply-templates select="./ro:identifier[@type = 'handle']"  mode="handle"/>	
            <xsl:apply-templates select="./ro:identifier[@type = 'AU-ANL:PEAU']"  mode="nla"/>
            <xsl:apply-templates select="./ro:identifier[@type = 'ark']"  mode="ark"/>  
            <xsl:apply-templates select="./ro:identifier[@type != 'doi' and @type != 'uri' and @type != 'URL' and @type != 'url' and @type != 'purl' and @type != 'handle' and @type != 'AU-ANL:PEAU' and @type != 'ark']"  mode="other"/>				
        </xsl:if>
     	</p>
     	<span class="Z3988">   
        	<xsl:attribute name="title">
        	<xsl:text>ctx_ver=Z39.88-2004</xsl:text>
        	<xsl:text>&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Adc</xsl:text>
        	<xsl:text>&amp;rfr_id=info%3Asid%2FTERN</xsl:text>
        	<xsl:text>&amp;rft.contributor=</xsl:text><xsl:apply-templates select="ro:contributor"/>
        	<xsl:text>&amp;rft.title=</xsl:text><xsl:value-of select="./ro:title"/> 
        	<xsl:text>&amp;rft.place=</xsl:text><xsl:value-of select="./ro:placePublished"/>
        	<xsl:text>&amp;rft_id=</xsl:text><xsl:value-of select="./ro:url"/>
        	<xsl:text>&amp;rft.edition=</xsl:text><xsl:value-of select="./ro:edition"/>.
        	<xsl:text>&amp;rft.description=</xsl:text><xsl:value-of select="./ro:context"/>
        	</xsl:attribute>
    	</span>
    	<span class="Z3988">
    	</span>                                                     
    </xsl:template> 
    
    <xsl:template match="ro:contributor">       
        <xsl:if test="./ro:namePart/@type='family'">
            <xsl:value-of select="./ro:namePart[@type='family']"/>,
        </xsl:if>
        <xsl:if test="./ro:namePart/@type='given'">
            <xsl:value-of select="./ro:namePart[@type='given']"/>.
        </xsl:if>
                <xsl:if test="./ro:namePart/@type='initial' and not(./ro:namePart/@type='given')">
            <xsl:value-of select="./ro:namePart[@type='initial']"/>.
        </xsl:if>   
    </xsl:template> 

    <xsl:template match="//ro:citationInfo/ro:citationMetadata/ro:date">
        <xsl:if test="position()>1">
            <xsl:text>,</xsl:text>
        </xsl:if>       
        <xsl:value-of select="."/> 
    </xsl:template> 
    
	<xsl:template match="ro:location/ro:address/ro:electronic">
		<xsl:if test="./@type='url'">
		<xsl:variable name="url">
		
		<xsl:choose>
		<xsl:when test="string-length(.)>30">
		<xsl:value-of select="substring(.,0,30)"/>...
		</xsl:when>
		<xsl:otherwise>
		<xsl:value-of select="."/>
		</xsl:otherwise>
		</xsl:choose>
		</xsl:variable>	
                
                <xsl:variable name="linkurl">
                    <xsl:value-of select="."/>
                </xsl:variable>
                <xsl:variable name="apos">'</xsl:variable>
                        
		</xsl:if>		
	</xsl:template>
	
	<xsl:template match="ro:location/ro:address/ro:physical">
		<p>
			<xsl:choose>
				<xsl:when test = "./ro:addressPart or ./ro:addressPart!=''">
				
						<xsl:apply-templates select="./ro:addressPart[@type='fullname']"/>	
						<xsl:apply-templates select="./ro:addressPart[@type='organizationname']"/>	
						<xsl:apply-templates select="./ro:addressPart[@type='buildingorpropertyname']"/>		
						<xsl:apply-templates select="./ro:addressPart[@type='flatorunitnumber']"/>		
						<xsl:apply-templates select="./ro:addressPart[@type='floororlevelnumber']"/>	
						<xsl:apply-templates select="./ro:addressPart[@type='lotnumber']"/>	
						<xsl:apply-templates select="./ro:addressPart[@type='housenumber']"/>		
						<xsl:apply-templates select="./ro:addressPart[@type='streetname']"/>		
						<xsl:apply-templates select="./ro:addressPart[@type='postaldeliverynumberprefix']"/>		
						<xsl:apply-templates select="./ro:addressPart[@type='postaldeliverynumbervalue']"/>		
						<xsl:apply-templates select="./ro:addressPart[@type='postaldeliverynumbersuffix']"/>	
						<xsl:apply-templates select="./ro:addressPart[@type='addressline']"/>		
						<xsl:apply-templates select="./ro:addressPart[@type='suburborplaceorlocality']"/>		
						<xsl:apply-templates select="./ro:addressPart[@type='stateorterritory']"/>	
						<xsl:apply-templates select="./ro:addressPart[@type='postcode']"/>	
						<xsl:apply-templates select="./ro:addressPart[@type='country']"/>		
						<xsl:apply-templates select="./ro:addressPart[@type='locationdescriptor']"/>
						<xsl:apply-templates select="./ro:addressPart[@type='deliverypointidentifier']"/>	
						<xsl:apply-templates select="./ro:addressPart[not(@type='organizationname' or @type='fullname' or @type='buildingorpropertyname' or @type='flatorunitnumber' or @type='floororlevelnumber' or @type='lotnumber' or @type='housenumber' or @type='streetname' or @type='postaldeliverynumberprefix' or @type='postaldeliverynumbervalue' or @type='postaldeliverynumbersuffix' or @type='addressline' or @type='suburborplaceorlocality' or @type='stateorterritory' or @type='country' or @type='locationdescriptor' or @type='deliverypointidentifier' or @type='postcode')]"/>	
						<!--xsl:apply-templates select="./ro:addressPart[not(@type='addressLine') or @type!='deliveryPointIdentifier' or @type='locationDescriptor' or @type='country' or @type='stateOrTerritory' or @type='suburbOrPlaceOrLocality' or @type='suburbOrPlaceOrLocality' or @type='addressLine' or @type='postalDeliveryNumberSuffix])"/-->
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="." disable-output-escaping="yes"/><br />			
				</xsl:otherwise>
			</xsl:choose>	
		</p>
	</xsl:template>	
	
	<xsl:template match="ro:addressPart">			
			<xsl:value-of select="." disable-output-escaping="yes"/><br />
	</xsl:template>
	
	<xsl:template match="ro:rights">
			
			<xsl:if test="./@type='rights'"><h4>Rights statement</h4></xsl:if>
			<xsl:if test="./@type='accessRights'"><h4>Access rights</h4></xsl:if>
			<xsl:if test="./@type='licence'"><h4>Licence</h4></xsl:if>				
			<p class="rights"><xsl:value-of select="." disable-output-escaping="yes"/>
			<xsl:if test="./@rightsUri"><br />
			<a target="_blank">
			<xsl:attribute name="href"><xsl:value-of select="./@rightsUri"/></xsl:attribute><xsl:value-of select="./@rightsUri"/></a>
			</xsl:if>	
			</p>		
	</xsl:template>
	<xsl:template match="ro:description" mode="content">     
        <div><xsl:attribute name="class"><xsl:value-of select="@type"/></xsl:attribute>
           <p><xsl:value-of select="." disable-output-escaping="yes"/></p>
        </div>
	</xsl:template> 
	
	
	
	<xsl:template match="ro:location/ro:address/ro:electronic/@type">		
		<xsl:if test=".='email'">	
	  		<xsl:value-of select=".."/><br />
		</xsl:if>				
	</xsl:template>  
	      
</xsl:stylesheet>