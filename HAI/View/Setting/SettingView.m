//
//  CheckInView.m
//  HAI
//
//  Created by Dung Do on 11/12/16.
//  Copyright © 2016 Dung Do. All rights reserved.
//

#import "SettingView.h"
#import "NetworkHelper.h"
#import "UtilityClass.h"
#import "HUDHelper.h"
#import "CheckInViewModel.h"
#import "Constant.h"
#import <Firebase.h>

@implementation SettingView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setBackBarItem];
    self.navigationController.navigationBarHidden = NO;
}


// MARK: - UITextFieldDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self logoutApp];
        } else if (indexPath.row == 1) {
            
        }
        
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            
        }
    }
}

- (void)logoutApp {
    if ([[NetworkHelper sharedInstance]  isConnected] == NO) {
        ELOG(@"%@", NSLocalizedString(@"NO_INTERNET", nil));
        [[UtilityClass sharedInstance] showAlertOnViewController:self
                                                       withTitle:NSLocalizedString(@"ERROR", nil)
                                                      andMessage:NSLocalizedString(@"NO_INTERNET", nil)
                                                       andButton:NSLocalizedString(@"OK", nil)];
        return;
    }
    
    CheckInViewModel *vmCheckIn = [[CheckInViewModel alloc] init];
    
    if ([vmCheckIn numberOfUnsended] > 0) {
        [[UtilityClass sharedInstance] showAlertOnViewController:self
                                                       withTitle:nil
                                                      andMessage:NSLocalizedString(@"SETTING_WARRNING", nil)
                                                   andMainButton:NSLocalizedString(@"NO", nil)
                                               CompletionHandler:nil
                                                  andOtherButton:NSLocalizedString(@"YES", nil)
                                               CompletionHandler:^(UIAlertAction *action) {
                                                   [self logoutUser];
                                               }];
        
    } else {
        [[UtilityClass sharedInstance] showAlertOnViewController:self
                                                       withTitle:nil
                                                      andMessage:NSLocalizedString(@"SETTING_LOGOUT", nil)
                                                   andMainButton:NSLocalizedString(@"NO", nil)
                                               CompletionHandler:nil
                                                  andOtherButton:NSLocalizedString(@"YES", nil)
                                               CompletionHandler:^(UIAlertAction *action) {
                                                   [self logoutUser];
                                               }];
    }
}

- (void)logoutUser {
    if ([[NetworkHelper sharedInstance] isConnected] == NO) {
        ELOG(@"%@", NSLocalizedString(@"NO_INTERNET", nil));
        [[UtilityClass sharedInstance] showAlertOnViewController:self
                                                       withTitle:NSLocalizedString(@"ERROR", nil)
                                                      andMessage:NSLocalizedString(@"NO_INTERNET", nil)
                                                       andButton:NSLocalizedString(@"OK", nil)];
        return;
    }
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:[USER_DEFAULT objectForKey:PREF_USER] forKey:PARAM_USER];
    [params setObject:[USER_DEFAULT objectForKey:PREF_TOKEN] forKey:PARAM_TOKEN];
    
    [[HUDHelper sharedInstance] showLoadingWithTitle:NSLocalizedString(@"LOADING", nil) onView:self.view];
    
    [[NetworkHelper sharedInstance] requestPost:API_LOGOUT paramaters:params completion:^(id response, NSError *error) {
        
        [[HUDHelper sharedInstance] hideLoading];
        if ([[response valueForKey:RESPONSE_ID] isEqualToString:@"1"]) {
            DLOG(@"%@", response);
            // Unsubscribe all topics.
            NSArray<NSString *> *arrtopic = [USER_DEFAULT objectForKey:RESPONSE_TOPICS];
            for (NSString *topic in arrtopic) {
                NSString *name = [NSString stringWithFormat:@"/topics/%@", topic];
                [[FIRMessaging messaging] unsubscribeFromTopic:name];
            }
            
            [USER_DEFAULT removeObjectForKey:PREF_TOPICS];
            [USER_DEFAULT setBool:NO forKey:PREF_ALRAEDY_LOGIN];
            [USER_DEFAULT synchronize];
            
            self.navigationController.navigationBarHidden = YES;
            [self.navigationController popToRootViewControllerAnimated:YES];
        } else {
            ELOG(@"%@", response);
            [[UtilityClass sharedInstance] showAlertOnViewController:self
                                                           withTitle:NSLocalizedString(@"ERROR", nil)
                                                          andMessage:[response valueForKey:RESPONSE_MESSAGE] //NSLocalizedString(@"SETTING_LOGOUT_ERROR", nil)
                                                           andButton:NSLocalizedString(@"OK", nil)];
        }
    }];
}

- (void)setBackBarItem {
    UIButton *btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLeft.frame = CGRectMake(0, 0, 30, 30);
    [btnLeft addTarget:self action:@selector(onClickBackBarItem:) forControlEvents:UIControlEventTouchUpInside];
    [btnLeft setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11")) {
        [btnLeft.widthAnchor constraintEqualToConstant:30].active = YES;
        [btnLeft.heightAnchor constraintEqualToConstant:30].active = YES;
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnLeft];
    self.navigationItem.hidesBackButton = YES;
}

- (void)onClickBackBarItem:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
