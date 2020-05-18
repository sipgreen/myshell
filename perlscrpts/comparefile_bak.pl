use File::Compare;
use strict;
use File::Find;
#Product/Release/177_1202/FltPrdSys

my $args0=$ARGV[0];
my $path = 'D:/src/Flight/Product/Release/177_1202/FltPrdSys/ProductWS';
#EntityLayer/FlightSearchAPI.Entity
my $fsdf="";

sub wanted {
    if ( -f $File::Find::name ) {
        if ( $File::Find::name =~ /\.cs$/ )
         {
			$_ = $File::Find::name;
			s/Release\/177_1202/Branch\/DevBranch0001/gi;
            $fsdf = $_;
			if(compare($File::Find::name,$fsdf) != 0)
			{				
				readpipe("start bcompare ${File::Find::name}  ${fsdf}");
				print "$fsdf\n";
			}
        }
    }
}

find(\&wanted, $path );





