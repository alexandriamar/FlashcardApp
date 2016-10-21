//
//  ViewController.m
//  Lab4
//
//  Created by Alexandria Mar on 10/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import "ViewController.h"
#include "FlashcardsModel.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;

@property (nonatomic, strong) FlashcardsModel *flashcardsModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.flashcardsModel = [FlashcardsModel sharedModel];
    Flashcard *randomFlashcard = [self.flashcardsModel randomFlashcard];
    self.questionLabel.text = [randomFlashcard question];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapRecognized:)];
    [self.view addGestureRecognizer:singleTap];
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget: self action:@selector(doubleTapRecognized:)];
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftGestureRecognized:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightGestureRecognized:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) singleTapRecognized : (UITapGestureRecognizer *) recognizer {
    Flashcard* randomFlashcard = [self.flashcardsModel randomFlashcard];
    [self displayQuestion:[randomFlashcard question]];
}

- (void) doubleTapRecognized : (UITapGestureRecognizer *) recognizer {
    Flashcard* currentFlashcard = [self.flashcardsModel flashcardAtIndex:[self.flashcardsModel currentIndex]];
    if (self.questionLabel.text == [currentFlashcard question]) {
        self.questionLabel.textColor = UIColor.blackColor;
        [self displayQuestionNewColors:[currentFlashcard ans]];
    }
    else {
        [self displayQuestionNewColors:[currentFlashcard question]];
    }
}

- (void) swipeRightGestureRecognized : (UISwipeGestureRecognizer *) swipeRight {
    Flashcard* nextFlashcard = [self.flashcardsModel nextFlashcard];
    if (self.questionLabel.textColor != UIColor.blackColor) {
        [self displayQuestionNewColors:[nextFlashcard question]];
    }
    else {
        [self displayQuestion:[nextFlashcard question]];
    }
}

- (void) swipeLeftGestureRecognized : (UISwipeGestureRecognizer *) swipeLeft {
    Flashcard* previousFlashcard = [self.flashcardsModel prevFlashcard];
    if (self.questionLabel.textColor != UIColor.blackColor) {
        [self displayQuestionNewColors:[previousFlashcard question]];
    }
    else {
        [self displayQuestion:[previousFlashcard question]];
    }
}

- (void) fadeInQuestion: (NSString *) question {
    self.questionLabel.text = question;
    if (self.questionLabel.textColor == UIColor.blackColor) {
        self.questionLabel.textColor = [UIColor colorWithRed:(153.0f/225.0f) green:0.0 blue:0.0 alpha:1.0];
    }
    else {
        self.questionLabel.textColor = UIColor.blackColor;
    }
    
    [UIView animateWithDuration:1.0 animations:^ {
        self.questionLabel.alpha = 1;
    }];
}

- (void) animateStudent: (NSString *) question {
    self.questionLabel.text = question;
    [UIView animateWithDuration:1.0 animations:^{
        self.questionLabel.alpha = 1;
    }];
}

- (void) displayQuestion: (NSString *) question {
    [UIView animateWithDuration:1.0 animations:^{
        self.questionLabel.alpha = 0;
    }
                     completion:^(BOOL finished) {
                         [self animateStudent:question];
                     }];
}

- (void) displayQuestionNewColors: (NSString *) question {
    [UIView animateWithDuration:1.0 animations:^{
        self.questionLabel.alpha = 0;
    }
                     completion:^(BOOL finished) {
                         [self fadeInQuestion:question];
                     }];
}


@end
