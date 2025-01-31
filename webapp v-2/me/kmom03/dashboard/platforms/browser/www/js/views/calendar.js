/* Calendar main
calendar.js*/
"use strict";
var m = require("mithril");

var CalendarModel = require("../models/calendar");

var Day = {
    view: function (vnode) {
        return m("div.widget" + vnode.attrs.red_day, [
            m("p", [m("strong", vnode.attrs.date)]),
            m("i", vnode.attrs.weekday)
        ]);
    }
};

module.exports = {
    oninit: function () {
        CalendarModel.load();
    },
    view: function () {
        return [
            m("h1", "Calendar"),
            m("div.flex-container", CalendarModel.days.map(function (day) {
                return m(Day, day);
            }))
        ];
    }
};
