
/*
	This is our interface (header) declaration. 
	This tells the compiler that it can assume this class (IGAuthHelper) exists at runtime.
	We know it exists because it was in the dumped headers for this app. (iphonedevwiki is your friend)
*/
@interface IGAuthHelper
- (_Bool)passesMultipleAccountsQE;
- (_Bool)hasMultipleAccounts;
/*
	The above methods are what we want to override.
*/
@end

/*
	This is our hook block.
	This says that anything inside here belongs to the IGAuthHelper class.
*/
%hook IGAuthHelper

//This declares that we want to hook into this method (passesMultipleAccountsQE)
- (_Bool)passesMultipleAccountsQE {
/*
	Any code you write in this block (curly brackets)
	means that it'll run when this method runs. We can
	call the original implementation (code) that is supposed to run normally with
	%orig
	but we don't care about that here (usually you do care). We just want Instagram to
	think we should be able to use multiple accounts.
*/

	//This means that this method will return YES (true) when it runs.
	return YES;
}

- (_Bool)hasMultipleAccounts {
	return YES;
}

%end //close our IGAuthHelper hook block

//The code might look easier to read and understand for you if you copy paste into a new file and delete the comments.