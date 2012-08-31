<?xml version="1.0" encoding="UTF-8"?>
<<<<<<< HEAD
<<<<<<< HEAD
<xsl:stylesheet xmlns:ro="http://ands.org.au/standards/rif-cs/registryObjects" xmlns:extRif="http://ands.org.au/standards/rif-cs/extendedRegistryObjects" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="ro extRif">

=======
<xsl:stylesheet xmlns:ro="http://ands.org.au/standards/rif-cs/registryObjects" xmlns:extRif="http://ands.org.au/standards/rif-cs/ExtendedregistryObjects" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="ro extRif">
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
<xsl:stylesheet xmlns:ro="http://ands.org.au/standards/rif-cs/registryObjects" xmlns:extRif="http://ands.org.au/standards/rif-cs/extendedRegistryObjects" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" exclude-result-prefixes="ro extRif">

>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
    <xsl:output indent="yes" />
    <xsl:strip-space elements="*"/>
<xsl:template match="/">
    <xsl:apply-templates/>
</xsl:template>   
    
 <xsl:template match="ro:registryObjects">
     <add>
<<<<<<< HEAD
<<<<<<< HEAD
    <xsl:apply-templates select="ro:registryObject"/>
     </add>
 </xsl:template> 

    <xsl:template match="ro:registryObject">
        <doc>
        <xsl:variable name="roKey" select="ro:key"/>
            <xsl:apply-templates select="ro:key"/>

        <xsl:choose>
			<xsl:when test="extRif:extendedMetadata">
	        	<xsl:apply-templates select="extRif:extendedMetadata/extRif:keyHash"/>
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:status"/>
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:reverseLinks"/> 
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:searchBaseScore"/>
	 			<xsl:apply-templates select="extRif:extendedMetadata/extRif:registryDateModified"/>
	            <xsl:apply-templates select="ro:originatingSource"/>
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:dataSourceKey"/> 
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:dataSourceKeyHash"/> 
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:displayTitle"/> 
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:listTitle"/>  
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:flag"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:warning_count"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:error_count"/>
     			<xsl:apply-templates select="extRif:extendedMetadata/extRif:url_slug"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:manually_assessed_flag"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:gold_status_flag"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:quality_level"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:feedType"/>   
                <xsl:apply-templates select="extRif:extendedMetadata/extRif:lastModifiedBy"/>             	
        	</xsl:when>
        	<xsl:otherwise>
	        	<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:keyHash"/>
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:status"/>
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:reverseLinks"/> 
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:searchBaseScore"/>
	 			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:registryDateModified"/>
	            <xsl:apply-templates select="ro:originatingSource"/>
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:dataSourceKey"/> 
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:dataSourceKeyHash"/> 
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:displayTitle"/> 
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:listTitle"/>
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:flag"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:warning_count"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:error_count"/>
     			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:url_slug"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:manually_assessed_flag"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:gold_status_flag"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:quality_level"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:feedType"/>
                <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:lastModifiedBy"/>
      			
        	</xsl:otherwise>
        </xsl:choose>
=======
    <xsl:apply-templates/>
=======
    <xsl:apply-templates select="ro:registryObject"/>
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
     </add>
 </xsl:template> 

    <xsl:template match="ro:registryObject">
        <doc>
        <xsl:variable name="roKey" select="normalize-space(ro:key)"/>
            <xsl:apply-templates select="ro:key"/>

