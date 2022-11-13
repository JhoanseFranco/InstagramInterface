//
//  UserModel.swift
//  InstagramInterface
//
//  Created by jhoan sebastian franco cardona on 12/11/22.
//

import Foundation

struct UserModel: Identifiable{
    let id = UUID()
    let userName: String
    let profilePicture: String
    let city: String
    let isVerified: Bool
    
    static func getUsers() -> [UserModel]{
        return [
            .init(userName: "Karennne", profilePicture: "person-1", city: "Tokyo, Japan", isVerified: true),
            .init(userName: "Pablo323", profilePicture: "person-2", city: "Caracas, Venezuela", isVerified: true),
            .init(userName: "joshuea_1", profilePicture: "person-3", city: "Miami, US", isVerified: false),
            .init(userName: "themoon", profilePicture: "person-4", city: "London, UK", isVerified: false),
            .init(userName: "hero_232", profilePicture: "person-5", city: "Montreal, Canada", isVerified: true),
            .init(userName: "theWorld_2", profilePicture: "person-6", city: "New York, US", isVerified: false),
            .init(userName: "doggg", profilePicture: "person-7", city: "Beijing, China", isVerified: false),
            .init(userName: "someone", profilePicture: "person-8", city: "Rome, Italy", isVerified: true),
            .init(userName: "VictorRoldan", profilePicture: "victorroldan.dev", city: "Caracas, Venezuela", isVerified: true),
        ]
    }
}

struct StoryModel: Identifiable{
    let id = UUID()
    var user: UserModel
    let isLive: Bool
    
    static func getStories() -> [Self]{
        return UserModel.getUsers().map{StoryModel(user: $0, isLive: ([true, false].randomElement())!)}
    }
}

struct TimeLineModel: Identifiable{
    let id = UUID()
    let photo: String
    let user: UserModel
    
    static func getPosts() -> [Self]{
        return (1..<10).map{TimeLineModel(photo: "post-\($0)", user: UserModel.getUsers().randomElement()!)}
    }
}

struct CommentsModel: Identifiable{
    let id = UUID()
    let comment: String
    
    static func getComments() -> [Self]{
        return [
            .init(comment: "Excuse me, folks. Everyone needs to double-tap on this picture ASAP. It’s the most beautiful thing you will ever see."),
            .init(comment: "Live for the moments you cannot put in words."),
            .init(comment: "So you have been this cool since day one?"),
            .init(comment: "This picture needs to illustrate the word fun in the dictionary."),
            .init(comment: "This is a perfect example of a quality portrait of a quality human being.")
        ]
    }
}
