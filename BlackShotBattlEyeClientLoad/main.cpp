char __thiscall InitBattlEye(char *BE_CallBack_1, LPCSTR lpLibFileName, int a3, u_long netlong, u_short netshort)
{
  char *BE_CallBack; // esi
  const CHAR *v6; // eax
  HMODULE v7; // eax
  FARPROC v8; // edi
  int v9; // ecx
  int BE_GameData; // [esp+8h] [ebp-18h]
  u_long v12; // [esp+Ch] [ebp-14h]
  u_short v13; // [esp+10h] [ebp-10h]
  int (__cdecl *v14)(char *); // [esp+14h] [ebp-Ch]
  void (__cdecl *v15)(int); // [esp+18h] [ebp-8h]
  void (__cdecl *v16)(char *, size_t); // [esp+1Ch] [ebp-4h]

  BE_CallBack = BE_CallBack_1;
  sub_409D85((int)BE_CallBack_1);
  v6 = lpLibFileName;
  if ( *((_DWORD *)lpLibFileName + 5) >= 0x10u )
    v6 = *(const CHAR **)lpLibFileName;
  v7 = LoadLibraryA(v6);
  *((_DWORD *)BE_CallBack + 1) = v7;
  if ( v7 )
  {
    v8 = GetProcAddress(v7, "Init");
    if ( v8 )
    {
      v9 = a3;
      if ( *(_DWORD *)(a3 + 20) >= 0x10u )
        v9 = *(_DWORD *)a3;
      BE_GameData = v9;
      v12 = ntohl(netlong);
      v13 = ntohs(netshort);
      v14 = sub_409F9A;
      v15 = sub_40A0B7;
      v16 = sub_40A23B;
      if ( ((unsigned __int8 (__cdecl *)(signed int, int *, char *))v8)(3, &BE_GameData, BE_CallBack + 8) )
        return 1;
    }
    FreeLibrary(*((HMODULE *)BE_CallBack + 1));
    *((_DWORD *)BE_CallBack + 1) = 0;
  }
  return 0;
}

int __thiscall UnloadBattlEye(int this)
{
  int v1; // esi
  int result; // eax
  int (__stdcall ***v3)(signed int); // ecx

  v1 = this;
  if ( *(_DWORD *)(this + 4) )
  {
    result = (*(int (**)(void))(this + 8))();
    if ( *(_DWORD *)(v1 + 4) )
    {
      result = FreeLibrary(*(HMODULE *)(v1 + 4));
      *(_DWORD *)(v1 + 4) = 0;
    }
  }
  v3 = *(int (__stdcall ****)(signed int))(v1 + 28);
  if ( v3 )
  {
    result = (**v3)(1);
    *(_DWORD *)(v1 + 28) = 0;
  }
  return result;
}
