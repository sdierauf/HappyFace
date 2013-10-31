//
//  HappyViewController.m
//  HappyFace
//
//  Created by Stefan Dierauf on 7/17/13.
//  Copyright (c) 2013 Stefan Dierauf. All rights reserved.
//

#import "HappyViewController.h"
#import "FaceView.h"

@interface HappyViewController () <FaceViewDataSource>

@property (nonatomic, weak) IBOutlet FaceView *faceView;

@end

@implementation HappyViewController
@synthesize happiness = _happiness;
@synthesize faceView = _faceView;

- (float)smileForFaceView:(FaceView *)sender {
    return (self.happiness - 50.0) / 50.0;
}

- (void)setHappiness:(int)happiness {
    _happiness = happiness;
    [self.faceView setNeedsDisplay]; 
}

- (void)setFaceView:(FaceView *)faceView {
    _faceView = faceView;
    [self.faceView addGestureRecognizer:[[UIPinchGestureRecognizer alloc] initWithTarget:self.faceView action:@selector(pinch:)]];
    [self.faceView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleHappinessGesture:)]];
    self.faceView.dataSource = self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (void)handleHappinessGesture:(UIPanGestureRecognizer *)gesture {
    if ((gesture.state == UIGestureRecognizerStateChanged) || (gesture.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [gesture translationInView:self.faceView];
        self.happiness -= translation.y / 2;
        [gesture setTranslation:CGPointZero inView:self.faceView]; //makes gradual pan 
    }
}


@end
