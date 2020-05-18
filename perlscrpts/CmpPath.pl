use File::Compare;
use strict;
use File::Find;
use Cwd;

my $wd = getcwd;



my $path1 = $ARGV[0];
my $path2 = $ARGV[1];
if ($path1=~/\w+/gi) {
	$path1=~s/^(\w+)$/$wd\/$1/gi;
}
if ($path2=~/\w+/gi) {
	$path2=~s/^(\w+)$/$wd\/$1/gi;
}
sub printDbline {
	my $i;
	for ( $i = 0 ; $i <= $#_ ; $i++ ) {
		print $_[$i];
	}
	print "\n\n";
}

sub wanted {
	if ( -f $File::Find::name ) {
		my $ibool     = 0;
		my $ibranchcp = 1;
		if ( scalar(@ARGV) > 2 ) {
			if (
				( $ARGV[2] & 0x04 ) != 0x04
				|| (
					( $ARGV[2] & 0x04 ) == 0x04
					&& ( ( $File::Find::name =~ /\/CoreSearchEngine\// )
						|| ( $File::Find::name =~ /\/ProductWS\// ) )
				)
			  )
			{
				$ibranchcp = 1;
			}
			else {
				$ibranchcp = 0;
			}    #compare baranch CoreSearchEngine ProductWS

			if (
				( $ARGV[2] & 0x01 ) == 0x01
				&& (   $File::Find::name =~ /ConfigProfile\.xml$/
					|| $File::Find::name =~ /config\.tpl$/ )
			  )
			{
				$ibool = 1;
			}    #compare Extension .xml and .tpl
			if ( ( $ARGV[2] & 0x02 ) == 0x02
				&& $File::Find::name =~ /\.cs$/ )
			{
				$ibool = 1;
			}    #compare Extension .cs

		}
		else {
			if ( $File::Find::name =~ /\.cs$/ ) {
				$ibool = 1;
			}
		}

		if ( $ibool == 1 && $ibranchcp == 1 ) {
			my $index  = length($path1);
			my $resid  = length($File::Find::name) - $index;
			my $cmFile = substr( $File::Find::name, $index, $resid );
			my $Tfile  = "${path2}${cmFile}";
			if ( compare( $File::Find::name, $Tfile ) != 0 ) {
				readpipe("start bcompare ${Tfile} ${File::Find::name}  ");
				print "$Tfile\n";
			}

		}
	}
}

find( \&wanted, $path1 );
