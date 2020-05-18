open(file,"<","D:/src/sharetools/alias.txt");
@linelist=<file>;

foreach $_(@linelist)
{
	if(/alias\s+(\w+)\s+([^\r\n]+)/gi)
	{
		print "$1\r\n";
		s/\s+/""/gi;
		open(filetemp,">","D:/src/sharetools/aliastemp/$1.bat");
		print filetemp ($2);
	}
}
print @linelist;
