use strict;

my @changeItems  = "";
my @comparefiles = "";
my @Branches     = "";

if ( scalar(@ARGV) < 3 ) {
	$Branches[0] = "Branch/DevBranch0001";
	$Branches[1] = $ARGV[0];

	@changeItems = readpipe(
"tf changeset /login:zhangcq,Alezha#3 /collection:http://192.168.83.70:8080/tfs/Flight $ARGV[1]  /noprompt"
	);
}
else {
	for ( my $i = 0 ; $i < 2 ; $i++ ) {
		$Branches[$i] = $ARGV[$i];
	}

	@changeItems = readpipe(
"tf changeset /login:zhangcq,Alezha#3 /collection:http://192.168.83.70:8080/tfs/Flight $ARGV[2]  /noprompt"
	);
}

#print $ENV{cpmode};
if ( $ENV{cpmode} == 1 ) {
	$comparefiles[0] = $ARGV[2];
}
else {
	foreach $_ (@Branches) {
		s/^(\d+_\d+)$/Release\/$1/gi;
		s/^(mainline)$/$1\/Publish/gi;
	}
	print @Branches;
	my $i = 0;
	foreach $_ (@changeItems) {
		if (/FltPrdSys/gi) {
			if (s/[^\r\n]+(FltPrdSys)/$1/gi) {
				s/\s+/""/gi;
				$comparefiles[$i] = $_;
				$i = $i + 1;
			}
		}
	}
}
foreach my $str (@comparefiles) {
	my $file1 = "D:/src/Flight/Product/$Branches[0]/$str";
	my $file2 = "D:/src/Flight/Product/$Branches[1]/$str";

	my $cmdget1     = "tf get $file1";
	my $cmdget2     = "tf get $file2";
	my $cmdcheckout = "tf checkout $file2";
	my $cmdDiff     = "start tf diff $file1 $file2";

	readpipe($cmdget1);
	readpipe($cmdget2);
	print "checkout $file2\r\n";
	readpipe($cmdcheckout);
	print "${cmdDiff}\r\n";
	print readpipe($cmdDiff);
}