#include "includes.h"


String^ Config::getResponse(String^ input)
{
	String^ response = "[";
	if (input->Equals("GetInitOrder"))
	{
		array<String^>^ FileContents = File::ReadAllLines("@DesolationServer\\Config\\PluginList.cfg");
		for each(String^ line in FileContents)
		{
			int index = line->IndexOf("//");
			if (index > -1) {
				line = line->Remove(index, line->Length - index);
			}
			line = line->Trim();
			if (line != "")
			{
				response += "\"";
				response += line;
				response += "\"";
				response += ",";
			}
		}
	}
	else if(input->StartsWith("GetCfgFile"))
	{
		array<String^>^ parts = input->Split(':');
		if (parts->Length > 1) {
			String^ param = parts[1];
			if (File::Exists("@DesolationServer\\Config\\" + param + ".cfg")) {
				array<String^>^ FileContents = File::ReadAllLines("@DesolationServer\\Config\\" + param + ".cfg");
				for each(String^ line in FileContents)
				{
					int index = line->IndexOf("//");
					if (index > -1) {
						line = line->Remove(index, line->Length - index);
					}
					line = line->Trim();
					if (line->Contains(":"))
					{
						array<String^>^ lineParts = line->Split(':');
						String^ key = lineParts[0]->Trim();
						String^ value = lineParts[1]->Trim();
						response += "[\"";
						response += key;
						response += "\"";
						response += ",";
						response += "\"";
						response += value;
						response += "\"],";
					}
				}
			}
		}
	}
	if (response->Length > 1) {
		response = response->Remove(response->Length - 1, 1);
	}
	response += "]";
	return response;
}
