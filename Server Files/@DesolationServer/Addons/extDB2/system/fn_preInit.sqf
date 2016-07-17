diag_log "---------------------------------------------------------------------";
diag_log "---------------------------------------------------------------------";
private  _result = "extDB2" callExtension "9:VERSION";
if (_result == "") then
{
  diag_log "extDB2 Failed to Load, Check Requirements @ https://bitbucket.org/torndeco/extdb3/wiki/Installation";
  diag_log "";
  diag_log "If you are running this on a client, Battleye will random block extensions. Try Disable Battleye";
  extDB2_var_loaded = false;
} else {
  diag_log "extDB2 Loaded";
  extDB2_var_loaded = true;
};
diag_log "---------------------------------------------------------------------";
diag_log "---------------------------------------------------------------------";
