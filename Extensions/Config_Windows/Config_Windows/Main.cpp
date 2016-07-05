#include "includes.h"

extern "C"
{
	__declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
};


void __stdcall RVExtension(char *output, int outputSize, const char *function)
{
	outputSize -= 1;
	marshal_context^ context = gcnew marshal_context();
	String^ ext_in = marshal_as<String^>(function);
	
	String^ ext_out = Config::getResponse(ext_in);

	strncpy_s(output, outputSize, context->marshal_as<const char*>(gcnew String(ext_out)), _TRUNCATE);
	delete context;
}