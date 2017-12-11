//
//  ViewController.m
//  Contacts
//
//  Created by mega on 2017/12/11.
//  Copyright © 2017年 mega. All rights reserved.
//

#import "ContactsViewController.h"
//#import "Contacts-Swift.h"
#import "Contacts-Swift.h"

@interface ContactsViewController ()

@property (nonatomic, readonly, strong) NSMutableArray *contacts;

@end

@implementation ContactsViewController

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
//        NSArray *contactArray = @[@"tom", @"hanmm", @"lilei"];
//        _contacts = [NSArray arrayWithArray:contactArray];
        
//        Contact *c1 = [[Contact alloc] initWithName: @"tom"];
//        Contact *c2 = [[Contact alloc] initWithName: @"hanmm"];
//        Contact *c3 = [[Contact alloc] initWithName: @"lilei"];
        
        _contacts = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    Contact *contact = self.contacts[indexPath.row];
    cell.textLabel.text = contact.name;
    return cell;
}

// unwind segue method
- (IBAction) cancelToContactsViewController:(UIStoryboardSegue *) segue {
    NSLog(@"...");
}

- (IBAction) createNewContact:(UIStoryboardSegue *) segue {
    NewContactViewController *newContactCtrl = segue.sourceViewController;
    NSString *firstName = newContactCtrl.firstNameTextField.text;
    NSString *lastName = newContactCtrl.lastNameTextField.text;
    if (firstName.length != 0 && lastName.length != 0) {
        NSString *name = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        Contact *newContact = [[Contact alloc] initWithName:name];
        [self.contacts addObject:newContact];
        [self.tableView reloadData];
    }
}

@end
