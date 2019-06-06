#import <LocalAuthentication/LocalAuthentication.h>

%hook PXNavigationListGadget

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row == 1) {
		LAContext *context = [LAContext new];
		NSError *authError = nil;
		if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
			[context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:NSLocalizedString(@"Unlock hidden Photos album", nil) reply:^(BOOL success, NSError *error) {
				dispatch_async(dispatch_get_main_queue(), ^{
					if (success) {
						%orig;
					} else {
						[tableView deselectRowAtIndexPath:indexPath animated:YES];
					}
				});
			}];
		} else {
			[tableView deselectRowAtIndexPath:indexPath animated:YES];
		}
	} else {
		%orig;
	}
}

%end

%ctor {
	HBLogDebug(@"%@", @"DFSFSDFS");
}