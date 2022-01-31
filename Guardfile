guard :shell do
  watch(/.*/) {
    `pwd`
    `bash ../watcher/watcher.sh`
  }

  ignore %r{^ignored/path/}, /public\/static/
  ignore %r{^ignored/path/}, /node_modules/
  ignore %r{^ignored/path/}, /vendor/
end
