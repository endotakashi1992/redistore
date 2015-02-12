redis = require('redis')
client = redis.createClient(process.env.REDIS_PORT_6379_TCP_PORT,process.env.REDIS_PORT_6379_TCP_ADDR)

my = {name:"takashi","age":22}

client.hmset 'user:admin',my
client.hgetall 'user:admin',(e,data)->
  console.log e,data