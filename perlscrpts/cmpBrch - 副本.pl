use File::Compare;
use strict;
use File::Find;

my $args0 = $ARGV[0];
my $path  = "D:/src/Flight/Product/Release/$ARGV[0]/FltPrdSys";
my $Rpl   = "Release/${args0}";
if ( $args0 =~ /MainLine/gi ) {
	$path = "D:/src/Flight/Product/MainLine/Publish/FltPrdSys";
	$Rpl  = "MainLine/Publish";
}

=pod
print ($ARGV[1]&1);
print "\n";
print ($ARGV[1]&2);
=cut

sub wanted {
	if ( -f $File::Find::name ) {
		my $ibool = 0;
		if ( scalar(@ARGV) > 1 ) {
			if (
				($ARGV[1] & 0x01) == 0x01
				&& (
					   $File::Find::name =~ /ConfigProfile\.xml$/
					|| $File::Find::name =~ /config\.tpl$/
				)
			  )
			{
				$ibool = 1;
			}			
			if ( ($ARGV[1] & 0x02 )== 0x02 && $File::Find::name =~ /\.cs$/ )
			{
				$ibool = 1;
			}	

		}
		else {
			if ( $File::Find::name =~ /\.cs$/  ) {
				$ibool = 1;
			}
		}
		
		
		if (
			$ibool == 1
			&& !( $File::Find::name =~ /FltPrdSys\/SyncNearCityConsole/ )
			&& (   ( $File::Find::name =~ /FltPrdSys\/CoreSearchEngine/ )
				|| ( $File::Find::name =~ /FltPrdSys\/ProductWS/ ) )
		  )
		{
			$_ = $File::Find::name;
			s/${Rpl}/Branch\/DevBranch0001/gi;
			my $fsdf = $_;
			if ( compare( $File::Find::name, $fsdf ) != 0 ) {
				readpipe("start bcompare ${fsdf} ${File::Find::name}  ");
				print "$fsdf\n";
			}

		}
	}
}
find( \&wanted, $path );
