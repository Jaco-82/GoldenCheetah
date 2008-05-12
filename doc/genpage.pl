#!/usr/bin/perl -w
# 
# Copyright (c) 2001-2003 Regents of the University of California. 
# All rights reserved.                                             
#
# See the file LICENSE included in this distribution for details.  
#
# $Id: genpage.pl,v 1.3 2006/07/05 16:59:56 srhea Exp $ 

use strict;
  
my $title = shift;
my $content_file = shift;
open (FILE, "$content_file") or die "Could not open $content_file";

print<<EOF;
<!-- 

  Copyright (c) 2006-2008 Sean C. Rhea (srhea\@srhea.net)
  All rights reserved.                                             

  This file was automatically generated by genpage.pl.  To change it,
  please edit the content file, $content_file.

-->

<html>
<head>
<title>Golden Cheetah: PowerTap Software for Linux and Mac OS X</title>
 <meta name="keywords" content="powertap mac cycling performance">
</head>

<body    text="#000000" 
         link="#5e431b" 
        vlink="#996e2d" 
        alink="#000000" 
      bgcolor="#ffffff">

<table width="95%" border="0" width="100%" cellspacing="10">
<tr>

<!-- Left Column -->
<td width="175" valign="top">
<center>
<img src="logo.jpg" width="175" height="175" alt="Picture of Cheetah">

<p>  <b><a href="index.html">Introduction</a></b>
<br> <b><a href="screenshots.html">Screenshots</a>
<br> <b><a href="users-guide.html">User's Guide</a>
<br> <b><a href="faq.html">FAQ</a>
<br> <b><a href="wishlist.html">Wish List</a>
<br> <b><a href="license.html">License</a></b>
<br> <b><a href="download.html">Download</a></b>
<br> <b><a href="contrib.html">Contributors</a></b>
<br> <b><a href="search.html">Search</a></b>
<br> <b><a href="cgi-bin/mailman/listinfo/golden-cheetah-users">Mailing List</a></b>

<p>
<script type="text/javascript"><!--
google_ad_client = "pub-2993461533095312";
google_ad_width = 120;
google_ad_height = 240;
google_ad_format = "120x240_as";
google_ad_type = "text";
google_ad_channel ="";
google_color_border = "FFFFFF";
google_color_bg = "FFFFFF";
google_color_link = "5E431B";
google_color_url = "996E2D";
google_color_text = "000000";
//--></script>
<script type="text/javascript"
  src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
  </script>

</center>
</td>
<!-- End of Left Column -->

<!-- Right Column -->
<td align="left" valign="top">
<table width="100%" cellspacing="10">
<tr align="center"><td>

<p>
<p>
<big><big><big><b><font face="arial,helvetica,sanserif">Golden
Cheetah</font></b></big></big></big>
<br>
<big><font face="arial,helvetica,sanserif">
PowerTap Software for Linux and Mac OS X
</font></big>
<p>
</td></tr>

<tr><td bgcolor="#5e431b">
<font color="#f8d059" face="arial,helvetica,sanserif">
<big><strong>$title</strong></big>
</font>
</td></tr>

<tr><td>
EOF

my $match = "\\\$" . "Id:.* (\\d\\d\\d\\d\\/\\d\\d\\/\\d\\d "
    . "\\d\\d:\\d\\d:\\d\\d) .*\\\$";

my $last_mod;
while (<FILE>) {
    
    if (m/$match/) {
        $last_mod = $1;
    }
    print;
}
close (FILE);

if (defined $last_mod) {
    print "<p><hr><em>Last modified $last_mod.</em>\n";
}

print<<EOF;

</tr></td>
</table>
</td>
<!-- End of Right Column -->

</tr>
</table>

</body>
</html>
EOF

