const conn = new WebSocket('ws://localhost:3012');

conn.onopen = function(e) {
  console.log("Connection established!");
};

conn.onmessage = function(e) {
  console.log(e.data);
};