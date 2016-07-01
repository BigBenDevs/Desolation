#pragma once


#include "includes.h"

vector<string> Config::split(string str, char delimiter) 
{
	vector<string> internal;
	stringstream ss(str);
	string tok;

	while (getline(ss, tok, delimiter)) 
	{
		internal.push_back(tok);
	}

	return internal;
}

string readFileContents(string path)
{
	std::ifstream t(path);
	std::string str;

	t.seekg(0, std::ios::end);
	str.reserve(t.tellg());
	t.seekg(0, std::ios::beg);

	str.assign((std::istreambuf_iterator<char>(t)),
		std::istreambuf_iterator<char>());

	return str;
}

vector<keyPair*> Config::parseCfg(string fileName) 
{
	vector<keyPair*> data;
	fileName.append(".cfg");
	string path = "@DesolationServer\\Config\\";
	path.append(fileName);

	string contents = readFileContents(path);
	std::replace(contents.begin(), contents.end(), '\r', '\n');
	vector<string> lines = this->split(contents, '\n');
	for (string &line : lines)
	{
		if (line.find(":") != string::npos) {
			// remove comments
			size_t found = line.find("//");
			if (found != string::npos)
			{
				line.erase(found, string::npos);
			}
			// trim
			trim(line);
			if (line != "") {
				if (line.find(":") != string::npos) {
					vector<string> parts = this->split(line, ':');
					keyPair* pair = new keyPair();
					pair->key = trimmed(parts.at(0));
					pair->value = trimmed(parts.at(1));
					data.push_back(pair);
				}
			}
		}
	}
	return data;
}
vector<string> Config::parseInit() 
{
	vector<string> data;
	string path = "@DesolationServer\\Config\\PluginList.cfg";
	string contents = readFileContents(path);
	
	std::replace(contents.begin(), contents.end(), '\r', '\n'); // replace all 'x' to 'y'
	vector<string> lines = this->split(contents, '\n');
	for (string &line : lines)
	{
		// remove comments
		size_t found = line.find("//");
		if (found != string::npos)
		{
			line.erase(found, string::npos);
		}
		// trim
		trim(line);
		if (line != "") {
			data.push_back(line);
		}
	}
	return data;
}

Config::Config(const char* input)
{
	this->in = string(input);
	vector<string> parts = this->split(this->in, ':');
	parts.push_back("");
	this->function = parts.at(0);
	this->param = parts.at(1);
}
const char* Config::getResponse() 
{
	string response = "[";
	if (this->function == "GetCfgFile")
	{
		vector<keyPair*> values = parseCfg(this->param);

		int i = 0;
		for (keyPair* &value : values)
		{
			if (i != 0) {
				response.append(",");
			}

			response.append("[\""); //["
			response.append(value->key);
			response.append("\",\""); // ","
			response.append(value->value);
			response.append("\"]"); //"]
			i++;
		}
	}
	else if (this->function == "GetInitOrder")
	{
		vector<string> values = parseInit();
		
		int i = 0;
		for (string &value : values)
		{
			if (i != 0) {
				response.append(",");
			}
			response.append("\"");
			response.append(value);
			response.append("\"");
			i++;
		}
	}
	response.append("]");
	return response.c_str();
}