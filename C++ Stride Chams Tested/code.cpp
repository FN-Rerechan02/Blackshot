//

    if( ( Stride == 32) && Menu.chams == true )
    	{
    		
    		if( GAME_TYPE == Blackshot && Stride == 32 )
    		{
    			
     
    		        if (stride1)
    			{
    				Device->SetRenderState(D3DRS_ZENABLE, false);
    				Device->SetTexture( 0, Yellow );
    				Device->DrawIndexedPrimitive( Type, BaseVertexIndex, MinIndex, NumVertices, StartIndex, PrimitiveCount);
    				Device->SetRenderState(D3DRS_ZENABLE, true);
    				Device->SetTexture( 0, Red );
    			}
    			
    			else if (stride2)
    			{
    				Device->SetRenderState(D3DRS_ZENABLE, false);
    				Device->SetTexture( 0, Green );
    				Device->DrawIndexedPrimitive( Type, BaseVertexIndex, MinIndex, NumVertices, StartIndex, PrimitiveCount);
    				Device->SetRenderState(D3DRS_ZENABLE, true);
    				Device->SetTexture( 0, Blue );
    			}

//

    DEFINEAPI(NTSTATUS,NtQueryVirtualMemory,(HANDLE ProcessHandle,PVOID BaseAddress,MEMORY_INFORMATION_CLASS MemoryInformationClass,PVOID Buffer,DWORD Length,PDWORD ResultLenght));
    DEFINEAPI(NTSTATUS,NtWriteVirtualMemory,(HANDLE ProcessHandle,PVOID BaseAddress,PVOID DataBuffer,DWORD BytesToWrite,PDWORD BytesWritten));
    DEFINEAPI(NTSTATUS,NtReadVirtualMemory,(HANDLE ProcessHandle,PVOID BaseAddress,PVOID DataBuffer,DWORD BytesToRead,PDWORD BytedReaded));
    DEFINEAPI(NTSTATUS,NtAllocateVirtualMemory,(HANDLE ProcessHandle,PVOID *BaseAddress,DWORD ZeroBits,PDWORD RegionSize,DWORD AllocatinType,DWORD Protect));
    DEFINEAPI(NTSTATUS,NtFreeVirtualMemory,(HANDLE ProcessHandle,PVOID *BaseAddress,PDWORD RegionSize,DWORD FreeType));
     
    int main(int argc, WCHAR* argv[])
    {
            //importações é uma variável global definida em algum lugar do tipo DLLEXPORTS
            imports.GetAPI(L"NtQueryVirtualMemory");
    	imports.GetAPI(L"NtWriteVirtualMemory");
    	imports.GetAPI(L"NtReadVirtualMemory");
    	imports.GetAPI(L"NtAllocateVirtualMemory");
    	imports.GetAPI(L"NtFreeVirtualMemory");
            
    	auto a = USEAPI(imports,NtWriteVirtualMemory);
    	auto b = USEAPI(imports,NtReadVirtualMemory);
            auto c = imports.RawGetProcAddress<somedefinedfunctiontype>(module handle,functionname);
     
            a(params,params,params);
            b(params,params,params);
            c(params,params,params);
            USEAPI(imports,NtQueryVirtualMemory)(params,params,params...);
     
            return 0;
    }

