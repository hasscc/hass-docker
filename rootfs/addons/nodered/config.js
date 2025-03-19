const config = require("/config/node-red/settings.js");
const bcrypt = require("bcryptjs");

// Sane and required defaults for the add-on
config.debugUseColors = false;
config.flowFile = "flows.json";
config.nodesDir = "/config/node-red/nodes";
config.userDir = "/config/node-red/";
if (! "uiHost" in config) {
  config.uiHost = "0.0.0.0";
}
config.uiPort = process.env.NODERED_PORT || 1880;

// Admin Auth
if (process.env.NODERED_PASSWORD) {
  config.adminAuth = {
    type: "credentials",
    users: [
        {
            username: process.env.NODERED_USERNAME || "homeassistant",
            password: bcrypt.hashSync(process.env.NODERED_PASSWORD, 8),
            permissions: "*"
        }
    ]
  };
}

module.exports = config;