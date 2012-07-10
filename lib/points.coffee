Points  = require("lin").Points
Stream  = require("stream").Stream

# This probably belongs to Points, if necessary at all...
# It could also be more efficient. Therefore...
# TODO:
# Expect / pass a JSONStream to the Points constructor.
# Don't stringify, because phase will parse it again.

module.exports = (stream, settings) ->
  restream = new Stream
  stream.on "data", (precious) ->
    data = JSON.parse precious
    # TODO: The `settings` should be known at the `eden` cli level.
    settings ?= data['0']?.re
    # NOTE: check whatever `Points` needs the `settings` for...
    points = new Points [], data: data, settings: settings
    restream.emit "data", JSON.stringify(points.toJSON()) + "\n"
  restream