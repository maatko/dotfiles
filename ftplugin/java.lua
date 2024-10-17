local jdtls = require("jdtls")
local configurator = require("config.jdtls")

jdtls.start_or_attach(configurator.get_jdtls_config(jdtls))
