<?php
 /*
 * @package		Tech Fry Library
 * @license		https://www.gnu.org/licenses/gpl-3.0.en.html
 */

namespace TechFry\Library\View\Others;

defined('_JEXEC') or die;

class Chart
{
    // Reference: https://quickchart.io/
    public static function get_output($content, $config = array())
    {
        // content - chart_type, labels, dp
        // config
        
        if (empty($content))
        {
            return;
        }
        
        $datapoints = $content['dp'];
        $labels = $content['labels'];
        $chart_type = $content['chart_type'];
        
        if (is_string($labels))
        {
            $labels = str_getcsv($labels);
            $labels = array_map('trim', $labels);
        }
        
        if (is_string($datapoints))
        {
            $datapoints = str_getcsv($datapoints);
            $datapoints = array_map('trim', $datapoints);
        }
        
        switch ($chart_type)
        {
            case 'bar' :
            case 'horizontalBar' :
            case 'line' :
            case 'radar' :
            case 'pie' :
            case 'doughnut' :
            case 'polarArea' :
                $api_data = array(
                    'type' => $chart_type,
                    'data' => array(
                        'labels' => $labels,
                        'datasets' => array(
                            array(
                                'label' => 'Value',
                                'data' => $datapoints,
                              	'backgroundColor' => 'green',
                              	'maxBarThickness' => 10,
                                )
                            )
                        )
                    );
                break;
                
            case 'radialGauge' :
            case 'progressBar' :
                $api_data = array(
                    'type' => $chart_type,
                    'data' => array(
                        'datasets' => array(
                            array(
                                'data' => $datapoints
                                )
                            )
                        )
                    );
                break;
        }
            
        $json = json_encode($api_data);
                
        $json = str_replace('"', "'", $json);
        
        $url = 'https://quickchart.io/chart?c=' . $json;
        
        $output = '<img src="' . $url . '">';
        
        return $output;
    }
  
  	public static function bar_chart($x_labels, $data = array())
    {
    	// $data - array: label, data, backgroundColor, maxBarThickness
      
      	if (is_string($x_labels))
        {
            $x_labels = str_getcsv($x_labels);
            $x_labels = array_map('trim', $x_labels);
        }
      
      	$api_data = array(
          'type' => 'bar',
          'data' => array(
            'labels' => $x_labels,
            'datasets' => $data
          )
        );
      
      	$json = json_encode($api_data);
                
        $json = str_replace('"', "'", $json);
        
        $url = 'https://quickchart.io/chart?c=' . $json;
        
        $output = '<img src="' . $url . '">';
        
        return $output;
    }
}