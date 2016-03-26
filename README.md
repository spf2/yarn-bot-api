# yarn-bot-api
API Description for Yarn bots

## Protocol Buffers
The IDL used for this API is proto3, the nearly-released update to Google's protocol buffers. One of the improvements is a clear and simple [mapping to JSON](https://developers.google.com/protocol-buffers/docs/proto3#json). Basically it's exactly what you'd expect, and the oneof union types are not explicitly encoded.

[Here](sample-call.json) is a sample json request for a bot being added to a thread.
