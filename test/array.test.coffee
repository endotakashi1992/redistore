assert = require("assert")
Redisful = require('../app')
User = Redisful('user')
describe "app test", ->
  obj = {name:"takashi",age:22}
  id = ""
  before (done)->
    User.push obj,(e,data)->
      id = data.id
    done()
  it "shuld be app",->
    assert.ok User

  it "shuld be get",(done)->
    User.get id,(e,data)->
      assert.ok data
      done()
      
  it "shuld be push",(done)->
    User.push obj,(e,data)->
      assert.ok data.id
      done()
  it "shuld be child",(done)->
    assert.ok User.child(1)
    done()

  it "shuld be get all",(done)->
    User.get (e,d)->
      assert.ok d
      done()