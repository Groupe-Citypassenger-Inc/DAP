--[[
--
-- File loading constants from configuration file
--
--]]
parser    = require 'LIP'
constants = {}

ini_conf_path  = '/etc/proxy.ini'
ini_conf_data  = parser.load(ini_conf_path)

function constants.__init__()
  constants.PortalUrl  = ini_conf_data.portal.url
  local path_mac_addr  = ini_conf_data.ap.mac_addr     
  constants.ap_mac     = io.popen('/bin/cat ' .. path_mac_addr):read('*l')
  constants.ap_timeout = tonumber(ini_conf_data.ap.timeout)
  constants.localdb    = ini_conf_data.localdb.path
  constants.ap_secret  = ini_conf_data.ap.secret
end

constants.__init__()

return constants
