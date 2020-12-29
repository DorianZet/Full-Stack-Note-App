// noteSchema allows us to define how our note object will look like.

var mongoose = require('mongoose')
var Schema = mongoose.Schema

var note = new Schema({ // we define our note object so that mongoDB can recognise it.
    title: String,
    date: String,
    note: String
})

const Data = mongoose.model("data", note) // we create a data object, which is actually a note schema.

module.exports = Data // allows us to access the note schema from server.js file.