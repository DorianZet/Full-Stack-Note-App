const express = require('express')
const mongoose = require('mongoose')
const { title } = require('process')
var app = express()
var Data = require('./noteSchema') // the dot tells our computer to look in the same folder as this file.

mongoose.connect("mongodb://localhost/newDB") // we want mongoose to connect to mongoDB, which is running on our machine (localhost) and we want to go to new folder of that database, which is 'newDB'.

mongoose.connection.once("open", () => { // once the connection is open, we want to call a function which will print "Connected to DB!"
    console.log("Connected to DB!")
}).on("error", (error) => { // if there is an error, a function that takes an error will be fired which will print our error.
    console.log("Failed to connect " + error)
})

// CREATE A NOTE
// POST request - because we are sending the note we created to the database.
app.post("/create", (req, res) => { // req = request, res = response

    var note = new Data ({
        note: req.get("note"),
        title: req.get("title"),
        date: req.get("date")
    })

    note.save().then(() => { // once the note is saved, then() function will be called.
        if (note.isNew == false) { // if the note is stored on both the server and the database, we know that it's saved to the database. But if it's new, that means that the data is only on the server, which means it failed to save in the database.
            console.log("Saved data!")
            res.send("Saved data!") // this will tell the iPhone that we successfully got the data and saved it.
        } else {
            console.log("Failed to save data!")
        }
    }) 
})

// swap "000.000.0.000" for your IPv4 address.
var server = app.listen(8081, "000.000.0.000", () => { // any device using our network will be able to access the server. 8081 stands for the port we go through.

    console.log("Server is running!")
}) 

// DELETE A NOTE
// POST request - because we are sending the note we want to delete to the database.
app.post("/delete", (req, res) => {

    Data.findOneAndRemove({
        _id: req.get("id") // mongoDB gives each object a unique ID. 
    }, (err) => { // findOneAndRemove() function also takes an error to show if removing an object fails.
        console.log("Failed" + err)
    })

    res.send("Deleted!")
})

// UPDATE A NOTE
// POST request - because we are saving a new note in the database.
app.post('/update', (req, res) => {
    
    Data.findByIdAndUpdate({
        _id: req.get("id")
    }, {
        note: req.get("note"),
        title: req.get("title"),
        date: req.get("date")
    }, (err) => {
        console.log("Failed to update" + err)
    }) // First curly brackets specify the object we want to update. Second one has the new data. Finally, we have an error function which fires off if something goes wrong.

    res.send("Updated!")
})

// FETCH ALL NOTES
// GET request - because the server will go through the database and send the notes back to us.
app.get('/fetch', (req, res) => {
    Data.find({}).then((DBitems) => {
        res.send(DBitems)
    }) // if we leave the curly brackets empty, it means that we want the db to show us everything it has.
})