<<<<<<< HEAD
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
        <xsl:choose>
			<xsl:when test="extRif:extendedMetadata">
	        	<xsl:apply-templates select="extRif:extendedMetadata/extRif:keyHash"/>
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:status"/>
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:reverseLinks"/> 
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:searchBaseScore"/>
	 			<xsl:apply-templates select="extRif:extendedMetadata/extRif:registryDateModified"/>
	            <xsl:apply-templates select="ro:originatingSource"/>
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:dataSourceKey"/> 
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:dataSourceKeyHash"/> 
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:displayTitle"/> 
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:listTitle"/>  
	            <xsl:apply-templates select="extRif:extendedMetadata/extRif:flag"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:warning_count"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:error_count"/>
     			<xsl:apply-templates select="extRif:extendedMetadata/extRif:url_slug"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:manually_assessed_flag"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:gold_status_flag"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:quality_level"/>
      			<xsl:apply-templates select="extRif:extendedMetadata/extRif:feedType"/>   
                <xsl:apply-templates select="extRif:extendedMetadata/extRif:lastModifiedBy"/>             	
        	</xsl:when>
        	<xsl:otherwise>
	        	<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:keyHash"/>
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:status"/>
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:reverseLinks"/> 
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:searchBaseScore"/>
	 			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:registryDateModified"/>
	            <xsl:apply-templates select="ro:originatingSource"/>
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:dataSourceKey"/> 
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:dataSourceKeyHash"/> 
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:displayTitle"/> 
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:listTitle"/>
	            <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:flag"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:warning_count"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:error_count"/>
     			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:url_slug"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:manually_assessed_flag"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:gold_status_flag"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:quality_level"/>
      			<xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:feedType"/>
                <xsl:apply-templates select="following-sibling::extRif:extendedMetadata[@key = $roKey]/extRif:lastModifiedBy"/>
      			
        	</xsl:otherwise>
        </xsl:choose>
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f

            <xsl:element name="field">
                <xsl:attribute name="name">group</xsl:attribute>
                <xsl:value-of select="@group"/>
            </xsl:element>  
            <xsl:apply-templates select="ro:collection | ro:party | ro:activity | ro:service"/>

        </doc>
    </xsl:template> 
   
    <xsl:template match="ro:key">
        <xsl:element name="field">
            <xsl:attribute name="name">key</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
    <xsl:template match="extRif:urlSlug">
        <xsl:element name="field">
            <xsl:attribute name="name">url_slug</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
	
	
<<<<<<< HEAD
=======
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
    <xsl:template match="extRif:keyHash">
        <xsl:element name="field">
            <xsl:attribute name="name">key_hash</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f

    <xsl:template match="extRif:flag">
        <xsl:element name="field">
            <xsl:attribute name="name">flag</xsl:attribute>
            <xsl:choose>
            	<xsl:when test=". = ''">0</xsl:when>
            	<xsl:otherwise>
            		<xsl:value-of select="."/>
            	</xsl:otherwise>
            </xsl:choose>
        </xsl:element>       
    </xsl:template>

    <xsl:template match="extRif:warning_count">
        <xsl:element name="field">
            <xsl:attribute name="name">warning_count</xsl:attribute>
            <xsl:choose>
            	<xsl:when test=". = ''">0</xsl:when>
            	<xsl:otherwise>
            		<xsl:value-of select="."/>
            	</xsl:otherwise>
            </xsl:choose>
        </xsl:element>       
    </xsl:template>

    <xsl:template match="extRif:error_count">
        <xsl:element name="field">
            <xsl:attribute name="name">error_count</xsl:attribute>
            <xsl:choose>
            	<xsl:when test=". = ''">0</xsl:when>
            	<xsl:otherwise>
            		<xsl:value-of select="."/>
            	</xsl:otherwise>
            </xsl:choose>
        </xsl:element>       
    </xsl:template>

    <xsl:template match="extRif:url_slug">
        <xsl:element name="field">
            <xsl:attribute name="name">url_slug</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>

    <xsl:template match="extRif:manually_assessed_flag">
        <xsl:element name="field">
            <xsl:attribute name="name">manually_assessed_flag</xsl:attribute>
			<xsl:choose>
            	<xsl:when test=". = ''">0</xsl:when>
            	<xsl:otherwise>
            		<xsl:value-of select="."/>
            	</xsl:otherwise>
            </xsl:choose>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="extRif:gold_status_flag">
        <xsl:element name="field">
            <xsl:attribute name="name">gold_status_flag</xsl:attribute>
			<xsl:choose>
            	<xsl:when test=". = ''">0</xsl:when>
            	<xsl:otherwise>
            		<xsl:value-of select="."/>
            	</xsl:otherwise>
            </xsl:choose>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="extRif:quality_level">
        <xsl:element name="field">
            <xsl:attribute name="name">quality_level</xsl:attribute>
            <xsl:choose>
            	<xsl:when test=". = ''">0</xsl:when>
            	<xsl:otherwise>
            		<xsl:value-of select="."/>
            	</xsl:otherwise>
            </xsl:choose>
        </xsl:element>       
    </xsl:template>

    <xsl:template match="extRif:feedType">
        <xsl:element name="field">
            <xsl:attribute name="name">feed_type</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>

    <xsl:template match="extRif:lastModifiedBy">
        <xsl:element name="field">
            <xsl:attribute name="name">last_modified_by</xsl:attribute>
            <xsl:choose>
                <xsl:when test=". = 'SYSTEM'">Harvester</xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>       
    </xsl:template>
    
