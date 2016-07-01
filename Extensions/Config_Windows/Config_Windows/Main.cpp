#include "includes.h"

BOOL APIENTRY DllMain(HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
	switch (ul_reason_for_call)
	{
	case DLL_PROCESS_ATTACH:
	case DLL_THREAD_ATTACH:
	case DLL_THREAD_DETACH:
	case DLL_PROCESS_DETACH:
		break;
	}
	return TRUE;
}

extern "C"
{
	__declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
};


void __stdcall RVExtension(char *output, int outputSize, const char *function)
{
	outputSize -= 1;
	Config* cfg = new Config(function);
	strncpy(output, cfg->getResponse(), outputSize);
	delete cfg;
}