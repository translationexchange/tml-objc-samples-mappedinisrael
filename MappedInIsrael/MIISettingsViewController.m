//
//  MIISettingsViewController.m
//  MappedInIsrael
//
//  Created by Michael Berkovich on 11/18/14.
//  Copyright (c) 2014 Genady Okrain. All rights reserved.
//

#import "MIISettingsViewController.h"
#import "UIViewController+Tml.h"
#import "Tml.h"

@interface MIISettingsViewController ()

@end

@implementation MIISettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                          target:self
                                                                                          action:@selector(dismiss:)];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(localize)
                                                 name:TmlLanguageChangedNotification
                                               object:self.view.window];

    [self localize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) localize {
    self.navigationItem.title = TmlLocalizedString(@"Settings");
    self.navigationItem.leftBarButtonItem.title = TmlLocalizedStringWithDescription(@"Done", @"Finished updating settings");
    TmlLocalizeView(self.tableView);
    [self.tableView reloadData];
}

- (void)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return TmlLocalizedString(@"Localization");
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            TmlChangeLanguage(self);
        } else if (indexPath.row == 1) {
            TmlToggleInAppTranslations(self);
        } else if (indexPath.row == 2) {
            TmlOpenTranslatorTools(self);
        }
        return;
    }
}


@end
