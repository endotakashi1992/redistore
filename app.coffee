module.exports = (->
  redis = require('redis')
  REDIS = 
    PORT:process.env.REDIS_PORT_6379_TCP_PORT
    HOST:process.env.REDIS_PORT_6379_TCP_ADDR

  client = redis.createClient(REDIS.PORT,REDIS.HOST)


  {
    set:(obj,cb)->
      client.hmset 'user:admin',obj
      client.hgetall 'user:admin',(e,data)->
        cb e,data
    get:(key,cb)->
      client.hgetall 'user:admin',(e,data)->
        cb e,data
  }
)()