require('source-header-switcher').setup{
  root_pattern = require('configure').workspace
}

udf.switch_source_header = require('source-header-switcher').switch
