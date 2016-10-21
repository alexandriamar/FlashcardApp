//
//  Flashcard.m
//  Lab4
//
//  Created by Alexandria Mar on 10/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import "Flashcard.h"
@interface Flashcard()

@property (readwrite) NSString *question;
@property (readwrite) NSString *ans;

@end

@implementation Flashcard

- (instancetype) initWithQuestion:(NSString *)question
                           answer:(NSString *)ans {
    self.question = question;
    self.ans = ans;
    return self;
}

- (instancetype) initWithQuestion:(NSString *)question answer:(NSString *)ans isFavorite:(BOOL)isFav {
    self.question = question;
    self.ans = ans;
    self.isFavorite = isFav;
    return self;
}

@end
