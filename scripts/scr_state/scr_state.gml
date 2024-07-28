// Script assets have changed for v2.3.0 see
function State() constructor {
    static _noop = function() { };

    create = _noop;
    update = _noop;
    destroy = _noop;
}