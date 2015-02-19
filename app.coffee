redis = require('redis')
REDIS = 
  PORT:process.env.REDIS_PORT_6379_TCP_PORT || 6379
  HOST:process.env.REDIS_PORT_6379_TCP_ADDR || "127.0.0.1"
client = redis.createClient(REDIS.PORT,REDIS.HOST)

Robject = (key)->
  {
    set:(obj,cb)->
      client.hmset key,obj,->
        client.hgetall resource,(e,data)->
          cb e,data
    get:(cb)->
      client.hgetall key,(e,data)->
        cb e,data
  }

Rarray = (resource)->
  {
    get:(id,cb)->
      key = "#{resource}:#{id}"
      client.hgetall key,(e,data)->
        cb e,data
    push:(obj,cb)->
      client.incr "KEY:#{resource}",(e,id)->
        obj.id = id
        key = "#{resource}:#{id}"
        client.hmset key,obj,->
          cb null,obj
    child:(id)->
      Robject "#{resource}:#{id}"
  }



module.exports = (arg)->
  if arg.indexOf(":") is -1
    Rarray(arg)
  else
    Robject(arg)


