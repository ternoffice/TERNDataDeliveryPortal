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
***************************************************************************
*
**/ 
?>
<?php
	class Registryobjects extends CI_Model {
		
	    function __construct() {
	        parent::__construct();
	    }
    
	  	
		/*
		 * get
		 * given a key returns extended RIFCS of a published key
		 * given a key and a data source key returns RIFCS of a draft
		 * use service url 
		 */
	    function get($key, $dataSourceKey=''){
		  	$service_url = service_url();
	       	if($dataSourceKey==''){
	       		$url = $service_url.'?key='.urlencode($key);
			}else $url = $service_url.'?draftKey='.$key.'&dataSourceKey='.$dataSourceKey;
<<<<<<< HEAD
<<<<<<< HEAD
			// echo '<div>'.$url.'</div>';
=======
			//echo '<div class="hide">'.$url.'</div>';
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
			// echo '<div>'.$url.'</div>';
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
			$content='Nothing Returned';
			if(get_http_response_code($url)!='400'){
				$content = file_get_contents($url, 0, null, null);
			}else echo '400 error';
			//echo $content;
			//$json = json_decode($content);
			return $content;
	    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
		
	    function getByHash($hash){
		  	$service_url = service_url();
	      	$url = $service_url.'?registry_object_hash='.urlencode($hash);
			//echo '<div>'.$url.'</div>';
			$content='Nothing Returned';
			if(get_http_response_code($url)!='400'){
				$content = file_get_contents($url, 0, null, null);
			}else echo '400 error';
			//echo $content;
			//$json = json_decode($content);
			return $content;
	    }
		
<<<<<<< HEAD
=======
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
    
		/*
		 * getSearchHistory
		 * returns everything from the search statistics
		 * Normally use for search suggestion
		 */ 
	    function getSearchHistory(){
<<<<<<< HEAD
<<<<<<< HEAD
	    	$this->load->database();
=======
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
	    	$this->load->database();
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
	    	return $this->db->get('dba.tbl_search_statistics');
	    }
    
		/*
		 * updateStatistics
		 * update the statistics from searches
		 */ 
	    function updateStatistic($query, $class, $group, $subject, $type, $temporal){
<<<<<<< HEAD
<<<<<<< HEAD
	    	$this->load->database();
=======
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
	    	$this->load->database();
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
	    	$terms = array($query, 'class:'.$class, 'type:'.$type, 'subject:'.$subject, 'group:'.$group, 'type:'.$type, 'temporal:'.$temporal);
	    	foreach($terms as $t){
	    		//check if term exists
	    		$term = $this->db->get_where('dba.tbl_search_statistics', array('search_term' => $t));
	    		if($term->num_rows() > 0){//term exists
	    			//update the number
	    			$num = 0;
	    			foreach($term->result() as $row){
	    				$num = $row->occurrence;
	    			}
	    			$num++;
	    			$data = array('occurrence'=>$num);
					$this->db->where('search_term', $t);
					$this->db->update('dba.tbl_search_statistics', $data); 
					//echo 'updated '.$t.' to '.$num.' ';
	    		}else{//term does not exists
	    			//add the term
	    			$data = array('search_term' => $t);
					$this->db->insert('dba.tbl_search_statistics', $data);
					//echo 'inserted '.$t.' ';
	    		}
	    	}
<<<<<<< HEAD
<<<<<<< HEAD
	    	echo 'search stat updated';
=======
	    	//echo 'search stat updated';
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
	    	echo 'search stat updated';
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
	    }
		
		
		/*
		 * getRelated
		 */ 
	    function getRelated($key)
	    {
			$service_url = $this->config->item('service_url');
	       	$solr_query = $service_url.'?getRelated='.$key;
			//echo $solr_query;
			$content='';
			if($this->get_http_response_code($solr_query)!='400'){
				$content = file_get_contents($solr_query, 0, null, null);
	
			}else echo 'error, Minh, error and the key that cause error is: '.$key.'';
	
			//$json = json_decode($content);z
			return $content;
	
	    } 
        

		public function didYouMean($wrong_term){
			$input = $wrong_term;// input misspelled word
		$closest = "";
			$history  = $this->getSearchHistory();// array of words to check against
			$words = array();
			foreach($history->result() as $h){
				$pos = strrpos($h->search_term, ":");
				if ($pos === false) {//is not a field term
					array_push($words, $h->search_term);
				}
			}
			
			$shortest = -1;// no shortest distance found, yet
			// loop through words to find the closest
			foreach ($words as $word) {
			 
			    // calculate the distance between the input word,
			    // and the current word
			    $lev = levenshtein($input, $word);
			 
			    // check for an exact match
			    if ($lev == 0) {
			 
			        // closest word is this one (exact match)
			        $closest = $word;
			        $shortest = 0;
			 
			        // break out of the loop; we've found an exact match
			        break;
			    }
			 
			    // if this distance is less than the next found shortest
			    // distance, OR if a next shortest word has not yet been found
			    if ($lev <= $shortest || $shortest < 0) {
			        // set the closest match, and shortest distance
			        $closest  = $word;
			        $shortest = $lev;
			    }
			}
			 
			/*echo "Input word: $input";
			if ($shortest == 0) {
			    echo "Exact match found: $closest\n";
			} else {
			    echo "Did you mean: $closest?\n";
			}*/
			return $closest;
		}

	    function spatial($north, $east, $south, $west)
	    {
<<<<<<< HEAD
<<<<<<< HEAD
	    	$query = 'select distinct rs.registry_object_key from dba.tbl_registry_objects rs, dba.tbl_spatial_extents se
	where rs.registry_object_key = se.registry_object_key 
	and se.bound_box && box ((point('.$north.','.$west.')),(point('.$south.','.$east.')))';
			return $query;
	    	return $this->db->query($query);
=======
	    	return $this->db->query('select distinct rs.registry_object_key from dba.tbl_registry_objects rs, dba.tbl_spatial_extents se
	where rs.registry_object_key = se.registry_object_key 
	and se.bound_box && box ((point('.$north.','.$west.')),(point('.$south.','.$east.')))');
>>>>>>> c158020c71cc71c72f7d4e30b4e14c2edb498794
=======
	    	$query = 'select distinct rs.registry_object_key from dba.tbl_registry_objects rs, dba.tbl_spatial_extents se
	where rs.registry_object_key = se.registry_object_key 
	and se.bound_box && box ((point('.$north.','.$west.')),(point('.$south.','.$east.')))';
			return $query;
	    	return $this->db->query($query);
>>>>>>> ef76189ad3c78fcd6a06e682eda24debb302212f
	    }
    
    
}
?>
