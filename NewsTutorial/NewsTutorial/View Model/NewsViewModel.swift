//
//  NewsViewModel.swift
//  NewsTutorial
//
//  Created by Bera Bekir Baykal on 10.05.2024.
//

import Foundation

struct NewsTableViewModel {
    
    let newsList: [News]
    
    func numberOfRowsInSection() -> Int {
        return self.newsList.count
    }
    
    func newsAtIndexPath(_ index: Int) -> NewsViewModel {
        let news = self.newsList[index]
        return NewsViewModel(news: news)
    }
}

extension String {
    func test() {
        print("test")
    }
}

struct NewsViewModel {
    
    let news: News
    
    var title : String {
        return self.news.title
    }
    
    var story: String {
        return self.news.story
    }
}
