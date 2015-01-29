io = require("socket.io")(3000)
redis = require("socket.io-redis")
io.adapter redis(
  host: "localhost"
  port: 6379
)

io.on 'connection',(socket)->
  socket.on 'tweet:create',->
    io.emit 'tweet:create',{msg:true}