<<<<<<< HEAD
=======
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
    <xsl:template match="extRif:status">
        <xsl:element name="field">
            <xsl:attribute name="name">status</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="extRif:searchBaseScore">
        <xsl:element name="field">
            <xsl:attribute name="name">search_base_score</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f


	<xsl:template match="extRif:registryDateModified">
        <xsl:element name="field">
            <xsl:attribute name="name">date_modified</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
<<<<<<< HEAD
=======
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
    
    <xsl:template match="extRif:reverseLinks">
        <xsl:element name="field">
            <xsl:attribute name="name">reverse_links</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="ro:originatingSource">
        <xsl:element name="field">
            <xsl:attribute name="name">originating_source</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="extRif:dataSourceKey">
        <xsl:element name="field">
            <xsl:attribute name="name">data_source_key</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>   
   
    <xsl:template match="extRif:dataSourceKeyHash">
        <xsl:element name="field">
            <xsl:attribute name="name">data_source_key_hash</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="extRif:displayTitle">
        <xsl:element name="field">
<<<<<<< HEAD
<<<<<<< HEAD
            <xsl:attribute name="name">display_title</xsl:attribute>
=======
            <xsl:attribute name="name">display_itle</xsl:attribute>
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
            <xsl:attribute name="name">display_title</xsl:attribute>
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="extRif:listTitle">
        <xsl:element name="field">
            <xsl:attribute name="name">list_title</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
   
    <xsl:template match="ro:collection | ro:party | ro:activity | ro:service">
        <xsl:element name="field">
            <xsl:attribute name="name">class</xsl:attribute>
            <xsl:value-of select="local-name()"/>
        </xsl:element>  
        <xsl:element name="field">
            <xsl:attribute name="name">type</xsl:attribute>
            <xsl:value-of select="@type"/>
        </xsl:element>  
<<<<<<< HEAD
<<<<<<< HEAD
        <!--xsl:element name="field">
            <xsl:attribute name="name">date_modified</xsl:attribute>
            <xsl:value-of select="@dateModified"/>
        </xsl:element-->  
=======
        <xsl:element name="field">
            <xsl:attribute name="name">date_modified</xsl:attribute>
            <xsl:value-of select="@dateModified"/>
        </xsl:element>  
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
        <!--xsl:element name="field">
            <xsl:attribute name="name">date_modified</xsl:attribute>
            <xsl:value-of select="@dateModified"/>
        </xsl:element-->  
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
        <xsl:apply-templates select="ro:identifier" mode="value"/>
        <xsl:apply-templates select="ro:identifier" mode="type"/>
        <xsl:apply-templates select="ro:name"/>
        
        <xsl:apply-templates select="ro:subject" mode="value"/>
        <xsl:apply-templates select="ro:subject" mode="resolved_value"/>
        <xsl:apply-templates select="ro:subject" mode="type"/>
<<<<<<< HEAD
<<<<<<< HEAD
        <xsl:apply-templates select="ro:subject" mode="vocab_uri"/>
        
        <xsl:apply-templates select="ro:subject[@type='anzsrc-for']" mode="code"/> <!--tern -->
                
=======
        <xsl:apply-templates select="ro:subject" mode="vocab_uri"/>
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
        <xsl:apply-templates select="extRif:broaderSubject" mode="value"/>
        <xsl:apply-templates select="extRif:broaderSubject" mode="resolved_value"/>
        <xsl:apply-templates select="extRif:broaderSubject" mode="type"/>
        <xsl:apply-templates select="extRif:broaderSubject" mode="vocab_uri"/>
        <xsl:apply-templates select="extRif:rights[@licence_group!='']" mode="licence_group"/>        
        <xsl:choose>
        	<xsl:when test="extRif:description">
        	   	<xsl:apply-templates select="extRif:description" mode="value"/>
        		<xsl:apply-templates select="extRif:description" mode="type"/>
        	</xsl:when>
        	<xsl:otherwise>
        	   	<xsl:apply-templates select="ro:description" mode="value"/>
        		<xsl:apply-templates select="ro:description" mode="type"/>
        	</xsl:otherwise>
        </xsl:choose>

