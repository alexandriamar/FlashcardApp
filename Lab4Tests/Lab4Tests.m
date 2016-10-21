//
//  Lab4Tests.m
//  Lab4Tests
//
//  Created by Alexandria Mar on 10/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import <XCTest/XCTest.h>
#include "FlashcardsModel.h"

@interface Lab4Tests : XCTestCase
@property (strong, nonatomic) FlashcardsModel *testModel;
@end

@implementation Lab4Tests


- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.testModel = [[FlashcardsModel alloc] init];
    NSLog(@"Set-up: %lu", (unsigned long)[self.testModel numberOfFlashcards]);
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void) logArray {
    Flashcard *flashcard;
    for (NSUInteger i = 0; i < [self.testModel numberOfFlashcards]; i++) {
        flashcard = [self.testModel flashcardAtIndex:i];
        NSLog(@"%@", flashcard);
    }
}

- (void) testFlashcardModel {
    // local variables
    NSMutableArray *questions;
    NSUInteger num;
    
    // test init
    num = 5;
    XCTAssertEqual(num, [self.testModel numberOfFlashcards]);
    NSLog(@"Initial array:");
    [self logArray];
    
    // test insert
    Flashcard *newFlashcard = [[Flashcard alloc] initWithQuestion:@"What is the capital of Tennessee?" answer:@"Nashville" isFavorite:FALSE];
    [questions insertObject:newFlashcard atIndex:num];
    XCTAssertEqual([self.testModel numberOfFlashcards], num);
    [self logArray];
    
    // test remove
    [self.testModel removeFlashcardAtIndex:0];
    num = num - 1;
    XCTAssertEqual(num, [self.testModel numberOfFlashcards]);
    NSLog(@"Remove the first student: ");
    [self logArray];
    
}

@end
