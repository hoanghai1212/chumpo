'use strict';
var p = Object.defineProperty;
var d = Object.getOwnPropertyDescriptor;
var c = Object.getOwnPropertyNames;
var u = Object.prototype.hasOwnProperty;
var x = (o, r) => {
    for (var e in r) p(o, e, { get: r[e], enumerable: !0 });
  },
  l = (o, r, e, n) => {
    if ((r && typeof r == 'object') || typeof r == 'function')
      for (let t of c(r))
        !u.call(o, t) && t !== e && p(o, t, { get: () => r[t], enumerable: !(n = d(r, t)) || n.enumerable });
    return o;
  };
var m = (o) => l(p({}, '__esModule', { value: !0 }), o);
var f = {};
x(f, { Button: () => P, Version: () => b });
module.exports = m(f);
var s = require('react/jsx-runtime'),
  P = ({ children: o, onClick: r }) =>
    (0, s.jsx)('button', { className: 'rounded-sm bg-red-200 px-1 py-2', onClick: r, children: o });
var i = require('react/jsx-runtime'),
  b = ({ version: o }) => (0, i.jsx)('p', { children: o });
0 && (module.exports = { Button, Version });
