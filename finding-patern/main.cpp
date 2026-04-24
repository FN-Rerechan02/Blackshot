// code 1
uintptr_t FindPattern( uintptr_t start, uintptr_t length, const unsigned char* pattern, const char* mask )
{
	size_t pos = 0;
	auto maskLength = strlen( mask ) - 1;
 
	auto startAdress = start;
	for( auto it = startAdress; it < startAdress + length; ++it )
	{
		if ( Read<unsigned char>( LPVOID(it) ) == pattern[pos] || mask[pos] == '?' )
		{
			if ( mask[pos + 1] == '\0' )
				return it - maskLength;
 
			pos++;
		}
		else pos = 0;
	}
	return 0;
}


// code 2
uintptr_t FindPattern( HMODULE hModule, const unsigned char* pattern, const char* mask )
{
	IMAGE_DOS_HEADER DOSHeader = Read<IMAGE_DOS_HEADER>( hModule );
	IMAGE_NT_HEADERS NTHeaders = Read<IMAGE_NT_HEADERS>( LPVOID( uintptr_t( hModule ) + DOSHeader.e_lfanew ) );
 
	return FindPattern( 
		reinterpret_cast<uintptr_t>( hModule ) + NTHeaders.OptionalHeader.BaseOfCode,
		reinterpret_cast<uintptr_t>( hModule ) + NTHeaders.OptionalHeader.SizeOfCode, pattern, mask );
}
