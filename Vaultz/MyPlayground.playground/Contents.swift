import UIKit

class Curl{
    let SCHEME = "http"
    let METHOD = "POST"
    var hostname, username, password: String
    var port: Int
    var response: URLResponse?
    var responseData: Data?
    var httpResponseError: Error?
    init(hostname: String, username: String, password: String, port: Int){
        self.hostname = hostname
        self.username = username
        self.password = password
        self.port = port
    }
    
    func generateURL() -> URL?{
        var resourcelocator = URLComponents()
        resourcelocator.scheme = self.SCHEME
        resourcelocator.host = self.hostname
        resourcelocator.port = self.port
        resourcelocator.user = self.username
        resourcelocator.password = self.password
        return resourcelocator.url
    }
    
    func getHttpRequest<U: Codable>(method: String, params: [[String:U]]) -> URLRequest{
        var request = URLRequest(url: generateURL()!)
        request.httpMethod = self.METHOD
        request.httpBody = encodeRequest(method: method, params: params)!
        request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        return request
    }
    
    func encodeRequest<U: Codable>(method: String, params: [[String: U]]) -> Data?{
        let encoder = JSONEncoder()
        let request: Request = Request(method: method, params: params)
        do{
            let output = try encoder.encode(request)
            return output
        }catch {
            print("Error encoding data into request.\(error)")
            return nil
        }
    }
    
    func decodeResponse<T: Codable>(data: Data?, _ response: inout T){
        let decoder = JSONDecoder()
        do{
            if data != nil{
                response = try decoder.decode(T.self, from: data!)
            }
        }catch{
            // Not able to decode the given response
            print("\(error)")
        }
    }
    
    func createSession(url: URL) -> URLSessionTask{
        return URLSession.shared.dataTask(with: url){
            self.manageCurlResponse(data: $0, response: $1, error: $2)
        }
    }
    
    func manageCurlResponse(data: Data?, response: URLResponse?, error: Error?){
        if error != nil{
            // Handle error response from komodo server.
            return
        }
        if let httpResponse = response as? HTTPURLResponse{
            if httpResponse.statusCode != 200{
                // Got a wrong response code. Something is wrong
                return
            }
        }
        self.responseData = data
    }
    
    func request<T: Codable>(_ object:inout T){
        let session = self.createSession(url: generateURL()!)
        // Check for race condition
        session.resume()
        decodeResponse(data: self.responseData, &object)
    }
}

struct GetNewAddress: Codable{
    var address: String?
    var error: String?
    var id: String = "curltest"
}

struct Request<U: Codable>: Codable{
    let jsonrpc: Float32 = 1.0
    let id: String = "curltest"
    var method: String
    var params: [[String: U]] = []
}


let connection = Curl(
    hostname: "127.0.0.1",
    username: "user",
    password: "pass",
    port: 7771
)
var newAddress: GetNewAddress = GetNewAddress()
connection.request(&newAddress)
print(newAddress)
