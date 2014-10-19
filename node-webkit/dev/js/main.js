"use strict";


var gCamera, gMesh, gRenderer, gScene;


window.addEventListener( "load", init );


/**
 * Animation loop.
 * @param {float} time Elapsed time.
 */
function animate( time ) {
	requestAnimationFrame( animate );

	gMesh.rotation.x += 0.01;
	gMesh.rotation.y += 0.02;

	gRenderer.render( gScene, gCamera );
}


function init() {
	gScene = new THREE.Scene();

	gCamera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 1, 10000 );
	gCamera.position.z = 600;

	var geometry = new THREE.BoxGeometry( 200, 200, 200 );
	var material = new THREE.MeshPhongMaterial( { color: 0xF54F74 } );
	gMesh = new THREE.Mesh( geometry, material );

	var lightDir1 = new THREE.DirectionalLight( 0xffffff, 0.9 );
	lightDir1.position.set( -40, 100, 100 );

	var lightDir2 = new THREE.DirectionalLight( 0xffffff, 0.5 );
	lightDir2.position.set( 40, -100, 100 );

	gScene.add( gMesh );
	gScene.add( lightDir1 );
	gScene.add( lightDir2 );

	gRenderer = new THREE.WebGLRenderer( { antialias: true } );
	gRenderer.setClearColor( 0xd7eef2 );
	gRenderer.setSize( window.innerWidth, window.innerHeight );

	document.body.appendChild( gRenderer.domElement );

	animate( 0 );
}