<<<<<<< HEAD
=======
        
        <xsl:apply-templates select="extRif:description" mode="value"/>
        <xsl:apply-templates select="extRif:description" mode="type"/>
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
        
        <xsl:apply-templates select="ro:displayTitle"/>
        <xsl:apply-templates select="ro:listTitle"/>
        
        <xsl:apply-templates select="ro:location"/>
        <xsl:apply-templates select="ro:coverage"/>
        
        <xsl:apply-templates select="ro:relatedObject"/>
        <xsl:apply-templates select="ro:relatedInfo"/>
    </xsl:template>
    
    <xsl:template match="ro:location">
        <xsl:element name="field">
            <xsl:attribute name="name">location</xsl:attribute>
            <xsl:apply-templates/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="ro:relatedInfo">
    <xsl:element name="field">
        <xsl:attribute name="name">related_info</xsl:attribute>
        <xsl:apply-templates/>
    </xsl:element>       
    </xsl:template>
    
    <xsl:template match="ro:relatedInfo/*">
            <xsl:value-of select="."/><xsl:text> </xsl:text>
    </xsl:template>
    
    <!-- 
    
    <relatedObject>
    <key>fa2e8fcd8be5337d3b1a64c9af2de5f197920d2a</key>
    <relation extRif:type="Point of contact" type="pointOfContact"/>
    <extRif:relatedObjectClass>party</extRif:relatedObjectClass>
    <extRif:relatedObjectType>group</extRif:relatedObjectType>
    <extRif:relatedObjectListTitle> CSIRO Division of Marine and Atmospheric Research - Hobart </extRif:relatedObjectListTitle>
    <extRif:relatedObjectDisplayTitle>CSIRO Division of Marine and Atmospheric Research - Hobart
    </extRif:relatedObjectDisplayTitle>
    </relatedObject>
    
    -->
    <xsl:template match="ro:relatedObject">

            <xsl:apply-templates/>
<<<<<<< HEAD
<<<<<<< HEAD
      
    </xsl:template>
     <xsl:template match="ro:relatedObject/ro:relation/ro:description">
    <xsl:element name="field">
        <xsl:attribute name="name">related_object_relation_description</xsl:attribute>
            <xsl:value-of select="."/>.....      
    </xsl:element>  
    </xsl:template>      
=======
       
    </xsl:template>
    
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
      
    </xsl:template>
     <xsl:template match="ro:relatedObject/ro:relation/ro:description">
    <xsl:element name="field">
        <xsl:attribute name="name">related_object_relation_description</xsl:attribute>
            <xsl:value-of select="."/>.....      
    </xsl:element>  
    </xsl:template>      
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
    <xsl:template match="ro:relatedObject/ro:key">
        <xsl:element name="field">
            <xsl:attribute name="name">related_object_key</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="ro:relatedObject/extRif:relatedObjectClass">
        <xsl:element name="field">
            <xsl:attribute name="name">related_object_class</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="ro:relatedObject/extRif:relatedObjectType">
        <xsl:element name="field">
            <xsl:attribute name="name">related_object_type</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="ro:relatedObject/extRif:relatedObjectListTitle">
        <xsl:element name="field">
            <xsl:attribute name="name">related_object_list_title</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="ro:relatedObject/extRif:relatedObjectDisplayTitle">
        <xsl:element name="field">
<<<<<<< HEAD
<<<<<<< HEAD
            <xsl:attribute name="name">related_object_display_title</xsl:attribute>
=======
            <xsl:attribute name="name">related_object_diplay_title</xsl:attribute>
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
            <xsl:attribute name="name">related_object_display_title</xsl:attribute>
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
        
    <xsl:template match="ro:relatedObject/ro:relation">
    <xsl:element name="field">
        <xsl:attribute name="name">related_object_relation</xsl:attribute>
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
        <xsl:choose>
        	<xsl:when test="@extRif:type">
        		 <xsl:value-of select="@extRif:type"/>
        	</xsl:when>
        	<xsl:otherwise>
        		<xsl:value-of select="@type"/>
        	</xsl:otherwise>
        </xsl:choose>       
<<<<<<< HEAD
    </xsl:element>  
    <xsl:element name="field">
        <xsl:attribute name="name">related_object_relation_description</xsl:attribute>
            <xsl:value-of select="."/>      
    </xsl:element>    
    </xsl:template>
    
 
    <xsl:template match="ro:coverage/ro:temporal/extRif:date[@type = 'dateFrom'] | ro:coverage/ro:temporal/extRif:date[@type = 'dateTo']">

	        <xsl:element name="field">	            

				<xsl:if test="@type = 'dateFrom'">
					<xsl:attribute name="name">date_from</xsl:attribute>
				</xsl:if>
				<xsl:if test="@type = 'dateTo'">
					<xsl:attribute name="name">date_to</xsl:attribute>
				</xsl:if>
	            <xsl:value-of select="."/>           
	        </xsl:element>     

    </xsl:template>
    
    <xsl:template match="ro:address | ro:electronic | ro:physical | ro:coverage | ro:temporal | extRif:spatial">
