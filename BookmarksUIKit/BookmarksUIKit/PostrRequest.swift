import Foundation
struct PostData {
    var urlIn = "http://127.0.0.1:8080/bookmark"
    
    
    func post (name: String, link: String) {
        //let Url = String(format: urlIn)
        guard let serviceURL = URL(string: urlIn) else {
            return
        }
        let linkMod = LinkModel1(name: name, url: link)
   //     let jsonMessage = try? JSONEncoder().encode(linkMod)
        guard let jsonMessage = try? JSONEncoder().encode(linkMod) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        var request = URLRequest(url: serviceURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type") // the request is JSON
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = jsonMessage
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
                print("*************ERROR*************")
            }
            if let response = response {
                print(response)
            }
            if let data = data{
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print("Debug:**** \(json)")
                } catch {
                    print(error)
                }
                print(data)
            }
        }.resume()
    }
    
    func get (complition: @escaping([LinkModel1]) ->() )  {
        var listModel = [LinkModel1]()
        
        let Url = String(format: urlIn)
        guard let serviceURL = URL(string: Url) else {
            return
        }
        let request = URLRequest(url: serviceURL)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            }
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let decoder = JSONDecoder()
                    let lines = try decoder.decode([LinkModel1].self, from:data)
                    lines.forEach { line in
                        let name = line.name ?? "No result"
                        let link =  line.url ?? "No Link"
                        listModel.append(LinkModel1(name: name, url: link))
                        print("name - \(name) link - \(link)")
                    }
                    print(lines)
                    complition(listModel)
                } catch {
                    print("ERRRRRoRRRR",error)
                }
                print(data)
            }
        }.resume()
    }
}
