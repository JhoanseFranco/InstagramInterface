//
//  TimeLineView.swift
//  InstagramInterface
//
//  Created by jhoan sebastian franco cardona on 15/11/22.
//

import SwiftUI

struct TimeLineView: View {
    let timeLine: TimeLineModel
    var body: some View {
        VStack{
            headerView
            postImage
            actionsIcons
            likeSection
            commentSection
        }
    }
    var headerView: some View{
        HStack{
            Image(timeLine.user.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 32, height: 32)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 2){
                HStack {
                    Text(timeLine.user.userName)
                        .font(.system(size: 13, weight: .bold))
                    if timeLine.user.isVerified{
                        Image("official-icon")
                            .frame(width: 10, height: 10)
                    }
                }
                Text(timeLine.user.city)
                    .font(.system(size: 11))
            }
            Spacer()
            Button(action: {}) {
                Image("more-icon")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
    }
    
    var postImage: some View{
        Image(timeLine.photo)
            .resizable()
            .frame(height: UIScreen.main.bounds.width)
            .frame(maxWidth: .infinity)
            .aspectRatio(contentMode: .fill)
    }
    
    var actionsIcons: some View{
        HStack(spacing: 17){
            Button(action: {}) {
                Image("like")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            }
            Button(action: {}) {
                Image("comment")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            }
            Button(action: {}) {
                Image("messanger")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            }
            Spacer()
            Button(action: {}) {
                Image("save")
                    .renderingMode(.template)
                    .foregroundColor(Color("primary"))
            }
        }
        .frame(width: .infinity)
        .padding(.horizontal, 14)
    }
    
    var likeSection: some View{
        HStack{
            Image(UserModel.getUsers().randomElement()!.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 17, height: 17)
                .clipShape(Circle())
            Text("Liked By ")
            + Text(UserModel.getUsers().randomElement()!.userName).bold()
            + Text(" and ")
            + Text("44,000 others").bold()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
    }
    
    var commentSection: some View{
        HStack{
            Text(timeLine.user.userName).bold()
            + Text(CommentsModel.getComments().randomElement()!.comment)
        }
        .font(.system(size: 13))
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 14)
    }
}

struct TimeLineView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimeLineView(timeLine: TimeLineModel.getPosts()[0])
                .preferredColorScheme(.dark)
            
        }
    }
}
