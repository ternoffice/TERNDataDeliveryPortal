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

********************************************************************************
$Date: 2011-09-06 11:35:57 +1000 (Tue, 06 Sep 2011) $
$Revision: 1 $
***************************************************************************
*
**/ 
?>
<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/*
| -------------------------------------------------------------------
| USER AGENT TYPES
| -------------------------------------------------------------------
| This file contains four arrays of user agent data.  It is used by the
| User Agent Class to help identify browser, platform, robot, and
| mobile device data.  The array keys are used to identify the device
| and the array values are used to set the actual name of the item.
|
*/

$platforms = array (
					'windows nt 6.0'	=> 'Windows Longhorn',
					'windows nt 5.2'	=> 'Windows 2003',
					'windows nt 5.0'	=> 'Windows 2000',
					'windows nt 5.1'	=> 'Windows XP',
					'windows nt 4.0'	=> 'Windows NT 4.0',
					'winnt4.0'			=> 'Windows NT 4.0',
					'winnt 4.0'			=> 'Windows NT',
					'winnt'				=> 'Windows NT',
					'windows 98'		=> 'Windows 98',
					'win98'				=> 'Windows 98',
					'windows 95'		=> 'Windows 95',
					'win95'				=> 'Windows 95',
					'windows'			=> 'Unknown Windows OS',
					'os x'				=> 'Mac OS X',
					'ppc mac'			=> 'Power PC Mac',
					'freebsd'			=> 'FreeBSD',
					'ppc'				=> 'Macintosh',
					'linux'				=> 'Linux',
					'debian'			=> 'Debian',
					'sunos'				=> 'Sun Solaris',
					'beos'				=> 'BeOS',
					'apachebench'		=> 'ApacheBench',
					'aix'				=> 'AIX',
					'irix'				=> 'Irix',
					'osf'				=> 'DEC OSF',
					'hp-ux'				=> 'HP-UX',
					'netbsd'			=> 'NetBSD',
					'bsdi'				=> 'BSDi',
					'openbsd'			=> 'OpenBSD',
					'gnu'				=> 'GNU/Linux',
					'unix'				=> 'Unknown Unix OS'
				);


// The order of this array should NOT be changed. Many browsers return
// multiple browser types so we want to identify the sub-type first.
$browsers = array(
					'Flock'				=> 'Flock',
					'Chrome'			=> 'Chrome',
					'Opera'				=> 'Opera',
					'MSIE'				=> 'Internet Explorer',
					'Internet Explorer'	=> 'Internet Explorer',
					'Shiira'			=> 'Shiira',
					'Firefox'			=> 'Firefox',
					'Chimera'			=> 'Chimera',
					'Phoenix'			=> 'Phoenix',
					'Firebird'			=> 'Firebird',
					'Camino'			=> 'Camino',
					'Netscape'			=> 'Netscape',
					'OmniWeb'			=> 'OmniWeb',
					'Safari'			=> 'Safari',
					'Mozilla'			=> 'Mozilla',
					'Konqueror'			=> 'Konqueror',
					'icab'				=> 'iCab',
					'Lynx'				=> 'Lynx',
					'Links'				=> 'Links',
					'hotjava'			=> 'HotJava',
					'amaya'				=> 'Amaya',
					'IBrowse'			=> 'IBrowse'
				);

$mobiles = array(
					// legacy array, old values commented out
					'mobileexplorer'	=> 'Mobile Explorer',
//					'openwave'			=> 'Open Wave',
//					'opera mini'		=> 'Opera Mini',
//					'operamini'			=> 'Opera Mini',
//					'elaine'			=> 'Palm',
					'palmsource'		=> 'Palm',
//					'digital paths'		=> 'Palm',
//					'avantgo'			=> 'Avantgo',
//					'xiino'				=> 'Xiino',
					'palmscape'			=> 'Palmscape',
//					'nokia'				=> 'Nokia',
//					'ericsson'			=> 'Ericsson',
//					'blackberry'		=> 'BlackBerry',
//					'motorola'			=> 'Motorola'

					// Phones and Manufacturers
					'motorola'			=> "Motorola",
					'nokia'				=> "Nokia",
					'palm'				=> "Palm",
					'iphone'			=> "Apple iPhone",
					'ipad'				=> "iPad",
					'ipod'				=> "Apple iPod Touch",
					'sony'				=> "Sony Ericsson",
					'ericsson'			=> "Sony Ericsson",
					'blackberry'		=> "BlackBerry",
					'cocoon'			=> "O2 Cocoon",
					'blazer'			=> "Treo",
					'lg'				=> "LG",
					'amoi'				=> "Amoi",
					'xda'				=> "XDA",
					'mda'				=> "MDA",
					'vario'				=> "Vario",
					'htc'				=> "HTC",
					'samsung'			=> "Samsung",
					'sharp'				=> "Sharp",
					'sie-'				=> "Siemens",
					'alcatel'			=> "Alcatel",
					'benq'				=> "BenQ",
					'ipaq'				=> "HP iPaq",
					'mot-'				=> "Motorola",
					'playstation portable'	=> "PlayStation Portable",
					'hiptop'			=> "Danger Hiptop",
					'nec-'				=> "NEC",
					'panasonic'			=> "Panasonic",
					'philips'			=> "Philips",
					'sagem'				=> "Sagem",
					'sanyo'				=> "Sanyo",
					'spv'				=> "SPV",
					'zte'				=> "ZTE",
					'sendo'				=> "Sendo",

					// Operating Systems
					'symbian'				=> "Symbian",
					'SymbianOS'				=> "SymbianOS",
					'elaine'				=> "Palm",
					'palm'					=> "Palm",
					'series60'				=> "Symbian S60",
					'windows ce'			=> "Windows CE",

					// Browsers
					'obigo'					=> "Obigo",
					'netfront'				=> "Netfront Browser",
					'openwave'				=> "Openwave Browser",
					'mobilexplorer'			=> "Mobile Explorer",
					'operamini'				=> "Opera Mini",
					'opera mini'			=> "Opera Mini",

					// Other
					'digital paths'			=> "Digital Paths",
					'avantgo'				=> "AvantGo",
					'xiino'					=> "Xiino",
					'novarra'				=> "Novarra Transcoder",
					'vodafone'				=> "Vodafone",
					'docomo'				=> "NTT DoCoMo",
					'o2'					=> "O2",

					// Fallback
					'mobile'				=> "Generic Mobile",
					'wireless'				=> "Generic Mobile",
					'j2me'					=> "Generic Mobile",
					'midp'					=> "Generic Mobile",
					'cldc'					=> "Generic Mobile",
					'up.link'				=> "Generic Mobile",
					'up.browser'			=> "Generic Mobile",
					'smartphone'			=> "Generic Mobile",
					'cellphone'				=> "Generic Mobile"
				);

// There are hundreds of bots but these are the most common.
$robots = array(
					'googlebot'			=> 'Googlebot',
					'msnbot'			=> 'MSNBot',
					'slurp'				=> 'Inktomi Slurp',
					'yahoo'				=> 'Yahoo',
					'askjeeves'			=> 'AskJeeves',
					'fastcrawler'		=> 'FastCrawler',
					'infoseek'			=> 'InfoSeek Robot 1.0',
					'lycos'				=> 'Lycos'
				);

/* End of file user_agents.php */
/* Location: ./application/config/user_agents.php */