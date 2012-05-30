Points  = require("lin").Points
Stream  = require("stream").Stream

# This probably belongs to Points, if necessary at all...
# It could also be more efficient.

module.exports = (stream, settings) ->
  restream = new Stream
  stream.on "data", (precious) ->
    points = new Points [], {data: JSON.parse(precious), settings: settings}
    restream.emit "data", JSON.stringify(points.toJSON()) + "\n"
  restream
