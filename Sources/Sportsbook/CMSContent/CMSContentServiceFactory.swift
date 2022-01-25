import Vapor

public struct CMSContentServiceFactory {

    public var make: ((Request) -> CMSContentService)?

    public mutating func use(_ make: @escaping ((Request) -> CMSContentService)) {
        self.make = make
    }

}
