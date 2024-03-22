#include "stdafx.h"

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
					 )
{
    return TRUE;
}

extern "C" __declspec(dllexport) 
bool __stdcall SecureEngineInitialize(void)
{
	MessageBoxA(NULL, "Calling SecureEngineInitialize", "TestPlugin", MB_OK | MB_ICONINFORMATION);
	return true;		// Continue execution
}

extern "C" __declspec(dllexport) 
bool __stdcall SecureEngineFinalize(void)
{
	MessageBoxA(NULL, "Calling SecureEngineFinalize", "TestPlugin", MB_OK | MB_ICONINFORMATION);
	return true;		// Continue execution
}

extern "C" __declspec(dllexport) 
bool __stdcall SecureEngineShowCustomMessageA(
	int	  MsgId,
	char* MsgBody)
{
	MessageBoxA(NULL, MsgBody, "SecureEngineShowCustomMessageA", MB_OK | MB_ICONINFORMATION);
	return true;		// TRUE = Message has been handled. The protection won't display it
}
 
extern "C" __declspec(dllexport) 
bool __stdcall SecureEngineGetFingerPrintA(
	char* pFingerprint)
{
	MessageBoxA(NULL, pFingerprint, "SecureEngineGetFingerPrintA", MB_OK | MB_ICONINFORMATION);
	return true;		// TRUE = Message has been handled. The protection won't display it
}

extern "C" __declspec(dllexport) 
bool __stdcall SecureEngineGetEncryptionKey(
	int	  ZoneId,
	char* pOutputEncryptionKey)
{
	strcpy(pOutputEncryptionKey, "My Encryption Key");
	return true;		// Continue execution
}

