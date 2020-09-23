const which = require('which');

exports.whichSyncImpl = function (command, options) {
  options = options || {};

  return which.sync(command, {
    nothrow: true,
    path: options.path,
    pathExt: options.pathExt,
  });
};

exports.whichAllSyncImpl = function (command, options) {
  options = options || {};

  return which.sync(command, {
    nothrow: true,
    all: true,
    path: options.path,
    pathExt: options.pathExt,
  });
};
