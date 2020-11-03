%dw 2.0
output application/json
---
{
	message: "The client sent a type of request which is not supported by the requested endpoint. Verify that your request's Content-Type matches the requested endpoint accepted content."
}