<div class="borderMe collapsiblePanel">  
    <h3 class="head ui-widget-header">Date</h3>
    <div id="temporalFilter" class="padding5"><input type="checkbox" id="show-temporal-search" title="toggle to enable/disable temporal search"/> 
    <label for="show-temporal-search">Show data between</label>

            <select id="dateFrom">               
		<?php 
                    for($i=$min_year;$i<$max_year;$i++)
                    {
                        echo '<option value="'.$i.'">'.$i.'</option>';
                    }
		?>
            </select>
            and  
            <select id="dateTo">
		<?php 
                    for($i=$max_year;$i>$min_year;$i--)
                    {
			echo '<option value="'.$i.'">'.$i.'</option>';
                    } 
		?>
            </select></div>
            <div id="min_year" class="hide"><?php echo $min_year;?></div>
            <div id="max_year" class="hide"><?php echo $max_year;?></div>
            <div id="date-slider" style="display:none"></div>
            <div class="clearfix"></div>
</div>