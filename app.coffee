redis = require('redis')
async = require('async')
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
  getOne = (id,cb)->
      key = "#{resource}:#{id}"
      client.hgetall key,(e,data)->
        cb e,data
  getAll = (cb)->
    result = []
    client.keys "#{resource}*",(e,keys)->
      async.each keys, (key,cb)->
        client.hgetall key,(e,data)->
          result.push data
          cb()
      ,->
        cb null,result
  {
    get:(id,cb)->
      getOne(id,cb)
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


