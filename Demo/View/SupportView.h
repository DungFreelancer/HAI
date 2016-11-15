//
//  SupportView.h
//  Demo
//
//  Created by Dung Do on 11/13/16.
//  Copyright © 2016 Dung Do. All rights reserved.
//

#import "BaseView.h"

@interface SupportView : BaseView <UIGestureRecognizerDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *txtComment;
@property (weak, nonatomic) IBOutlet UIButton *btnSendRequest;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segType;

- (IBAction)onClickSendRequest:(id)sender;

@end
