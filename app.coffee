module.exports = (resource)->
  redis = require('redis')
  REDIS = 
    PORT:process.env.REDIS_PORT_6379_TCP_PORT
    HOST:process.env.REDIS_PORT_6379_TCP_ADDR
  client = redis.createClient(REDIS.PORT,REDIS.HOST)
  {
    set:(obj,cb)->
      client.hmset resource,obj,->
        client.hgetall resource,(e,data)->
          cb e,data
    get:(key,cb)->
      client.hgetall key,(e,data)->
        cb e,data
    push:(obj,cb)->
      client.incr "KEY:#{resource}",(e,id)->
        obj.id = id
        key = "#{resource}:#{id}"
        client.hmset key,obj,->
          cb null,obj
  }
