assert = require("assert")
redisful = require('../app')

describe "app test", ->
  obj = {name:"takashi",age:22}
  it "shuld be app",->
    assert.ok redisful
  it "shuld be set",(done)->
    
    redisful.set obj,(e,data)->
      assert.equal obj.name, data.name
      done()
  it "shuld be get",(done)->
    redisful.get 'user:admin',(e,data)->
      assert.ok data
      done()
  it "shuld be create",(done)->
    row = redisful.create(obj)
    row.save ->
      assert.ok true
      done()