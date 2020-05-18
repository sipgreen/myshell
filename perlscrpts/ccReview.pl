use File::Compare;
use strict;
use File::Find;


#functions
sub printDbline{
	my $i;
	for ( $i = 0 ; $i <= $#_ ; $i++ ) {
		print $_[$i];
	}
	print "\n\n";
}

sub getResult {
	my $istart = 0;
	my @resutl;
	my $i;
	for ( $i = 0 ; $i <= $#_ ; $i++ ) {
		if ( $_[$i] =~ /to display help for specific commands/gi ) {
			continue;
		}
		$resutl[ scalar(@resutl) + 1 ] = $_[$i];
	}
	return (@resutl);
}
#end functions

my $brchpath="";
my $mybranch = "";

$_ = $ARGV[0];
s/\\/\//gi;
$brchpath=$_;
printDbline("branchpath: $brchpath ");


my @branches = readpipe("sh --login -i -c \"cd $brchpath;git branch\"");
@branches = getResult(@branches);
foreach $_ (@branches) {
	if (/\*\s+\w+$/gi) {
		s/\*\s+(\w+)\s+/$1/gi;
		$mybranch = $_;
	}
}
print "current $mybranch   branch \r\n";
my @pushresult = readpipe(
"sh --login -i -c \"cd $brchpath;git push origin HEAD:refs/for/$mybranch%r=sunk,r=liubr,r=sunyh \"");

print @pushresult;


=pop
my @reviewRslt=getResult(@branches);

foreach $_(@reviewRslt) {
	if (/(http:\/\/code\.ctripcorp\.com\/\d+)/gi) {
		my $test = "explorer $1";
		print $test;
		readpipe($test);
	}		
}
#printDbline(@reviewRslt);