=======
        <xsl:value-of select="@type"/>
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
    </xsl:element>  
    <xsl:element name="field">
        <xsl:attribute name="name">related_object_relation_description</xsl:attribute>
            <xsl:value-of select="."/>      
    </xsl:element>    
    </xsl:template>
    
 
    <xsl:template match="ro:coverage/ro:temporal/extRif:date[@type = 'dateFrom'] | ro:coverage/ro:temporal/extRif:date[@type = 'dateTo']">

	        <xsl:element name="field">	            

				<xsl:if test="@type = 'dateFrom'">
					<xsl:attribute name="name">date_from</xsl:attribute>
				</xsl:if>
				<xsl:if test="@type = 'dateTo'">
					<xsl:attribute name="name">date_to</xsl:attribute>
				</xsl:if>
	            <xsl:value-of select="."/>           
	        </xsl:element>     

    </xsl:template>
    
<<<<<<< HEAD
    <xsl:template match="ro:address | ro:electronic | ro:physical | ro:coverage | ro:temporal">
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
    <xsl:template match="ro:address | ro:electronic | ro:physical | ro:coverage | ro:temporal | extRif:spatial">
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
            <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="ro:electronic/ro:value | ro:addressPart | ro:location/ro:spatial[@type = 'text']">
            <xsl:value-of select="."/><xsl:text> </xsl:text>
    </xsl:template>
    
    <xsl:template match="ro:identifier" mode="value">
        <xsl:element name="field">
            <xsl:attribute name="name">identifier_value</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="ro:identifier" mode="type">
        <xsl:element name="field">
            <xsl:attribute name="name">identifier_type</xsl:attribute>
            <xsl:value-of select="@type"/>
        </xsl:element>       
    </xsl:template>
      
    <xsl:template match="ro:subject" mode="value">
        <xsl:element name="field">
            <xsl:attribute name="name">subject_value_unresolved</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="ro:subject" mode="resolved_value">
        <xsl:element name="field">
            <xsl:attribute name="name">subject_value_resolved</xsl:attribute>
            <xsl:value-of select="@extRif:resolvedValue"/>
        </xsl:element>       
    </xsl:template>
       
    <xsl:template match="ro:subject" mode="type">
        <xsl:element name="field">
            <xsl:attribute name="name">subject_type</xsl:attribute>
            <xsl:value-of select="@type"/>
        </xsl:element>
    </xsl:template>
    
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
    <xsl:template match="ro:subject" mode="vocab_uri">
        <xsl:element name="field">
            <xsl:attribute name="name">subject_vocab_uri</xsl:attribute>
            <xsl:value-of select="@extRif:vocabUri"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="extRif:broaderSubject" mode="value">
        <xsl:element name="field">
            <xsl:attribute name="name">broader_subject_value_unresolved</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
    <xsl:template match="extRif:broaderSubject" mode="resolved_value">
        <xsl:element name="field">
            <xsl:attribute name="name">broader_subject_value_resolved</xsl:attribute>
            <xsl:value-of select="@extRif:resolvedValue"/>
        </xsl:element>       
    </xsl:template>
       
    <xsl:template match="extRif:broaderSubject" mode="type">
        <xsl:element name="field">
            <xsl:attribute name="name">broader_subject_type</xsl:attribute>
            <xsl:value-of select="@type"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="extRif:broaderSubject" mode="vocab_uri">
        <xsl:element name="field">
            <xsl:attribute name="name">broader_subject_vocab_uri</xsl:attribute>
            <xsl:value-of select="@extRif:vocabUri"/>
        </xsl:element>
    </xsl:template>
    
<<<<<<< HEAD

    
    <xsl:template match="extRif:description | ro:description" mode="value">
=======
    <xsl:template match="extRif:description" mode="value">
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
    <xsl:template match="extRif:description | ro:description" mode="value">
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
        <xsl:element name="field">
            <xsl:attribute name="name">description_value</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>       
    </xsl:template>
    
<<<<<<< HEAD
<<<<<<< HEAD
    <xsl:template match="extRif:description | ro:description" mode="type">
