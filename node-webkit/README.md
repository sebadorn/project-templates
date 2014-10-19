# Project template: node-webkit

A project template for creating standalone applications with [node-webkit](https://github.com/rogerwang/node-webkit). This project creates a small window with a rotating cube in it, using [three.js](http://threejs.org/).


## Directories and files

* `./build.sh` Build script. Output will be generated in `build/`.
* `./run.sh` A script to start the built standalone application.
* `./build/` Files needed for and created by the build process.
* `./build/main.nw` The created node-webkit application (not standalone).
* `./build/main` The standalone application.
* `./dev/` Everything that your application needs to run and that should be packed into the final application.


## Notes

As it is now with node-webkit 0.10.x, standalone applications require the files `nw.pak` and `icudtl.dat` which are distributed with node-webkit. The build script takes care of this.
