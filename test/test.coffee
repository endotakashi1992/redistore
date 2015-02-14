assert = require("assert")
Redisful = require('../app')
User = Redisful('user')

describe "app test", ->
  obj = {name:"takashi",age:22}
  it "shuld be app",->
    assert.ok User
  it "shuld be set",(done)->
    User.set obj,(e,data)->
      assert.equal obj.name, data.name
      done()
  it "shuld be get",(done)->
    User.get 'user:admin',(e,data)->
      assert.ok data
      done()
  it "shuld be push",(done)->
    User.push obj,(e,data)->
      assert.ok data.id
      done()