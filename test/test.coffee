assert = require("assert")
socket = require('socket.io-client')('http://localhost:3000')

describe "#indexOf()", ->
  it "should return -1 when the value is not present", ->
    assert.equal -1, [
      1
      2
      3
    ].indexOf(5)
    assert.equal -1, [
      1
      2
      3
    ].indexOf(0)
  it "should be exist socket.io-client",->
    assert.ok socket
  it "should be connect",(done)->
    socket.on 'connect',done
  it "when emit,callback",(done)->
    socket.on 'tweet:create',->
      done()
    socket.emit 'tweet:create',{msg:"ok?"}