//
//  ViewModel.swift
//  InstagramInterface
//
//  Created by jhoan sebastian franco cardona on 12/11/22.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var timelineList = [TimeLineModel]()
    @Published var storyList = [StoryModel]()
    
    init(){
        self.timelineList = TimeLineModel.getPosts()
        self.storyList = StoryModel.getStories()
    }
}
