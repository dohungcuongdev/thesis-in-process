var express = require('express');
var router = express.Router();
var Model = require('../models/follow-users-model');
const getIP = require('external-ip')();
var geoip = require('geoip-lite');
var externalip = require('externalip');
var roomModel = require('../models/room-model.js');

'use strict';

router.get('/userIP/:userIP', function (request, response) {
    var userIP = request.params.userIP;
    Model.findByUserIP(userIP, function (err, res) {
        if (err) {
            response.send(err).status(404);
        } else {
            response.send(res).status(200);
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

router.delete('/:id', function (request, response) {
    var id = request.params.id;
    Model.remove({ _id: id }, function (err, resource) {
        if (err) {
            return response.send(err);
        } else {
            response.send(resource);
        }
    })
});

router.post('/', function (request, response) {
    var follow_users = new Model(request.body);
    var ip_address = '';

    var os = require('os');
    var ifaces = os.networkInterfaces();

    Object.keys(ifaces).forEach(function (ifname) {
        var alias = 0;

        ifaces[ifname].forEach(function (iface) {
            if ('IPv4' !== iface.family || iface.internal !== false) {
                // skip over internal (i.e. 127.0.0.1) and non-ipv4 addresses
                return;
            }

            if (alias >= 1) {
                // this single interface has multiple ipv4 addresses
                //console.log(ifname + ':' + alias, iface.address);
                ip_address = iface.address;
            } else {
                // this interface has only one ipv4 adress
                //console.log(ifname, iface.address);
                ip_address = iface.address;
            }
            ++alias;
        });
    });
    externalip((err, external_ip) => {
        if (err) {
            console.log(err)
        } else {
            var geo = geoip.lookup(external_ip);
            follow_users['user_ip_address'] = ip_address;
            follow_users['external_ip_address'] = external_ip;
            follow_users['country'] = geo.country;
            follow_users['city'] = geo.city;
            follow_users.save(function (err, resource) {
                if (err) {
                    response.send(err).status(501);
                } else {
                    response.json(resource).status(201);
                }
            });

            var roomname = '';

            if(follow_users.page_access.includes('room-details')) {
                roomname = follow_users.page_access.substring(26, 29);
            }

            if(follow_users.page_access.includes('click image in rooms')) {
                roomname = follow_users.page_access.substring(22, 25);
            }

            if(roomname != '') {
                roomModel.findRoomByRoomName(roomname, function (err, room) {
                    if (err) {
                        console.log(err);
                    } else {
                        Model.findByUserIP(ip_address, function (err, userip) {
                            if (err) {
                                console.log(err);
                            } 
                            if(userip) {
                                console.log("update");
                            } else {
                                console.log("insert");
                            }
                        });
                        console.log(room);
                    }
                });
            }
        }
    });
});


module.exports = router;
