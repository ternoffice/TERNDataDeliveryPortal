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
**/ 
?>
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {


	public function index(){

                 $this->load->library('user_agent');
		$data['user_agent']=$this->agent->browser();

                $this->load->model('Registryobjects');
                $query = $this->Registryobjects->get_min_year();
                if($query) $row = $query->row();
 
                //$data['min_date'] = $row;

                $data['min_year'] = $row->min_year;
                $data['max_year'] = $row->max_year;
		
                $this->load->model('Solr');
                $data['json'] = $this->Solr->getTERNPartners();
                
                $data['topics']=$this->Solr->getTopics();

		$data['home'] = 1;
		$data['tabs'] = 1;


                $data['recordsArr'] = $this->handleRandomTab(10,'tddp');
		$this->load->view('home_pagev4', $data);
	}
	
        public function getrdmrecord()
        {
            
           if(isset($_GET['fac']))
                $fac=$_GET['fac'];
            else
                $fac="tddp";

            $this->load->model('Solr');
            $data['json'] = $this->Solr->getTERNPartners();
            $data['topics']=$this->Solr->getTopics();
            $data['recordsArr'] = $this->handleRandomTab(10,$fac);

            $data['fackey']=$fac;

            $this->load->view('facilityrandom',$data);
        }
        public function advancesrch(){
                //get Temporal 
                $this->load->model('Registryobjects');
                $query = $this->Registryobjects->get_min_year();
                if($query) $row = $query->row();              
                $data['min_year'] = $row->min_year;
                $data['max_year'] = $row->max_year;
                $data['widget_temporal'] = 1;
                
                //get Group
                $this->load->model('Solr');
                $queryFacilities = $this->Solr->getFacilities();
                $data['facilities'] = $queryFacilities->{'facet_counts'}->{'facet_fields'}->{'group'};
                $data['widget_facilities'] = 1;
                
                //get Subject
                include APPPATH . '/views/tab/forstat.php';
                $data['widget_for'] = 1;
                $data['subject'] = $subject;
              
		$this->load->library('user_agent');
		$data['user_agent']=$this->agent->browser();
                
                //get Map widget

                $data['widget_map'] = 1;
                $data['widget_map_drawtoolbar'] = 1;
                $data['widget_map_coords'] = 1;
                
                //get Keyword
                $data['widget_keyword'] = 1;
                
                
		$this->load->view('content/advancesrch', $data);
	}       
	
	
	public function contact(){
		$this->load->library('user_agent');
		$data['user_agent']=$this->agent->browser();
		$this->load->view('content/contact_form', $data);
	}
         
        public function mapproto(){
                $data['widget_map'] = 1;
              
                 // get Regions  File
                $regions = json_decode(file_get_contents('http://' . HOST.  '/api/regions.json', TRUE));
                $regions = $regions->layers;
                 for($i=0;$i<count($regions);$i++){                  
                    $regions[$i]->features =  json_decode(file_get_contents('http://' . REGIONS_URL . '/r/getList/' . $regions[$i]->l_id));                     
                 }
                 $data["regions"] = $regions;
                $this->load->view('content/mapproto',$data);
        }
	public function infrastructure(){
                $data['widget_map'] = 1;
                $data['infrastructure_map'] = 1;
                $this->load->view('content/infrastructure',$data);
        }

        
        public function mapproto_viewport(){
                $data['widget_map'] = 1;
              
        
                $this->load->view('content/mapproto_viewport',$data);
        }
        

	public function send(){
		$this->load->library('user_agent');
		$data['user_agent']=$this->agent->browser();
		$name = $this->input->post('name');
		$email = $this->input->post('email');
		$content = $this->input->post('content');
		
		$this->load->library('email');

		$this->email->from($email, $name);
		$this->email->to('services@tern.org.au');
		
		$this->email->subject('Contact Us');
		$this->email->message($content);	
		
		$this->email->send();
		
		echo '<b>Thank you for your response. Your message has been delivered successfully</b>';
	}
	
	public function notfound(){
		$this->load->library('user_agent');
		$data['user_agent']=$this->agent->browser();
		$data['message']='Page not found!';
                $this->load->model('Solr');
                $data['json'] = $this->Solr->getTERNPartners();

                $this->load->view('layout',$data);
	}

	public function accessdata(){
		$this->load->library('user_agent');
		$data['user_agent']=$this->agent->browser();
		$this->load->view('terndata/accessdata', $data);
	}
        
         public function submitdata(){
		$this->load->library('user_agent');
		$data['user_agent']=$this->agent->browser();
		$this->load->view('terndata/submitdata', $data);
	}
        
        public function licensing(){
		$this->load->library('user_agent');
		$data['user_agent']=$this->agent->browser();
		$data['load_license_js'] = 1;
                $this->load->view('terndata/licensing', $data);
                
	}
         public function terms(){
		$this->load->library('user_agent');
		$data['user_agent']=$this->agent->browser();
		$this->load->view('terndata/terms', $data);
	}
    
        
    
        /*get 10 random records*/
        private function handleRandomTab($num,$fac){

            $this->load->model('Solr','Solr');

            $randomRJson = $this->Solr->getRandomRecords($num,$fac);
            
            $recordsArr = $randomRJson->{'response'}->{'docs'};
            return $recordsArr;
            
        }    


    
        }