=======
    <xsl:template match="extRif:description" mode="type">
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
    <xsl:template match="extRif:description | ro:description" mode="type">
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
        <xsl:element name="field">
            <xsl:attribute name="name">description_type</xsl:attribute>
            <xsl:value-of select="@type"/>
        </xsl:element>
    </xsl:template>
    <!-- ignore list -->
<<<<<<< HEAD
<<<<<<< HEAD
    <xsl:template match="ro:location/extRif:spatial/extRif:coords | ro:coverage/extRif:spatial/extRif:coords">
=======
    <xsl:template match="ro:location/extRif:spatial | ro:coverage/extRif:spatial">
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
    <xsl:template match="ro:location/extRif:spatial/extRif:coords | ro:coverage/extRif:spatial/extRif:coords">
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
        <xsl:element name="field">
            <xsl:attribute name="name">spatial_coverage</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
    
<<<<<<< HEAD
<<<<<<< HEAD
    <xsl:template match="ro:location/extRif:spatial/extRif:center | ro:coverage/extRif:spatial/extRif:center">
=======
    <xsl:template match="ro:location/extRif:center | ro:coverage/extRif:center">
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
    <xsl:template match="ro:location/extRif:spatial/extRif:center | ro:coverage/extRif:spatial/extRif:center">
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
        <xsl:element name="field">
            <xsl:attribute name="name">spatial_coverage_center</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
    
     <xsl:template match="extRif:rights[@licence_group!='']" mode="licence_group">
        <xsl:element name="field">
            <xsl:attribute name="name">licence_group</xsl:attribute>
            <xsl:value-of select="@licence_group"/>
        </xsl:element>
    </xsl:template> 


    <xsl:template match="ro:date | ro:description | ro:spatial | ro:text"/>

<<<<<<< HEAD
    
    <xsl:template match="ro:name"/>
   		
   <!--Added for FOR -->
    <xsl:template match="ro:subject[@type='anzsrc-for']" mode="code">
        
        <xsl:variable name="fcode" select="."/>         

        <xsl:choose>
            <xsl:when test="$fcode!=''">
        <xsl:variable name="codelength" select="string-length($fcode)"/>

        <xsl:variable name="fullcode">
            <xsl:choose>
                <xsl:when test="$codelength=2">
                    <xsl:value-of select="concat($fcode,'0000')"/>
                </xsl:when>
                <xsl:when test="$codelength=4">
                    <xsl:value-of select="concat($fcode,'00')"/>
                </xsl:when>
                <xsl:when test="$codelength=6">
                    <xsl:value-of select="$fcode"/>
                </xsl:when>

            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="forcode_six"><xsl:value-of select="$fullcode"/></xsl:variable>
        <xsl:variable name="forcode_four_tmp" select="substring($forcode_six,1,4)" />
        <xsl:variable name="forcode_two_tmp" select="substring($forcode_six,1,2)" />

        <xsl:variable name="forcode_four" select="concat($forcode_four_tmp,'00')" />
        <xsl:variable name="forcode_two" select="concat($forcode_two_tmp,'0000')" />

        <!--code-->
        <xsl:element name="field">
            <xsl:attribute name="name">for_code_six</xsl:attribute>
            <xsl:value-of select="$forcode_six"/>
        </xsl:element>

        <xsl:element name="field">
            <xsl:attribute name="name">for_code_four</xsl:attribute>
            <xsl:value-of select="$forcode_four"/>
        </xsl:element>

        <xsl:element name="field">
            <xsl:attribute name="name">for_code_two</xsl:attribute>
            <xsl:value-of select="$forcode_two"/>
        </xsl:element>

        <!--string value-->
        <xsl:element name="field">
            <xsl:attribute name="name">for_value_six</xsl:attribute>
            <xsl:value-of select="$forcode_six"/>
        </xsl:element>

        <xsl:element name="field">
            <xsl:attribute name="name">for_value_four</xsl:attribute>
            <xsl:value-of select="$forcode_four"/>
        </xsl:element>

        <xsl:element name="field">
            <xsl:attribute name="name">for_value_two</xsl:attribute>
            <xsl:value-of select="$forcode_two"/>
        </xsl:element>
            </xsl:when>
        </xsl:choose>


    </xsl:template>
<!-- end -->
=======
   
    <xsl:template match="ro:date | ro:description"/>
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
    
    <xsl:template match="ro:name"/>
   		
   
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
</xsl:stylesheet>

