#!/usr/bin/env coffee

require.paths.unshift __dirname + "/../lib"
require.paths.unshift __dirname + "/../node_modules"

Ephemeris = require "ephemeris"
e = new Ephemeris
e.swe "set_ephe_path", e.settings.data

for i in [0..9]
  console.log e.swe "get_planet_name", i

e.swe "close"