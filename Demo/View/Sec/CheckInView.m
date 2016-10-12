//
//  Sec.m
//  Demo
//
//  Created by Dung Do on 9/19/16.
//  Copyright © 2016 Dung Do. All rights reserved.
//

#import "CheckInView.h"
#import "SWRevealViewController.h"
#import "AFNHelper.h"
#import "UtilityClass.h"
#import "Constant.h"

@interface CheckInView ()

@end

@implementation CheckInView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if (revealViewController)
    {
        [self.siderbarButton setTarget: self.revealViewController];
        [self.siderbarButton setAction: @selector(revealToggle:)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    self.txtStore.delegate = self;
    self.txtContent.delegate = self;
    self.txtSender.delegate = self;
    
    // Border button
    self.btnCheckIn.layer.cornerRadius = 5;
    self.btnCheckIn.layer.borderWidth = 1;
    self.btnCheckIn.layer.borderColor = self.btnCheckIn.tintColor.CGColor;
    self.btnCheckIn.layer.masksToBounds = true;
}

- (IBAction)takeAPicture:(UIButton *)sender {
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.allowsEditing = TRUE;
    [self presentViewController:imagePickerController animated:TRUE completion:nil];
}

- (IBAction)checkIn:(UIButton *)sender {
    
    if ([[UtilityClass sharedInstance] connected]) {
        NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
        [params setObject:self.txtStore.text forKey:PARAM_NAME];
        [params setObject:self.txtStore.text forKey:PARAM_CONTENT];
        [params setObject:self.txtStore.text forKey:PARAM_User];
        
        [[AFNHelper sharedInstance] request:API_CHECK_IN paramaters:params image:self.imgAvatar.image completion:^(id response, NSError *error) {
            DLOG(@"respone=%@", response);
            if ([[response valueForKey:@"success"] boolValue]) {
                [[UtilityClass sharedInstance] showAlertOnViewController:self withTitle:@"Success" andMessage:@"Check in complete." andButton:@"OK"];
            } else {
                [[UtilityClass sharedInstance] showAlertOnViewController:self withTitle:@"Fail" andMessage:@"Can't check in." andButton:@"OK"];
            }
        }];
    } else {
        [[UtilityClass sharedInstance] showAlertOnViewController:self withTitle:@"Fail" andMessage:@"Can't connect to internet." andButton:@"OK"];
        // ToDo: store to database
    }
}

// UIImagePickerControllerDelegate.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [self.imgAvatar setImage:[info valueForKey:UIImagePickerControllerEditedImage]];
    [picker dismissViewControllerAnimated:TRUE completion:nil];
}

// UITextFieldDelefate.
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

@end
