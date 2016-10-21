//
//  FlashcardsModel.m
//  Lab4
//
//  Created by Alexandria Mar on 10/18/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import "FlashcardsModel.h"

@interface FlashcardsModel()

@property (nonatomic, strong) NSMutableArray *flashcards;
@property (readwrite) NSUInteger currentIndex;

@end

@implementation FlashcardsModel


- (instancetype)init
{
    self = [super init];
    if (self) {
        Flashcard *flashcard1 = [[Flashcard alloc] initWithQuestion:@"What is the capital of Washington?" answer:@"Olympia" isFavorite:FALSE];
        Flashcard *flashcard2 = [[Flashcard alloc] initWithQuestion:@"What is the capital of Oregon?" answer:@"Salem" isFavorite:FALSE];
        Flashcard *flashcard3 = [[Flashcard alloc] initWithQuestion:@"What is the capital of California?" answer:@"Sacramento" isFavorite:FALSE];
        Flashcard *flashcard4 = [[Flashcard alloc] initWithQuestion:@"What is the capital of Texas?" answer:@"Austin" isFavorite:FALSE];
        Flashcard *flashcard5 = [[Flashcard alloc] initWithQuestion:@"What is the capital of Kansas?" answer:@"Topeka" isFavorite:FALSE];
        _flashcards = [[NSMutableArray alloc] initWithObjects: flashcard1, flashcard2, flashcard3, flashcard4, flashcard5, nil];
        

    }
    self.currentIndex = 0;
    return self;
}
+ (instancetype) sharedModel {
    static FlashcardsModel *_sharedModel = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedModel = [[self alloc] init];
    });
    
    return _sharedModel;
}

- (NSUInteger) numberOfFlashcards {
    return self.flashcards.count;
}

- (Flashcard *) randomFlashcard {
    NSUInteger index = random() % [self numberOfFlashcards];
    self.currentIndex = index;
    return [self flashcardAtIndex:index];
}
- (Flashcard *) flashcardAtIndex: (NSUInteger) index {
    return [self.flashcards objectAtIndex:index];
}
- (Flashcard *) nextFlashcard {
    if ((int)self.currentIndex < [self numberOfFlashcards] - 1)
    {
        self.currentIndex += 1;
    }
    else self.currentIndex = 0;
    return [self.flashcards objectAtIndex:(self.currentIndex)];
}
- (Flashcard *) prevFlashcard {
    if (self.currentIndex > 0){
        self.currentIndex = (self.currentIndex - 1);
    }
    else self.currentIndex = [self numberOfFlashcards] - 1;
    
    return [self.flashcards objectAtIndex:(self.currentIndex)];
}

- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (BOOL) fav {
    [self.flashcards addObject:[NSMutableArray arrayWithObjects:question, ans, fav, nil]];
}

- (void) insertWithQuestion: (NSString *) question
                     answer: (NSString *) ans
                   favorite: (NSNumber *) fav
                    atIndex: (NSUInteger) index {
    NSUInteger numFlashcards = [self numberOfFlashcards];
    if (index <= numFlashcards) {
        [self.flashcards insertObject:[NSMutableArray arrayWithObjects:question, ans, fav, nil]  atIndex:index];
    }
}

- (void) removeFlashcard {
    [self.flashcards removeLastObject];
}

- (void) removeFlashcardAtIndex: (NSUInteger) index {
    if (index < self.flashcards.count) {
        [self.flashcards removeObjectAtIndex:index];
    }
}

- (void) toggleFavorite {
    [[self.flashcards objectAtIndex:self.currentIndex] setIsFavorite: ![[self.flashcards objectAtIndex:self.currentIndex] isFavorite]];
}

- (NSArray *) favoriteFlashcards {
    NSMutableArray *faveFlashcards;
    for (NSUInteger i = 0; i < [self numberOfFlashcards]; i++) {
        if ([[self flashcardAtIndex:i] isFavorite]) {
            [faveFlashcards addObject:[self flashcardAtIndex:i]];
        }
    }
    return faveFlashcards;
}

@end
