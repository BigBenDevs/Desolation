#pragma once



#include <msclr\marshal.h> 
using namespace System; 
using namespace System::IO;
using namespace msclr::interop; 

class Config
{
private:

public:
	static String^ getResponse(String^ input);
};