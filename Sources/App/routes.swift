import Vapor

func routes(_ app: Application) throws {
    app.get(".well-known", "apple-app-site-association") { req -> Response in
        let appIdentifier = "YWLW23LT6G.bar.multi.wallet"
        let responseString =
            """
            {
                "applinks": {
                    "details": [
                        {
                            "appIDs": [
                                "\(appIdentifier)"
                            ],
                            "components": [
                            ]
                        }
                    ]
                },
                "webcredentials": {
                    "apps": [
                        "\(appIdentifier)"
                    ]
                }
            }
            """
        let response = try await responseString.encodeResponse(for: req)
        response.headers.contentType = HTTPMediaType(type: "application", subType: "json")
        return response
    }
}
