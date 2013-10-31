//
//  FaceView.h
//  HappyFace
//
//  Created by Stefan Dierauf on 7/17/13.
//  Copyright (c) 2013 Stefan Dierauf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FaceView;

@protocol FaceViewDataSource <NSObject>

- (float)smileForFaceView:(FaceView *)sender;

@end

@interface FaceView : UIView

@property (nonatomic) CGFloat scale;
- (void)pinch:(UIPinchGestureRecognizer *)gesture;
@property (nonatomic, weak) IBOutlet id <FaceViewDataSource> dataSource; //dataSource MUST implement smileForFaceView 

@end
