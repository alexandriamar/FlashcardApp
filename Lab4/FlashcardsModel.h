//
//  FlashcardsModel.h
//  Lab4
//
//  Created by Alexandria Mar on 10/18/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Flashcard.h"


@interface FlashcardsModel : NSObject

@property (readonly) NSUInteger currentIndex;

// Creating the model
+ (instancetype) sharedModel;

// Accessing number of flashcards in model
- (NSUInteger) numberOfFlashcards;

// Accessing a flashcard – sets currentIndex appropriately
- (Flashcard *) randomFlashcard;
- (Flashcard *) flashcardAtIndex: (NSUInteger) index;
- (Flashcard *) nextFlashcard;
- (Flashcard *) prevFlashcard;

// Inserting a flashcard
- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (BOOL) fav;

- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (NSNumber *) fav
                    atIndex: (NSUInteger) index;

// Removing a flashcard
- (void) removeFlashcard;
- (void) removeFlashcardAtIndex: (NSUInteger) index;

// Favorite/unfavorite the current flashcard
- (void) toggleFavorite;

// Getting the favorite flashcards
- (NSArray *) favoriteFlashcards;

@end
