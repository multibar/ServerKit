import Vapor
import CoreKit

public func configure(_ app: Application) throws {
    Core.Manager.shared.initialize(with: app)
    app.quoter.initialize()
    print(app.environment)
    try routes(app)
}

extension Application: AppBridge {
    public func app(state: CoreKit.System.App.State) {}
    public func user(state: CoreKit.System.User.State) {}
    public func notifications() async -> CoreKit.Notifications.State { .unknown }
    public func requestNotifications() {}
}
