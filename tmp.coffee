redis = require('redis')
User = require('./app')('user')
client = redis.createClient(process.env.REDIS_PORT_6379_TCP_PORT,process.env.REDIS_PORT_6379_TCP_ADDR)

my = {name:"takashi","age":22}

client.hmset 'user:admin',my,(e,data)->
  console.log e,data
# client.hgetall 'user:admin',(e,data)->
#   console.log e,data
# User.push my,(e,data)->
#   console.log e,data