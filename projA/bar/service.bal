import ballerina/http;

configurable string fooEp = ?;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {
    
    # A resource for generating greetings
    # + inName - the input string name
    # + return - string name with hello message or error
    resource function get callFoo(string inName) returns string|error {
        // Send a response back to the caller.
        http:Client clientEp = check new (fooEp);
        string res = check clientEp->/greeting (name=inName);
        return res + " - sent from bar";
    }
}
