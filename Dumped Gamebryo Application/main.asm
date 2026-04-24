[Compress Func] - Where bsdb store files.
102C0F1C                           SSZ102C0F1C_2__Compress_:

[bsdb] - Main function bsdb
102C0F2C  6273646200                		db	'bsdb',0
102C0F38                           SSZ102C0F38__zip:

[Decompress] - Decompressing arguments.
102C0F38  2E7A697000                		db	'.zip',0
102C0F50                           SSZ102C0F50_Decompress_test_:
102C0F50  4465636F6D7072657373+     		db	'Decompress test',0Ah,0

[Encrypted Nodes] - Check every nif files value and offsets.
102B5888                           SSZ102B5888__encryptedNodes_size_____0:
102B58D4                           SSZ102B58D4__encryptedNodes_size_____0:


[Encrypted Nodes Sub] - Sub routine for above func.
102B5888  5F656E63727970746564+     		db	'_encryptedNodes.size() > 0',0
102B58D4  5F656E63727970746564+     		db	'_encryptedNodes.size() > 0',0

[Error] - Trigger error.
102BC8B8  46696C65206572726F72+     		db	'File error. Please re-install BlackShot.',0

[Fly] - Commands for fly if value is enabled. NOP Function will do to debug.
0095B9F0                           SSZ0095B9F0__BS__Fly:
0095B9F0  2F42532424466C7900        		db	'/BS$$Fly',0

[Clipping] - Commands for clipping if value is enabled. NOP Function will do to debug.
0095B960                           SSZ0095B960__BS__clipping:
0095B960  2F42532424636C697070+     		db	'/BS$$clipping',0

[ESP] - Commands to enable TeamESP if value is enabled. NOP Function will change from colors to original(Green).
0095BCC4                           SSZ0095BCC4__bs__hack1:
0095BCC4  2F627324246861636B31+     		db	'/bs$$hack1',0
