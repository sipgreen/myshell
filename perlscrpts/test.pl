use File::Compare;
use strict;
use File::Find;



#functions
my @branches;
@branches[0]='remote: Updated Changes:';
@branches[1]='remote\:   http://code.ctripcorp.com/204487';
@branches[2]='To ssh:\/\/zhangcq@code.ctripcorp.com:29418\/Flight\/Resource\/IntlFlight.Resource';

foreach $_(@branches) {
		if (/(http:\/\/code\.ctripcorp\.com\/\d+)/gi) {
			my $test = "explorer $1";
			print $test;
			readpipe($test);
		}
		
}





