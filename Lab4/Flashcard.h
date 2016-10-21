//
//  Flashcard.h
//  Lab4
//
//  Created by Alexandria Mar on 10/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flashcard : NSObject

@property (readonly) NSString *question;
@property (readonly) NSString *ans;
@property BOOL isFavorite;

- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans;
- (instancetype) initWithQuestion: (NSString *) question
                           answer: (NSString *) ans
                       isFavorite: (BOOL) isFav;


@end
