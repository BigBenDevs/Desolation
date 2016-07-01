#pragma once
#define WIN32_LEAN_AND_MEAN             // Exclude rarely-used stuff from Windows headers

#include <Windows.h>
#include <cstdlib>
#include <cstring>
#include <string>
#include <iostream>
#include <vector>
#include <sstream>
#include <algorithm>
#include <functional>
#include <fstream>
#include <streambuf>
#include <cctype>
#include <locale>
using namespace std;

// trim from start (in place)
static inline void ltrim(std::string &s) {
	s.erase(s.begin(), std::find_if(s.begin(), s.end(), std::not1(std::ptr_fun<int, int>(std::isspace))));
}

// trim from end (in place)
static inline void rtrim(std::string &s) {
	s.erase(std::find_if(s.rbegin(), s.rend(), std::not1(std::ptr_fun<int, int>(std::isspace))).base(), s.end());
}

// trim from both ends (in place)
static inline void trim(std::string &s) {
	ltrim(s);
	rtrim(s);
}

// trim from start (copying)
static inline std::string ltrimmed(std::string s) {
	ltrim(s);
	return s;
}

// trim from end (copying)
static inline std::string rtrimmed(std::string s) {
	rtrim(s);
	return s;
}

// trim from both ends (copying)
static inline std::string trimmed(std::string s) {
	trim(s);
	return s;
}


struct keyPair
{
public:
	string key;
	string value;
};

class Config
{
private:
	string in;
	string param;
	string function;
	string response;

	vector<string> split(string str, char delimiter);
	vector<keyPair*> parseCfg(string fileName);
	vector<string> parseInit();
public:
	Config(const char* input);
	const char* getResponse();
};