const http = require('http');
const fs = require('fs');

let file = fs.createWriteStream("a.ts");

let options = {
  host: "localhost",

  //query the file by key, this will do an internal redirect to assets location
  path: "/file/qazxswe",

  // THIS WILL GIVE A 404, since the route is internal
  //path: "/assets/a/interlaced/IPHONE5.ts",
  port: 80,
  headers: {
    //range: "bytes=0-1023"
    range: "bytes=0-9486856"
  }
}

http.get(options, (resp) => {
  console.log(resp.statusCode);
  console.log(resp.statusMessage);
  resp.pipe(file);
}).on("error", (e) => {
  console.error("Error", e);
})
