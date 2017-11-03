

var bcrypt = require('bcryptjs');
var mongoose = require('mongoose');
var Schema = mongoose.Schema;
mongoose.Promise = global.Promise;


var ipSuggestSchema = new Schema(
    {
        ip: String,
        size: Number,
        price: Number,
        avgAminities: Number
    },
    {
        collection: 'ip-suggest'
    }
);

var ipSuggest = module.exports = mongoose.model('ip-suggest', ipSuggestSchema);

