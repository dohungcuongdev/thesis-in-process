const cors = require('cors');

var express = require('express');
var router = express.Router();
var Model = require('../models/room-model.js');

router.get('/userip/:ip', function (request, response) {
    Model.find({}, function (err, rooms) {
        if (err) {
            response.send(err).status(404);
        } else {
            //test ip
            var ip_suggest = {
                "ip": "192.168.1.1",
                "size": 100,
                "price": 200,
                "avgAminities": 200
            };

            var arrP = get4NumNearest(rooms, 'price', ip_suggest.price);
            var arrS = get4NumNearest(rooms, 'size', ip_suggest.size);
            var arrA = get4NumNearest(rooms, 'avgAminities', ip_suggest.avgAminities);

            var roomSuggested = arrP.concat(arrS).concat(arrA).unique();
            response.send(roomSuggested).status(200);
        }
    });
});

router.get('/:id', function (request, response) {
    var id = request.params.id;
    Model.findById(id, function (err, res) {
        if (err) {
            response.send(err).status(404);
        } else {
            response.json(res);
        }
    });
});


router.get('/', function (request, response) {
    Model.find({}, function (err, resources) {
        if (err) {
            response.send(err).status(404);
        } else {
            response.send(resources).status(200);
        }
    });
});


router.put('/:id', function (req, res, next) {
    Model.findByIdAndUpdate(req.params.id, req.body, function (err, room) {
        if (err) return next(err);
        else {
            res.json(room);
        }
    });
});


module.exports = router;

function get4NumNearest(rooms, att, value) {
	var temp = [];
	for(var i = 0; i < rooms.length; i++) {
		var attvalue = 0;
		if(att == 'size')
			attvalue = rooms[i].size;
		if(att == 'price') 
			attvalue = rooms[i].price;
		if(att == 'avgAminities') 
			attvalue = rooms[i].avgAminities;	
		temp[i] = Math.abs(attvalue - value);
	}
	var result = getIndicesOfMax(temp, 4);
	var finalresult = [];
	for(var i = 0; i < result.length; i++)
		finalresult[i] = rooms[result[i]];
	return finalresult;
}

function getIndicesOfMax(inp, count) {
    var outp = [];
    for (var i = 0; i < inp.length; i++) {
        outp.push(i); // add index to output array
        if (outp.length > count) {
            outp.sort(function(a, b) { return inp[a] - inp[b]; }); // descending sort the output array
            outp.pop(); // remove the last index (index of smallest element in output array)
        }
    }
    return outp;
}

Array.prototype.unique = function() {
    var a = this.concat();
    for(var i=0; i<a.length; ++i) {
        for(var j=i+1; j<a.length; ++j) {
            if(a[i] === a[j])
                a.splice(j--, 1);
        }
    }
    return a;
}