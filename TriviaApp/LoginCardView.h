//
//  LoginCardView.h
//  MyTrivie
//
//  Created by Jennifer Duffey on 1/15/15.
//  Copyright (c) 2015 Jennifer Duffey. All rights reserved.
//

#import "CardView.h"

@interface LoginCardView : CardView

@property (nonatomic, weak) IBOutlet UITextField *usernameTF, *emailTF, *passwordTF, *confirmPasswordTF;

@property (nonatomic, strong) IBOutlet NSLayoutConstraint *leftConstraint, *rightConstraint;

@end
