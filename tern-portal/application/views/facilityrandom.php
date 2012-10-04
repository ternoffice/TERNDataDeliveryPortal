<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$count = count($recordsArr);
$half = round($count / 2);

        $partners = array();
        $keys = array();

        foreach($json->{'response'}->{'docs'} as $d)
        {
                $key = $d->{'key'};
                $keys[] = $key;
             
                if($d->{'description_value'}!=null && $d->{'description_type'}!=null)
                {
                    foreach($d->{'description_type'} as $index=>$type)
                    {

                       $partners[$key]['description_value']=$d->{'description_value'}[1];
                                    
                       $partners[$key]['url']=$d->{'location'}[0];

                      // $partners[$key]['displayTitle']=$d->{'displayTitle'};                         
                        $partners[$key]['display_title']=$d->{'display_title'};                         

                       $partners[$key]['alt_name']=$d->{'alt_name'};  
                       $partners[$key]['query_name']=$d->{'query_name'};  
                    }

                }
        }


        
function printRecord($r){
     $ro_key = $r->{'key'};
     $date = $r->{'timestamp'};
     
     $date_t = new DateTime($date);
     $date_t->setTimeZone(new DateTimeZone("Australia/Brisbane"));
     $date = $date_t->format('d-m-Y');
     if ($r->url_slug)
	{
            $key_url = base_url().$r->{'url_slug'};
	}
        else{
            $key_url = base_url() . 'view?key=' . urlencode($ro_key);
        }   
           // $name =  $r->{'displayTitle'}; //commented 8.1
            $name =  $r->{'display_title'}; //added 8.1


            echo '<li>'; 
            echo    '<a href="'. $key_url .'" target="_new">';
            echo    '<span class="date">'.$date.' - </span>';
            echo    $name;
            echo    '</a>';
            echo '</li>';
            
            
}




?> 
    
    
<?php if($header_footer) $this->load->view('tpl/header');?>



       
        <?php 
                if ($fackey!==tddp)
                {                    
                    echo '<div id="datasetsIncluded">';
                    echo $partners[$fackey]['description_value'];
                    echo '</div>';       


                }else
               {
                    echo '<div id="datasetsIncluded">';
                    echo     '<h1>Datasets Included</h1>';
                    echo    '<ul>';
                                if($topics && $topics->{'docs'}){	
                                    foreach($topics->{'docs'} as $d)
                                    {
                                        echo '<li>';
                                        echo    '<a href="'.$d->{'query_url'}.'">';
                                        echo          '<img alt="'.$d->{'title'}.'" src="'.$d->{'img_url'}.'"/>';
                                        echo          '<span>'.$d->{'title'}.'</span>';
                                        echo    '</a>';
                                        echo '</li>';
                                    }	
                                }     
                  echo     '</ul>';
                  echo    '</div>';

               }
 
                
                    echo '<div id="recentlyReleased">';
                    echo '<h1>Recently Released</h1>';
                    echo '<ul>';
          
                    for($i=0;$i<$half; $i++)
                    {
                        printRecord($recordsArr[$i]);
                    }
                    echo '</ul>';
                    echo '<ul>';
                    for($i=$half;$i<$count; $i++)
                    {
                        printRecord($recordsArr[$i]);
                    }


                    echo '</ul>';
                    echo '</div>';  
        ?>


<?php  if($header_footer)  $this->load->view('tpl/footer');?>