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
		if ( $istart == 1 ) {
			$resutl[ scalar(@resutl) + 1 ] = $_[$i];
		}
		if ( $_[$i] =~ /to display help for specific commands/gi ) {
			$istart = 1;
		}
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
		s/\*\s+(\w+)/$1/gi;
		$mybranch = $_;
	}
}

print readpipe("sh --login -i -c \"cd $brchpath;git stash\"");
print readpipe("sh --login -i -c \"cd $brchpath;git rebase origin/$mybranch\"");
print readpipe("sh --login -i -c \"cd $brchpath;git stash\ pop\"");





