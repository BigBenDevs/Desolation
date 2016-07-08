/*


*/

//--- create fresh spawn UI & w8 for it to exit
createDialog "DS_spawnSelection";
while{!isNull (findDisplay 4000)} do {
	0 cutText ["","BLACK FADE",0];
};